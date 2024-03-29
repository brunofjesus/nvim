return {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.jobstart({"git", "-C", vim.loop.cwd(), "rev-parse"},
            {
              on_exit = function(_, return_code)
                if return_code == 0 then
                  vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                  vim.schedule(function()
                    require("lazy").load { plugins = { "gitsigns.nvim" } }
                  end)
                end
              end
            }
          )
        end,
      })
    end,
    opts = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, { desc = "Git stage hunk"})
          map('n', '<leader>hr', gs.reset_hunk, { desc = "Git reset hunk"})
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Git stage hunk" })
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Git reset hunk" })
          map('n', '<leader>hS', gs.stage_buffer, { desc = "Git stage buffer" })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
          map('n', '<leader>hR', gs.reset_buffer, { desc = "Git reset buffer" })
          map('n', '<leader>hp', gs.preview_hunk, { desc = "Git preview hunk"})
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Git blame line"})
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Git toggle blame"})
          map('n', '<leader>hd', gs.diffthis, { desc = "Git diff" })
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Git diff HEAD"})
          map('n', '<leader>td', gs.toggle_deleted, { desc = "Git toggle deleted"})

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      })
   end,
   config = function(_, opts)
     require("gitsigns").setup(opts)
   end,
}
