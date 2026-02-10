return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" },
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
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        --        local function map(mode, l, r, opts)
        --          opts = opts or {}
        --          opts.buffer = bufnr
        --          vim.keymap.set(mode, l, r, opts)
        --        end
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, "Next Git Hunk")

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, "Previous Git Hunk")

        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

        -- Leader mappings
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map('n', '<leader>ghp', function() gs.preview_hunk_inline() end, "Preview hunk inline")
        map('n', '<leader>ghh', function() gs.toggle_linehl() end, "Gitsigns toogle line highlight")
        map('n', '<leader>ghb', function() gs.blame() end, "Blame buffer")
        map('n', '<leader>ghd', function() gs.diffthis() end, "Diff this")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      current_line_blame = true,
      diff_opts = {
        --internal = true, -- If you use `gitsigns` with `diffview.nvim`, set this to true
        algorithm = "histogram", -- Can be "patience", "minimal", or "histogram"
        vertical = true,         -- Show diff in vertical split
      },
    })
  end,
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
