return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  -- commit = "f9aa754", -- agentic mode is buggy and can't be disabled!
  opts = {
    --provider = "claude"
    -- api_key_name = "cmd:bw get notes anthropic-api-key", -- the shell command must prefixed with `^cmd:(.*)`
    -- api_key_name = {"bw","get","notes","anthropic-api-key"}, -- if it is a table of string, then default to command.
    mode = "legacy",
    provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
      temperature = 0,
      max_tokens = 8192,
    },
    web_search_engine = {
      provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
    },
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions = false, -- Experimental stage
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      jump_result_buffer_on_finish = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
      enable_token_counting = true,
      use_cwd_as_project_root = true,
      auto_focus_on_diff_view = false,
    },
    selector = {
      provider = "snacks",
    },
    disabled_tools = {
      "replace-in-file",
      "git-commit",
    }, ---@type string[]
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
      keys = {
        { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Render Markdown" },
      },
    },
  },
}
