return { 
	"shaunsingh/nord.nvim",
	config = function()
		vim.g.nord_italic = false
		vim.g.nord_bold = false
		require("nord").set()
	end
}
