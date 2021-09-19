call plug#begin(stdpath('data') . '/plugged')
  Plug 'arcticicestudio/nord-vim' " colorscheme
  Plug 'nvim-lua/plenary.nvim' " helper funcitons
  Plug 'nvim-telescope/telescope.nvim' " fuzzy finder
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " faster fzf
  Plug 'Mofiqul/vscode.nvim' " colorscheme for vscode dark/light
  Plug 'kassio/neoterm' " terminal
  Plug 'TimUntersberger/neogit' " git
  Plug 'lewis6991/gitsigns.nvim' " inline git signs
  Plug 'sindrets/diffview.nvim' " better git diff view
  Plug 'hoob3rt/lualine.nvim' " status bar
  Plug 'kyazdani42/nvim-web-devicons' " status bar icons
  Plug 'tpope/vim-commentary' " comment code
  Plug 'sbdchd/neoformat' " format code
  Plug 'neovim/nvim-lspconfig' " lang server
  Plug 'hrsh7th/cmp-nvim-lsp' " auto complete lsp source
  Plug 'hrsh7th/cmp-buffer' " auto complete buffer source
  Plug 'hrsh7th/nvim-cmp' " auto complete
  Plug 'pangloss/vim-javascript' " js syntax
call plug#end()

" default options
set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " if I accidentally use the mouse
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " show absolute line numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set listchars=tab:▸\ ,eol:¬ " visual whitespace chars 
set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
filetype plugin indent on " enable detection, plugins and indents
let mapleader = " " " space as leader key
if (has("termguicolors"))
  set termguicolors " better colors, but makes it sery slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>q :nohlsearch<CR>
nnoremap <silent> <leader>L :setlocal number!<CR>
nnoremap <silent> <leader>a :set list!<CR>

let g:vscode_style = "dark"
colorscheme vscode

" hoob3rt/lualine.nvim
lua << EOF
  require('lualine').setup({
  options = {
    theme = 'vscode'
   }
  })
EOF

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif

" nvim-telescope/telescope.nvim
lua << EOF
_G.telescope_find_files_in_path = function(path)
local _path = path or vim.fn.input("Dir: ", "", "dir")
require("telescope.builtin").find_files({search_dirs = {_path}})
end

_G.telescope_live_grep_in_path = function(path)
local _path = path or vim.fn.input("Dir: ", "", "dir")
require("telescope.builtin").live_grep({search_dirs = {_path}})
end

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist
      }
    }
  }
})
EOF
nnoremap <leader><space> :Telescope git_files<CR>
nnoremap <leader>fd :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fD :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>ft :lua telescope_find_files_in_path("./tests")<CR>
nnoremap <leader>fT :lua telescope_live_grep_in_path("./tests")<CR>
nnoremap <leader>fo :Telescope file_browser<CR>
nnoremap <leader>fn :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>

" sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>

" neovim/nvim-lspconfig
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>lH <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> <leader>lD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lk <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lR <cmd>lua vim.lsp.buf.rename()<CR>

" TimUntersberger/neogit and sindrets/diffview.nvim
lua << EOF
require("neogit").setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  }
}
EOF
nnoremap <leader>gg :Neogit<cr>
nnoremap <leader>gd :DiffviewOpen<cr>
nnoremap <leader>gD :DiffviewOpen main<cr>
nnoremap <leader>gl :Neogit log<cr>
nnoremap <leader>gp :Neogit push<cr>
