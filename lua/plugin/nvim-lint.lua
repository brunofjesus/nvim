return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      go = { "golangcilint" },
      php = { "phpstan" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Variable to track auto-linting state
    local auto_lint_enabled = true
    local autocmd_id = nil

    -- Function to create the autocmd
    local function create_lint_autocmd()
      return vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end

    -- Create the initial autocmd
    autocmd_id = create_lint_autocmd()

    -- Function to toggle auto-linting
    local function toggle_auto_lint()
      auto_lint_enabled = not auto_lint_enabled

      if auto_lint_enabled then
        -- Re-enable the autocmd
        autocmd_id = create_lint_autocmd()
        vim.notify("Auto-linting enabled", vim.log.levels.INFO)
        vim.keymap.set("n", "<leader>ui", toggle_auto_lint, { desc = "Disable auto-linting" })
      else
        -- Disable the autocmd
        if autocmd_id then
          vim.api.nvim_del_autocmd(autocmd_id)
          autocmd_id = nil
        end
        vim.notify("Auto-linting disabled", vim.log.levels.INFO)
        vim.keymap.set("n", "<leader>ui", toggle_auto_lint, { desc = "Enable auto-linting" })
      end
    end



    -- Key mapping to trigger manual linting
    vim.keymap.set("n", "<leader>li", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- Initial keymapping setup with the correct description
    vim.keymap.set("n", "<leader>ui", toggle_auto_lint, { desc = "Disable auto-linting" })
  end,
}
