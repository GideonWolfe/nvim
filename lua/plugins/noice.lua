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
                }
		    }
		})

	end
}
