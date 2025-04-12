vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nnoremap <silent> <leader>q :nohlsearch<CR>
vim.keymap.set("n", "<leader>q", "<CMD>nohlsearch<CR>", { desc = "Clear search higlighting" })

-- nnoremap <silent> <leader>L :setlocal number!<CR>
vim.keymap.set("n", "<leader>L", "<CMD>setlocal number!<CR>", { desc = "Line number toggling" })

-- nnoremap <silent> <leader>a :set list!<CR>
vim.keymap.set("n", "<leader>a", "<CMD>set list!<CR>", { desc = "Toggle render of list chars" })
