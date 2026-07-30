return {
    'ice345/markdown-table-wrap.nvim',
    ft = 'markdown',
    -- The plugin's plugin/ file auto-calls setup() with defaults (map_gx=true)
    -- before lazy applies our opts, which maps gx regardless. Set the load
    -- guard early so that default setup is skipped and only our opts apply.
    init = function()
        vim.g.loaded_markdown_table_wrap = 1
    end,
    opts = {
        auto_preview = false, -- don't render on load
        render_all = true,
        map_gx = false, -- breaks open links outside of tables
    },
    keys = {
      { "<leader>mf", "<cmd>MarkdownTableFloatPreview<cr>", desc = "Float Markdown table preview" },
      { "<leader>mgg", "<cmd>MarkdownTableScrollTop<cr>", desc = "Scroll rendered table to top" },
      { "<leader>mG", "<cmd>MarkdownTableScrollBottom<cr>", desc = "Scroll rendered table to bottom" },
    }
}
