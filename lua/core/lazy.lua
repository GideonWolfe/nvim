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

-- require("lazy").setup('plugins', opts)
-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
	return
end


-- Start setup
lazy.setup({
	spec = {

		-- Treesitter
		{
			'nvim-treesitter/nvim-treesitter',
			enabled = true,
			build = ':TSUpdate',
			-- TODO broken when using config file
			-- config = function()
			--     require('treesitter').setup()
			--end
		},
		-- Extra Treesitter functionality
		{ "nvim-treesitter/nvim-treesitter-refactor" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },



		---------------
		-- LSP stuff --
		---------------
		-- Mason is general package manager for Lang servers, Debuggers, and formatters
		-- nvim-lspconfig allows for simple configuration of Lang servers from a single file
		-- mason-lspconfig.nvim automates configuration for LSPs downloaded via Mason (not manually installed)
		-- null-ls.nvim exposes some LSP features, necessary for debuggers and formatters
		-- mason-null-ls.nvim automates installation/config of debuggers and formatters.
		-- nvim-dap provides debugger adapter protocols for debuggers
		-- mason-nvim-dap provides methods to install DAPs via Mason

		-- LSP package manager
		{
			'williamboman/mason.nvim',
			build = ":MasonUpdate",
			config = function()
				require('mason').setup()
			end
		},

		-- config bridge between mason and lspconfig
		{
			'williamboman/mason-lspconfig.nvim',
			config = function()
				require('mason-lspconfig').setup() -- this is where default installed LSPs are listed
			end
		},

		-- LSP configs
		{ 'neovim/nvim-lspconfig' },

		-- More LSP integration
		{ 'jose-elias-alvarez/null-ls.nvim' },

		-- Download formatters through mason
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"jose-elias-alvarez/null-ls.nvim",
			},
			config = function()
				require("mason-null-ls").setup() -- this is where default installed Debuggers and Formatters are listed
			end,
		},

		-- Symbols for LSP preview
		{ "onsails/lspkind-nvim" },

		-- Debugger protocol
		{ 'mfussenegger/nvim-dap' },

		-- Download debuggers through mason
		{ 'jay-babu/mason-nvim-dap.nvim' },


		----------------
		-- Completion --
		----------------

		-- Completion engine
		{
			'hrsh7th/nvim-cmp',
			config = function()
				require('cmp').setup()
			end
		},
		-- Sources for completion engine
		{
			'hrsh7th/cmp-buffer',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'hrsh7th/cmp-path',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'hrsh7th/cmp-cmdline',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'saadparwaiz1/cmp_luasnip',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'hrsh7th/cmp-nvim-lsp',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'hrsh7th/cmp-emoji',
			dependencies = 'hrsh7th/nvim-cmp'
		},
		{
			'hrsh7th/cmp-nvim-lua',
			dependencies = 'hrsh7th/nvim-cmp'
		},

		-- Snippet engine
		{
			"L3MON4D3/LuaSnip",
			-- install jsregexp (optional!).
			build = "make install_jsregexp"
		},

		{
		    "benfowler/telescope-luasnip.nvim",
		    module = "telescope._extensions.luasnip" --for lazyloading
		},

		-- Snippets
		{ "rafamadriz/friendly-snippets" },




		-------------
		-- Editing --
		-------------

		-- Auto commenting
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end
		},

		-- auto pairs
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		},

		-- Add/delete/change surrounds
		{
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},

		-- LSP integrated formatting
		{
			"lukas-reineke/lsp-format.nvim",
			config = function()
				require("lsp-format").setup()
			end,
		},

		-- LSP integrated formatting
		{
			"monaqa/dial.nvim",
		},

		-- Insert symbols via telescope
		{
			"nvim-telescope/telescope-symbols.nvim",
		},

		-- Improved clipboard manager
		{
			"AckslD/nvim-neoclip.lua",
			config = function()
				require('neoclip').setup()
			end,
		},

		-- LaTex syntax/compilation
		{
			'lervag/vimtex',
			config = function()
				local g = vim.g
				g.vimtex_view_method = 'zathura'
				g.latex_view_general_viewer = 'zathura'
				g.tex_flavor = 'latex'
				g.vimtex_complete_enabled = 1
				-- g.vimtex_quickfix_method = 'latexmk'
				g.vimtex_compiler_progname = 'nvr'
				-- g.tex_conceal = ''
				-- g.vimtex_quickfix_mode = 2
				-- g.vimtex_view_forward_search_on_start = 0
				-- g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
				-- -- This must be a dictionary, and {} gets converted to a list
				-- g.vimtex_syntax_conceal = { foo = false }
			end,
		},

        -- TODO:
        -- Code folding
        -- {
        --     "kevinhwang91/nvim-ufo".
        -- }

		----------------
		-- Navigation --
		----------------

		-- Find files, errors, and more
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
			config = function()
				require("telescope")
			end,
			enabled = true
		},


		-- Enable telescope to find media files
		{
			"nvim-telescope/telescope-media-files.nvim",
			dependencies = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope.nvim" },
			},
			enabled = true
		},

        -- Enables an advanced file browser within telescope 
        -- more than just the fuzzy search the file finder gives
        {
            "nvim-telescope/telescope-file-browser.nvim",
        },


		-- Hop to various locations in buffer
		{
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				require("hop")
			end,
		},

		-- TODO: this doesn't work....
		-- Highlight jumpable locations within the line for horizontal movement
		-- {
		--     "jinh0/eyeliner.nvim",
		--     config = function()
		--         require 'eyeliner'.setup {
		--             highlight_on_key = true,
		--             dim = true
		--         }
		--     end
		-- },


		-- navigate via symbols/functions
		{
			"simrat39/symbols-outline.nvim",
			config = function()
				require("symbols-outline")
			end,
		},

		-- Pop up file browser/tree
		{
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("nvim-tree")
			end,
			-- devicons in lua
			dependencies = { "kyazdani42/nvim-web-devicons" },
		},

		-- Navigate in between projects
		{
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup {}
			end,
		},




		-----------------
		-- Diagnostics --
		-----------------
		-- Pop up diagnostic window
		{
			"folke/trouble.nvim",
			dependencies = "kyazdani42/nvim-web-devicons",
			config = function()
				require('trouble').setup()
			end,
			enabled = true
		},

		-- Track TODOs and other comments
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require('todo-comments').setup()
			end,
		},


		--------
		-- UI --
		--------

		-- Colorscheme
		{ 'deviantfero/wpgtk.vim' },
		{ dir = '~/.config/nvim/lua/core/chameleon', name = "chameleon" },

		-- Colorscheme creator
		{ 'rktjmp/lush.nvim' },

		-- Better notifications
		{
			'rcarriga/nvim-notify',
			config = function()
				require("notify").setup()
			end,
		},

		-- UI overhaul
		{
			'folke/noice.nvim',
			event = "VeryLazy",
			dependencies = {
				'MunifTanjim/nui.nvim', -- UI component lib, used by noice
			},
			config = function()
				require("noice").setup()
			end,
		},

		-- Dashboard
		{
			"glepnir/dashboard-nvim",
			config = function()
				require("dashboard")
			end,
		},


		-- Indent line
		{
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('indent_blankline').setup()
			end
		},

		-- Use different colors for matching parens
		{
			"HiPhish/nvim-ts-rainbow2",
			enabled = true
		},


		-- Pretty symbols
		{
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({ default = true, color_icons = false })
			end,
		},


		-- Colorize color codes
		{
			"norcalli/nvim-colorizer.lua",
		},


		-- UI elements for LSP progress
		{
			"j-hui/fidget.nvim",
			tag = 'legacy',
			config = function()
				require("fidget").setup()
			end,
		},

		-- Pretty function signatures as you type
		{
			"ray-x/lsp_signature.nvim",
			enabled = true,
			config = function()
				require("lsp_signature").setup()
			end,
		},

		-- Tab/buffer line
		{
			'akinsho/bufferline.nvim',
			version = "*",
			dependencies = 'kyazdani42/nvim-web-devicons',
			config = function()
				require("bufferline").setup()
			end,
		},

		-- Status line
		{
			'nvim-lualine/lualine.nvim',
			dependencies = 'kyazdani42/nvim-web-devicons',
			after = 'chameleon',
			config = function()
				require("lualine").setup()
			end,
		},

		-- Markdown preview server
		{
			'iamcco/markdown-preview.nvim',
			build = "cd app && npm install",
			ft = "markdown",
			lazy = true,
			config = function()
				local g = vim.g
				g.mkdp_auto_close = true
				g.mkdp_open_to_the_world = false
				g.mkdp_open_ip = "127.0.0.1"
				g.mkdp_port = "8889"
				g.mkdp_browser = "firefox"
				g.mkdp_echo_preview_url = true
				g.mkdp_page_title = "${name}"
				g.mkdp_highlight_css = '/home/gideon/.cache/wal/colors.css'
				g.mkdp_markdown_css = '/home/gideon/.config/nvim/static/markdown-preview/customStyle.css'
			end,
		},

		-- Keybind preview and registration
		{
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup()
			end,
		},

		---------
		-- Git --
		---------

		-- Git signs in the gutter
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "BufRead",
		},

		-- Enhanced diff view
		{
			"sindrets/diffview.nvim",
			config = function()
				require("diffview").setup()
			end,
		},

		-- Git UI
		{
			"kdheepak/lazygit.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		-- The classic, provides vim commands for git
		{
			"tpope/vim-fugitive",
		},


		---------------
		-- Utilities --
		---------------


		-- Language translator
		{
			'potamides/pantran.nvim',
		},

	},
    -- TODO: this doesn't do anything but I think it's a floating win problem
    {
        ui = {
            border = "rounded"
        }
    }
})
-- some comment
