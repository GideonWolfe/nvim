-- import our vim objects
local vim, api, fn, g = vim, vim.api, vim.fn, vim.g

-- import our map functions file
local mappings = require('utils.map')

-- dereference all the functions
-- examples https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_mapping.lua
local nnoremap = mappings.nnoremap
local inoremap = mappings.inoremap
local vnoremap = mappings.vnoremap
local xnoremap = mappings.xnoremap
local cnoremap = mappings.cnoremap
local nmap = mappings.nmap
local imap = mappings.imap
local vmap = mappings.vmap
local cnoreabbrev = mappings.cnoreabbrev
local check_back_space = mappings.check_back_space


-- Set leader key to space
g.mapleader = " "

-- Allow misspellings
cnoreabbrev "Qa qa"
cnoreabbrev "Q q"
cnoreabbrev "Qall qall"
cnoreabbrev "Q! q!"
cnoreabbrev "Qall! qall!"
cnoreabbrev "qQ q@"
cnoreabbrev "Bd bd"
cnoreabbrev "bD bd"
cnoreabbrev "qw wq"
cnoreabbrev "Wq wq"
cnoreabbrev "WQ wq"
cnoreabbrev "Wq wq"
cnoreabbrev "Wa wa"
cnoreabbrev "wQ wq"
cnoreabbrev "W w"
cnoreabbrev "W! w!"

-- Yank from cursor position to end-of-line
nnoremap('Y', 'y$')

-- Select blocks after indenting
xnoremap("<", "<gv")
xnoremap(">", ">gv|")

-- Use tab for indenting
nnoremap("<Tab>", ">>_")
nnoremap("<S-Tab>", "<<_")
vnoremap("<Tab>", ">gv")
vnoremap("<S-Tab>", "<gv")

-- Mappings to move lines
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<esc>:m .+1<CR>==")
inoremap("<A-v>", "<esc>:m .-2<CR>==")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- jk or kj will enter normal mode
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

-- Window movement
nmap('<c-h>', '<c-w>h')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('<c-l>', '<c-w>l')

nmap("K", 'lua vim.lsp.buf.hover()')

-- Dial mappings (smarrt increment/decrement)
nmap("<C-a>", "<Plug>(dial-increment)")
nmap("<C-x>", "<Plug>(dial-decrement)")
nmap("g<C-a>", "g<Plug>(dial-increment)")
nmap("g<C-x>", "g<Plug>(dial-decrement)")
vmap("<C-a>", "<Plug>(dial-increment)")
vmap("<C-x>", "<Plug>(dial-decrement)")
vmap("g<C-a>", "g<Plug>(dial-increment)")
vmap("g<C-x>", "g<Plug>(dial-decrement)")
