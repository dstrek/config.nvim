return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			d2 = { "d2" },
			lua = { "stylua" },
			go = { "gofumpt" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
