-- Function to get the git repository root directory
local function get_git_root()
  -- Use vim.fn.system to run git rev-parse command
  local git_root = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))

  -- Check if the command was successful
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repository", vim.log.levels.ERROR)
    return nil
  end

  return git_root
end

-- Function to check if a directory exists
local function dir_exists(path)
  return vim.fn.isdirectory(path) == 1
end

-- Function to parse YAML workflow files and extract workflow names
local function parse_workflow_files(workflows_dir)
  local workflow_files = vim.fn.glob(workflows_dir .. "/*.{yml,yaml}", true, true)
  local workflows = {}

  for _, file_path in ipairs(workflow_files) do
    local file = io.open(file_path, "r")
    if file then
      local content = file:read("*a")
      file:close()

      -- Simple YAML parsing to extract the name property
      local name = content:match("name:%s*(.-)%s*\n")
      if name then
        -- Remove possible quotes around the name
        name = name:gsub('^"(.-)"$', '%1'):gsub("^'(.-)'$", '%1')
        -- Use relative file path as key
        local rel_path = file_path:gsub(workflows_dir .. "/", "")
        workflows[rel_path] = name
      end
    end
  end

  return workflows
end


vim.api.nvim_create_user_command(
  'GitHubWorkflows',
  function()
    -- Get git repository root
    local repo_root = get_git_root()
    if not repo_root then
      vim.notify("Not in a git repository", vim.log.levels.ERROR)
      return
    end
    vim.notify("Git repository root: " .. repo_root, vim.log.levels.INFO)

    -- Check if .github/workflows directory exists
    local workflows_dir = repo_root .. "/.github/workflows"
    if not dir_exists(workflows_dir) then
      vim.notify("No .github/workflows directory found", vim.log.levels.WARN)
      return
    end

    -- Parse workflow files
    local workflows = parse_workflow_files(workflows_dir)

    if vim.tbl_isempty(workflows) then
      vim.notify("No workflow files found in .github/workflows", vim.log.levels.WARN)
      return
    end

    -- Convert workflows table to items for the picker
    local items = {}
    for file_path, name in pairs(workflows) do
      table.insert(items, {
        text = name,
        file = workflows_dir .. "/" .. file_path,
        ft = "yaml",
      })
    end

    -- Sort items by name
    table.sort(items, function(a, b) return a.text < b.text end)

    -- Looking at Snacks.nvim source, the correct way to define custom actions
    local open_file = function(self, item)
      -- Add a more visible notification to confirm our custom action is running
      vim.notify("Editing " .. item.text, vim.log.levels.INFO)
      vim.cmd("edit " .. item.file)
      self:close()
    end

    local open_in_browser = function(self, item)
      -- Get the relative path of the workflow file
      local rel_path = item.file:match("/.github/workflows/(.+)$")
      if not rel_path then
        vim.notify("Could not determine relative path", vim.log.levels.ERROR)
        return
      end

      -- Get the GitHub repo URL by parsing the git remote info
      local remote_url = vim.fn.trim(vim.fn.system("git config --get remote.origin.url"))
      if vim.v.shell_error ~= 0 then
        vim.notify("Could not get remote URL", vim.log.levels.ERROR)
        return
      end

      -- Convert SSH URLs to HTTPS
      local github_url = remote_url:gsub("git@github.com:", "https://github.com/"):gsub("%.git$", "")

      -- Format for HTTPS URLs
      if github_url:match("^https://github.com/[^/]+/[^/]+.git$") then
        github_url = github_url:gsub("%.git$", "")
      end

      -- Construct the full URL to the workflow file on GitHub
      local file_url = string.format("%s/actions/workflows/%s", github_url, rel_path)

      -- Open the URL in the default browser
      local open_cmd
      if vim.fn.has("mac") == 1 then
        open_cmd = "open"
      elseif vim.fn.has("unix") == 1 then
        open_cmd = "xdg-open"
      elseif vim.fn.has("win32") == 1 then
        open_cmd = "start"
      else
        vim.notify("Unsupported platform", vim.log.levels.ERROR)
        return
      end

      local cmd = string.format("%s '%s'", open_cmd, file_url)
      vim.fn.system(cmd)
      vim.notify("Opening GitHub URL: " .. file_url, vim.log.levels.INFO)
    end

    -- Define a custom picker configuration
    local workflows_picker = {
      source = "github_workflows",
      format = "text",
      items = items,
      confirm = open_file,
      win = {
        input = {
          keys = {
            ["<a-o>"] = { "open_in_browser", mode = { 'n', 'i' } },
          }
        },
      },
      actions = {
        open_in_browser = open_in_browser,
      },
      layout = "vertical", -- Use a vertical layout
      ui_select = true,    -- Enable using this picker with `vim.ui.select`
    }

    -- Create and display the custom picker
    Snacks.picker.pick(workflows_picker)
  end,
  { desc = 'List GitHub workflows' }
)
