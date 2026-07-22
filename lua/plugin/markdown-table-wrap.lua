return {
    'ice345/markdown-table-wrap.nvim',
    ft = 'markdown',
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
