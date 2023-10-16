-- automatically install lazy if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


-- Options for lazy itself
local lazy_opts = {
    ui = {
        border = 'rounded',
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    install = {
        colorscheme = { 'chameleon' }, -- try to load one of these colorschemes when starting an installation during startup
    },
}

-- HACK: required to quiet error from lazy
vim.g.mapleader = " "
require('lazy').setup('plugins', lazy_opts)
