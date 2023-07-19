local icons = require('core.icons')
require('lsp_signature').setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    -- Virtual text kinda cluttered
    hint_enable = false,
    hint_prefix = icons.ui.ArrowClosed
})
