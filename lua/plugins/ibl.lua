local highlight = {
    "TSRainbowRed",
    "TSRainbowYellow",
    "TSRainbowBlue",
    "TSRainbowOrange",
    "TSRainbowGreen",
    "TSRainbowViolet",
    "TSRainbowCyan",
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
