return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				openai = function()
					return require("codecompanion.adapters").extend("openai", {
						env = {
							api_key = "cmd:cat ~/.openai-apikey",
						},
						schema = {
							model = {
								default = "gpt-4.1",
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "openai",
				},
				inline = {
					adapter = "openai",
				},
				cmd = {
					adapter = "openai",
				},
			},
		})
	end,
}
