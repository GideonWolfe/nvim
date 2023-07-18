local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)


-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                               -- Enable mouse support
opt.clipboard = 'unnamedplus'                 -- Copy/paste to system clipboard
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options
opt.hlsearch = true                           -- highlight search results
opt.incsearch = true                          -- highlight search results
opt.ignorecase = true                         -- Ignore case letters when search
opt.smartcase = true                          -- Ignore lowercase for the whole pattern
opt.timeoutlen = 500                          -- time to wait for a mapped sequence to complete in ms
opt.updatetime = 300                          -- faster completion
opt.undofile = true                           -- enable persistent undo


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.cmd 'colorscheme chameleon'          -- set colorscheme
opt.list = false          -- Show line number
opt.number = true         -- Show line number
opt.numberwidth = 2       -- number column width
opt.signcolumn = 'yes'    -- always show the sign column
opt.relativenumber = true -- Show line number TODO relative lines
opt.showmatch = true      -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
--opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.linebreak = true      -- Wrap on word boundary
opt.wrap = true           -- Wrap lines
opt.termguicolors = true -- Enable 24-bit RGB colors TODO this breaks colors
opt.laststatus = 3        -- Set global statusline
opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
opt.autoread = true       -- Automatically reread the file if a change was detected outside of vim
opt.showmode = false      -- don't show mode indicator line
opt.scrolloff = 3         -- scroll offset keep context around cursor
opt.sidescrolloff = 5     -- scroll offset keep context around cursor
opt.conceallevel = 0      -- don't automatically collapse markdown and latex
opt.cursorline = true     -- enable different color for line number (or whole line) of current line
opt.pumheight = 10        -- height of pop up menu
opt.showtabline = 1       -- always show tabs (2) (1 if only when 2 or more tabs)
-- TODO this setting is getting overwritten?
opt.lazyredraw = false       -- TODO disabled to quite error from noice
-- style we can assign to windows
g.floating_window_border_dark = {
    { "╭", "FloatBorderDark" },
    { "─", "FloatBorderDark" },
    { "╮", "FloatBorderDark" },
    { "│", "FloatBorderDark" },
    { "╯", "FloatBorderDark" },
    { "─", "FloatBorderDark" },
    { "╰", "FloatBorderDark" },
    { "│", "FloatBorderDark" },
}
-- TODO make sure this doesn't cause issues
opt.fillchars = {
    fold = ' ',
    diff = '╱',
    wbr = '─',
    msgsep = '─',
    horiz = ' ',
    horizup = '│',
    horizdown = '│',
    vertright = '│',
    vertleft = '│',
    verthoriz = '│',
}



-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- Use spaces instead of tabs
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.shiftwidth = 4     -- Shift 4 spaces when tab
opt.smartindent = true -- Autoindent new lines TODO make sure this works with autocomplete
opt.autoindent = true  -- match previous line indent when doinng O or o
-- TODO not sure if needed yet
-- opt.softtabstop = 2
-- opt.smarttab = true
-- opt.shiftround = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- Enable background buffers
opt.history = 100     -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 250  -- ms to wait for trigger an event


-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append("c") -- dont show redundant messages from ins-completion-menu
opt.shortmess:append("I") -- don't show the default intro message

-- Remember last position in file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
      endif
    ]])
    end,
})


-- -- Disable builtin plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
