-- Import global icons
local icons = require('core.icons')
require("noice").setup({
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = false,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        -- TODO: this doesn't do anything
        lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    -- Each UI element gets its own config section. see plugin README for more
    --
    -- Center box for commands, searches, lua execution, etc
    cmdline = {
        format = {
            cmdline = {
                pattern = "^:",
                icon = icons.ui.Code,
                lang = "vim"
            }
        }
    },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true,
        },
        -- TODO: this doesn't seem to work?
        -- Hover text when lsp.buf.hover is called (leader lci)
        -- TODO: add this: https://github.com/folke/noice.nvim#lsp-hover-doc-scrolling
        hover = {
            -- TODO: disabled until I figure out why hover keeps showing up
            enabled = false,
            silent = true,
            border = { style = "rounded" }
        },
        -- Disabled because lsp_signature plugin does it better
        signature = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        },
        -- Hover/signature help
        documentation = {
            -- TODO: disabled until I figure out why hover keeps showing up
            enabled = 'false',
            view = "hover",
            opts = {
                lang = "markdown",
                replace = true,
                render = "plain",
                format = { "{message}" },
                win_options = { concealcursor = "n", conceallevel = 3 },
            },
        }
    },
    popupmenu = {
        enabled = true,
        backend = "nui" -- or cmp
    },
    -- What does this even do?
    split = {
        backend = "split",
        enter = false,
        relative = "editor",
        position = "bottom",
        size = "20%",
        close = {
            keys = { "q" },
        },
        win_options = {
            winhighlight = { Normal = "NoiceSplit", FloatBorder = "NoiceSplitBorder" },
            wrap = true,
        },
    },
})
