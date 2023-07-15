-- Plugin list
require('core/lazy')

-- Core Neovim settings
require('core/options')

-- Colors and Highlights
require('core/colors')

-- Keymappings
require('core/mappings')

-- Icons used by various plugins
require('core/icons')

-- Helper functions to make keybinds
require('utils/map')

-- Language server configuration
require('lsp/lspconfig')

-- individual plugin configs
vim.cmd('runtime! lua/plugins/*.lua')

