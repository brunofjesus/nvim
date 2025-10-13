return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        pick = nil,
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]
      },
      sections = {
        { section = 'header' },
        {
          section = "keys",
          indent = 1,
          padding = 1,
        },
        { section = 'recent_files', icon = ' ', title = 'Recent Files', indent = 3, padding = 2 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    picker = {},
    terminal = {},
  },
  keys = {
    { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
    { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
    { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
    { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
    { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
    { "<leader>wd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>wo",      function() Snacks.bufdelete.other() end,                                desc = "Delete Other Buffers" },
    { "<leader>wa",      function() Snacks.bufdelete.all() end,                                  desc = "Delete All Buffers" },
    { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",                  mode = { "n", "v" } },
    { "<leader>gb",      function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gf",      function() Snacks.lazygit.log_file() end,                               desc = "Lazygit Current File History" },
    { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>gl",      function() Snacks.lazygit.log() end,                                    desc = "Lazygit Log (cwd)" },
    { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
    { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",              mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",              mode = { "n", "t" } },
    -- Snacks
    --{
    --  "<leader>N",
    --  desc = "Neovim News",
    --  function()
    --    Snacks.win({
    --      file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    --      width = 0.6,
    --      height = 0.6,
    --      wo = {
    --        spell = false,
    --        wrap = false,
    --        signcolumn = "yes",
    --        statuscolumn = " ",
    --        conceallevel = 3,
    --      },
    --    })
    --  end,
    --}
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader><space>", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    -- find
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fs",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git (kind of redundant to the lazygit actions)
    -- { "<leader>gc",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    -- { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    -- { "<leader>gt",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",    mode = { "n", "x" } },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics() end,                             desc = "Cwd Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sx",      function() Snacks.picker.smart() end,                                   desc = "Smart Pick" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    { "<leader>qp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>ub",      function() vim.cmd("ToggleDarkMode") end,                               desc = "Dark Mode" },
    -- LSP
    { "gra",             vim.lsp.buf.code_action,                                                desc = "Code Action" },
    { "grd",             function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "grn",             vim.lsp.buf.rename,                                                     desc = "Smart rename" },
    { "grr",             function() Snacks.picker.lsp_references() end,                          nowait = true,                        desc = "References" },
    { "gri",             function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "grt",             function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto Type Definition" },
    { "gO",              function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>o",       function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    -- Explorer
    { "<leader>e",       function() Snacks.picker.explorer() end,                                desc = "Explorer" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })

    -- Disable animations when using BlinkCmp
    -- https://github.com/Saghen/blink.cmp/issues/1338#issuecomment-2708402335
    local ui_helpers = vim.api.nvim_create_augroup("UiHelpers", { clear = true })
    -- disable buggy anims in completion windows
    vim.api.nvim_create_autocmd("User", {
      group = ui_helpers,
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        vim.g.snacks_animate = false
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      group = ui_helpers,
      pattern = "BlinkCmpMenuClose",
      callback = function()
        vim.g.snacks_animate = true
      end,
    })
  end,
}
