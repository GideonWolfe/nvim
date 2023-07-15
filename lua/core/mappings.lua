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


-- Kommentary mappings
nmap("<leader>cic", "<Plug>kommentary_line_increase")
nmap("<leader>ci", "<Plug>kommentary_motion_increase")
xnoremap("<leader>cic", "<Plug>kommentary_visual_increase")
nmap("<leader>cd", "<Plug>kommentary_motion_decrease")
xnoremap("<leader>cd", "<Plug>kommentary_visual_decrease")

-- Open NvimTree
nnoremap("<leader>nt", ":NvimTreeToggle<CR>")


-- Telescope mappings
-- These mappings should start with "f" where possible "f"ind <something>
nnoremap('<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])                  -- Find files
nnoremap('<leader>fmf', [[<cmd>lua require('telescope').extensions.media_files.media_files()<cr>]]) -- find media file
nnoremap('<leader>fgf', [[<cmd>lua require('telescope.builtin').git_files()<cr>]])                  -- Find git files
nnoremap('<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser()<cr>]])                -- File Browser
nnoremap('<leader>fw', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])                   -- Find word
-- nnoremap('<leader>fb', [[<cmd>lua require('telescope.builtin').buffewrs()<cr>]])
nnoremap('<leader>fvh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])                  -- search vim help
nnoremap('<leader>fvc', [[<cmd>lua require('telescope.builtin').commands()<cr>]])                   -- find vim command
nnoremap('<leader>fmp', [[<cmd>lua require('telescope.builtin').man_pages()<cr>]])                  -- search man pages
nnoremap('<leader>qf', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]])                    -- list quick fixes
nnoremap('<leader>ss', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]])               -- suggest spelling
nnoremap('<leader>fkm', [[<cmd>lua require('telescope.builtin').keymaps()<cr>]])                    -- find keymaps
nnoremap('<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]])              -- show references for obj under cursor
nnoremap('<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]])        -- show symbols in document
nnoremap('<leader>fws', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]])      -- show symbols in workspace
nnoremap('<leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]])            -- code actions
nnoremap('<leader>fi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]])
nnoremap('<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]])
nnoremap('<leader>tp', [[<cmd>lua require('telescope.builtin').planets()<cr>]])       -- funny easter egg
nnoremap('<leader>tbi', [[<cmd>lua require('telescope.builtin').builtin()<cr>]])      -- choose builtin to launch
-- telescope git mappings
nnoremap('<leader>gco', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]])  -- git commits checkout: <cr> checkout, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap('<leader>gbc', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]]) -- git buffer commits checkout
nnoremap('<leader>gbr', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]]) -- checkout action <cr>, track action <C-t> and rebase action<C-r>


-- Hop mappings
nnoremap('<leader>hw', ':HopWord<CR>')       -- hop to a word
nnoremap('<leader>hc', ':HopChar1<CR>')      -- type a character, hop to it
nnoremap('<leader>hl', ':HopLine<CR>')       -- hop to a line

nnoremap('<leader>tr', ':TroubleToggle<CR>') -- Toggle Troube window
nnoremap('<leader>td', ':TodoTrouble<CR>')   -- Toggle todo window


-- Symbol Window
nnoremap('<leader>so', ':SymbolsOutline<CR>') -- Toggle symbol window


-- TODO why did these stop working?!!
-- Dial mappings (smarrt increment/decrement)
-- nmap("<C-a>", "<Plug>(dial-increment)")
-- nmap("<C-x>", "<Plug>(dial-decrement)")
-- nmap("g<C-a>", "g<Plug>(dial-increment)")
-- nmap("g<C-x>", "g<Plug>(dial-decrement)")
-- vmap("<C-a>", "<Plug>(dial-increment)")
-- vmap("<C-x>", "<Plug>(dial-decrement)")
-- vmap("g<C-a>", "g<Plug>(dial-increment)")
-- vmap("g<C-x>", "g<Plug>(dial-decrement)")


-- Markdown preview toggle
nmap("<leader>md", "<Plug>MarkdownPreviewToggle")
