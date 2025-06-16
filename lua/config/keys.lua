vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nnoremap <silent> <leader>q :nohlsearch<CR>
vim.keymap.set("n", "<leader>q", "<CMD>nohlsearch<CR>", { desc = "Clear search higlighting" })

-- nnoremap <silent> <leader>L :setlocal number!<CR>
vim.keymap.set("n", "<leader>L", "<CMD>setlocal number!<CR>", { desc = "Line number toggling" })

-- nnoremap <silent> <leader>a :set list!<CR>
vim.keymap.set("n", "<leader>A", "<CMD>set list!<CR>", { desc = "Toggle render of list chars" })
vim.keymap.set("n", "<leader>ai", "<CMD>CodeCompanion<CR>", { desc = "Toggle render of list chars" })
vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "Toggle render of list chars" })

vim.keymap.set("n", "<leader>e", function()
	require("snacks").explorer()
end, { desc = "Show file explorer" })

vim.keymap.set("n", "<leader>f", function()
	require("fzf-lua").files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>s", function()
	require("fzf-lua").live_grep()
end, { desc = "Search files" })

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open floating diagnostic window" })
