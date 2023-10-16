-- UI overhaul
return {
	'folke/noice.nvim',
	event = "VeryLazy",
	dependencies = {
		'MunifTanjim/nui.nvim', -- UI component lib, used by noice
	},
	config = function ()
		local icons = require('core.icons')
		require("noice").setup({
            presets = {
                -- adds border around hover doc
                lsp_doc_border = true,
            },
            popupmenu = {
                enabled = true,
                backend = 'nui',
            },
		    cmdline = {
                enabled = true,
                format = {
                    cmdline = {
                        icon = icons.ui.Code,
                        lang = "vim"
                    }
                }
		    },
		    lsp = {
                progress = {
                    -- this is handled by fidget
                    enabled = false
                },
                signature = {
                    -- this is handled by lsp_signature
                    enabled = false
                },
                override = {
                  -- override the default lsp markdown formatter with Noice
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  -- override the lsp markdown formatter with Noice
                  ["vim.lsp.util.stylize_markdown"] = true,
                  -- override cmp documentation with Noice (needs the other options to work)
                  ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                  enabled = true,
                  silent = false, -- set to true to not show a message if hover is not available
                  view = nil, -- when nil, use defaults from documentation
                  ---@type NoiceViewOptions
                  opts = {}, -- merged with defaults from documentation
                },
		    },
            messages = {

            }
		})

	end
}
