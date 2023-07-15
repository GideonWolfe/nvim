local wk = require("which-key")

-- Import comment API because they don't provide standard mappings...
local comment = require('Comment.api')

local telescope_builtins = require('telescope.builtin')

local opts = {
    prefix = "<leader>"
}

local mappings = {
    f = {
        -- Anything that involves locating and navigating to it
        name = "find",
        d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Find Definitions" },
        ds = { "<cmd>Telescope lsp_document_symbols<cr>", "Find Document Symbols" },
        e = { "<cmd>TroubleToggle<cr>", "Find Errors" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        gf = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Find Git Files" },
        i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Find Implementations" },
        mf = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Find Media Files" },
        mp = { "<cmd>lua require('telescope.builtin').man_pages()<cr>", "Find Man Pages" },
        qf = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "Find Quickfix" },
        r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Find References" },
        -- s = { "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", "Find Spelling Suggestions" },
        s = { function() telescope_builtins.spell_suggest() end, "Find Spelling Suggestions" },
        t = { "<cmd>TodoTelescope<cr>", "Find Todos" },
        -- How we have a label that nests deeper
        v = {
            name = "Vim",
            -- This keybind is <leader>fvh
            h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Find Vim Help" },
            c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Find Vim Commands" },
        },
        --vh = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Find Vim Help" },
        -- vc = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Find Vim Commands" },
        w = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find Word" },
        ws = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Find Workspace Symbols" },
    },
    g = {
        name = "comment",
        cc = { function() comment.toggle.linewise.current() end, "Comment Line" },
    },
    h = {
        name = "hop",
        w = { "<cmd>HopWord<cr>", "Hop Word" },
        c = { "<cmd>HopChar1<cr>", "Hop Character" },
        l = { "<cmd>HopLine<cr>", "Hop Line" },
    },
    m = {
        name = "markdown",
        p = { "<plug>MarkdownPreviewToggle", "Markdown Preview" },
    },
    s = {
        name = "symbols",
        o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
        t = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols Telescope" },
    },
}

wk.register(mappings, opts)
