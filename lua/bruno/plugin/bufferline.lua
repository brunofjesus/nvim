return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = { -- require("bufferline").setup(opts)
		options = {
			mode = "buffer",
			separator_style = "sloped",
			diagnostics = "nvim_lsp",
		},
	},
}
