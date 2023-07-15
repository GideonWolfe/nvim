local wk = require("which-key")

-- Import comment API
local comment = require('Comment.api')

-- Import telescope API
local telescope_builtins = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions

local opts = {
    prefix = "<leader>"
}

local mappings = {
    f = {
        -- Anything that involves locating and navigating to it
        name = "find",
        d = { function() telescope_builtins.lsp_definitions() end, "Find Definition" },
        ds = { function() telescope_builtins.lsp_document_symbols() end, "Find Document Symbols" },
        e = { "<cmd>TroubleToggle<cr>", "Find Errors" },
        f = { function() telescope_builtins.find_files() end, "Find Files" },
        gf = { function() telescope_builtins.git_files() end, "Find Git Files" },
        i = { function() telescope_builtins.lsp_implementations() end, "Find Implementations" },
        mf = { function() telescope_extensions.media_files.media_files() end, "Find Media Files" },
        mp = { function() telescope_builtins.man_pages() end, "Find Man Pages" },
        qf = { function() telescope_builtins.quickfix() end, "Find Quickfix" },
        r = { function() telescope_builtins.lsp_references() end, "Find References" },
        s = { function() telescope_builtins.spell_suggest() end, "Find Spelling Suggestions" },
        t = { "<cmd>TodoTelescope<cr>", "Find Todos" },
        -- How we have a label that nests deeper
        v = {
            name = "Vim",
            -- This keybind is <leader>fvh
            h = { function() telescope_builtins.help_tags() end, "Find Vim Help" },
            c = { function() telescope_builtins.commands() end, "Find Vim Commands" },
        },
        --vh = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Find Vim Help" },
        -- vc = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Find Vim Commands" },
        w = { function() telescope_builtins.live_grep() end, "Find Word" },
        ws = { function() telescope_builtins.lsp_workspace_symbols() end, "Find Workspace Symbols" },
    },
    c = {
        name = "comment",
        l = { function() comment.toggle.linewise.current() end, "Comment Line" },
    },
    g = {
        name = "git",
        a = { "<cmd>silent Git add %<cr>", "Git add current file" },
        c = { "<cmd>Git commit<cr>", "Git Commit" },
        d = { "<cmd>Git diff<cr>", "Git Diff" },
        g = { "<cmd>LazyGitCurrentFile<cr>", "Git GUI" },
        l = { "<cmd>Git log<cr>", "Git Log" },
        m = { "<cmd>Git merge<cr>", "Git Merge" },
        p = { "<cmd>Git push<cr>", "Git Push" },
        s = { "<cmd>G<cr>", "Git Status" },
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
    nt = {
        "<cmd>NvimTreeToggle<cr>", "File Tree"
    },
    s = {
        name = "symbols",
        o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
        t = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols Telescope" },
    },
}

wk.register(mappings, opts)
