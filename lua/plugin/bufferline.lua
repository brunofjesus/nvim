return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  init = function()
    vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" });
    vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" });
    vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Create new tab" });
    vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" });
    vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" });
  end,
  opts = {
    options = {
      mode = "buffer",
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      custom_filter = function(buf, buf_nums)
        local is_single_tab = vim.fn.tabpagenr('$') == 1;
        if is_single_tab then
          return true
        end

        -- check if we have a tab named Console
        local console_tab_number = -1
        local tabs = vim.api.nvim_list_tabpages()
        for _, tab in ipairs(tabs) do
          local tabinfo = vim.fn.gettabinfo(tab)[1];
          -- Check if the variables table is not empty
          local name = nil
          if next(tabinfo.variables) ~= nil then
            name = tabinfo.variables.name -- Safely access the name
          end
          if name == "Terminal" then
            console_tab_number = tab;
            break
          end
        end

        if console_tab_number == -1 then
          return true
        end

        local current_tab = vim.fn.tabpagenr();
        local is_console_tab = current_tab == console_tab_number;
        local buftype = vim.api.nvim_get_option_value('buftype', { buf = buf })
        return (is_console_tab and buftype == 'terminal') or (is_console_tab == false and buftype ~= "terminal")
      end
    },
  },
}
