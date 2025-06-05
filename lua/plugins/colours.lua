return {
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_bold = false
			require("nord").set()
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.g.everforest_enable_italic = false
			--vim.cmd.colorscheme("everforest")
		end,
	},
}
