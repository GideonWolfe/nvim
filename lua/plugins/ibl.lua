return {
	'lukas-reineke/indent-blankline.nvim',
	main = "ibl",
	config = function()
		local highlight = {
		    "RainbowDelimiterRed",
		    "RainbowDelimiterYellow",
		    "RainbowDelimiterBlue",
		    "RainbowDelimiterOrange",
		    "RainbowDelimiterGreen",
		    "RainbowDelimiterViolet",
		    "RainbowDelimiterCyan",
		}
		require("ibl").setup{
		    indent = {
			char = "▏",
			highlight = highlight
		    },
		    exclude = {
			buftypes = {
			    "terminal",
			    "nofile",
			},
			filetypes = {
			    "help",
			    "defx",
			    "vimwiki",
			    "man",
			    "gitmessengerpopup",
			    "gitcommit",
			    "diagnosticpopup",
			    "lspinfo",
			    "packer",
			    "text",
			    "markdown",
			    "yaml",
			    "dashboard",
			    "TelescopePrompt",
			    "NvimTree",
			    "" -- all buffers without a filetype
			}
		    },
		    scope = {
                highlight = "IblScope"
		    }

		}
	end
}
