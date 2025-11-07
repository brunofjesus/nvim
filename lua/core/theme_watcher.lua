local M = {}

-- Configuration
local THEME_FILE_PATH = vim.fn.expand("~/.config/nvim/theme.txt")
local THEME_DIR_PATH = vim.fn.expand("~/.config/nvim")
local watcher_handle = nil
local last_modified = 0

-- Function to read theme preference from file
local function read_theme_preference()
    local file = io.open(THEME_FILE_PATH, "r")
    if not file then
        -- Default to dark theme if file doesn't exist
        return "dark"
    end

    local content = file:read("*a")
    file:close()

    -- Clean up the content (remove whitespace and newlines)
    content = content:gsub("%s+", "")

    -- Validate content
    if content == "dark" or content == "light" then
        return content
    else
        -- Default to dark if invalid content
        return "dark"
    end
end

-- Function to apply theme safely (handles plugin loading timing)
local function apply_theme(theme)
    -- Use pcall to safely execute the commands in case they're not available yet
    local success = pcall(function()
        if theme == "dark" then
            vim.cmd("EnableDarkMode")
        else
            vim.cmd("DisableDarkMode")
        end
    end)

    if not success then
        print("Theme commands not available yet")
    end
end

-- Function to create the theme file if it doesn't exist
local function create_theme_file_if_missing()
    local file = io.open(THEME_FILE_PATH, "r")
    if not file then
        -- Create the file with default "dark" content
        file = io.open(THEME_FILE_PATH, "w")
        if file then
            file:write("dark")
            file:close()
            print("Created theme file at: " .. THEME_FILE_PATH)
        end
    else
        file:close()
    end
end

-- Function to get file modification time
local function get_file_mtime()
    local stat = vim.loop.fs_stat(THEME_FILE_PATH)
    return stat and stat.mtime.sec or 0
end

-- Function to handle file change
local function handle_file_change()
    local current_mtime = get_file_mtime()

    -- Only process if file was actually modified
    if current_mtime > last_modified then
        last_modified = current_mtime

        -- Debounce rapid file changes
        vim.defer_fn(function()
            local theme = read_theme_preference()
            apply_theme(theme)
            print("Theme switched to: " .. theme)
        end, 100)
    end
end

-- Function to setup file watcher (improved version)
local function setup_file_watcher()
    -- Stop existing watcher if it exists
    if watcher_handle then
        watcher_handle:stop()
        watcher_handle = nil
    end

    -- Initialize last_modified time
    last_modified = get_file_mtime()

    -- Watch the directory instead of just the file to handle file replacements
    watcher_handle = vim.loop.new_fs_event()
    if not watcher_handle then
        print("Failed to create file watcher")
        return
    end

    -- Start watching the directory containing the theme file
    local success = watcher_handle:start(THEME_DIR_PATH, { recursive = false }, function(err, filename, events)
        if err then
            print("File watcher error: " .. err)
            -- Try to restart the watcher
            vim.defer_fn(setup_file_watcher, 1000)
            return
        end

        -- Only process changes to our specific file
        if filename == "theme.txt" then
            handle_file_change()
        end
    end)

    if not success then
        print("Failed to start directory watcher, falling back to file watcher")

        -- Fallback: try to watch the file directly
        watcher_handle = vim.loop.new_fs_event()
        if watcher_handle then
            success = watcher_handle:start(THEME_FILE_PATH, {}, function(err)
                if err then
                    print("File watcher error: " .. err)
                    return
                end
                handle_file_change()
            end)

            if not success then
                print("Failed to start file watcher")
                watcher_handle = nil
            end
        end
    end
end

-- Function to initialize the theme system
function M.setup()
    -- Create theme file if it doesn't exist
    create_theme_file_if_missing()

    -- Set up autocmd to initialize theme after plugins are loaded
    vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("ThemeWatcher", { clear = true }),
        callback = function()
            -- Wait a bit more for plugins to fully load
            vim.defer_fn(function()
                local theme = read_theme_preference()
                apply_theme(theme)
                setup_file_watcher()
                print("Theme watcher initialized with: " .. theme)
            end, 100)
        end
    })

    -- Clean up watcher on exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = vim.api.nvim_create_augroup("ThemeWatcherCleanup", { clear = true }),
        callback = function()
            if watcher_handle then
                watcher_handle:stop()
                watcher_handle = nil
            end
        end
    })
end

-- Manual functions for testing/debugging
function M.read_current_theme()
    return read_theme_preference()
end

function M.set_theme(theme)
    if theme ~= "dark" and theme ~= "light" then
        print("Invalid theme. Use 'dark' or 'light'")
        return
    end

    local file = io.open(THEME_FILE_PATH, "w")
    if file then
        file:write(theme)
        file:close()
        print("Theme set to: " .. theme)
    else
        print("Failed to write theme file")
    end
end

-- Debug function to check watcher status
function M.debug_status()
    print("Theme file path: " .. THEME_FILE_PATH)
    print("Current theme: " .. read_theme_preference())
    print("File exists: " .. tostring(vim.loop.fs_stat(THEME_FILE_PATH) ~= nil))
    print("Watcher active: " .. tostring(watcher_handle ~= nil))
    print("Last modified: " .. last_modified)
end

return M
