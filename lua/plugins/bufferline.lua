local bufferline = require('bufferline')
bufferline.setup{
    options = {
        themeable = true,
        mode = 'tabs',
        -- TODO lsp diagnostics don't show up in tabs
        diagnostics = "nvim_lsp",
        -- style_preset = bufferline.style_preset.minimal,
        buffer_close_icon = "",
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        separator_style = "thin",
        color_icons = true, -- TODO see if actually breaks anything
        offsets = { -- TODO not saying "File Explorer, saying NvimTree_1"
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                }
        },
    }
}
