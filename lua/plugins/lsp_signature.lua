-- Pretty function signatures as you type
return {
	"ray-x/lsp_signature.nvim",
	enabled = true,
	config = function()
		local icons = require('core.icons')
		require('lsp_signature').setup({
		    bind = true,
		    handler_opts = {
                border = "rounded"
		    },
		    -- Virtual text kinda cluttered
		    hint_enable = true,
		    hint_prefix = icons.ui.ArrowClosed
		})
	end,
}
