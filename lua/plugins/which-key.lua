-- Keybind preview and registration
return {
	"folke/which-key.nvim",
	config = function()

		local wk = require("which-key")

		-- Import comment API
		local comment = require('Comment.api')

		-- Import telescope API
		local telescope_builtins = require('telescope.builtin')
		local telescope_extensions = require('telescope').extensions

		-- Import icons
		local icons = require('core.icons')

		-- Options for plugin
		require("which-key").setup({
		    window = {
                border = "double"
		    },
		    icons = {
                breadcrumb = icons.ui.ChevronRight,
                group = icons.documents.Folder.." ", -- HACK adding space here
                -- separator = "$"
		    }
		})

		-- options for keymaps
		local opts = {
		    prefix = "<leader>",
		}

		local mappings = {
		    b = {
                name = "buffer",
                -- TODO: this errors out for some reason, I created an issue
                -- https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/225
                o = {function() require('telescope').extensions.file_browser.actions.open() end, "Open"}
		    },
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
                n = { function() telescope_extensions.notify.notify() end, "Find Notifications" },
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
                    k = { function() telescope_builtins.keymaps() end, "Find Vim Keymaps" },
                },
                --vh = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Find Vim Help" },
                -- vc = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Find Vim Commands" },
                w = { function() telescope_builtins.live_grep() end, "Find Word" },
                ws = { function() telescope_builtins.lsp_workspace_symbols() end, "Find Workspace Symbols" },
		    },
		    c = {
                name = "code",
                -- TODO: add binds for other comments (visual, block, etc)
                c = { function() comment.toggle.linewise.current() end, "Comment" },
                s = { function() telescope_extensions.luasnip.luasnip() end, "Snippets" },
                e = { "<cmd>TroubleToggle<cr>", "Errors" },
		    },
		    g = {
                name = "git",
                a = { "<cmd>silent Git add %<cr>", "Git add current file" },
                b = { "<cmd>silent Git blame<cr>", "Git Blame" },
                c = { "<cmd>Git commit<cr>", "Git Commit" },
                d = { "<cmd>DiffviewOpen<cr>", "Git Diff" },
                g = { "<cmd>LazyGitCurrentFile<cr>", "Git GUI" },
                l = { "<cmd>Git log<cr>", "Git Log" },
                m = { "<cmd>Git merge<cr>", "Git Merge" },
                p = { "<cmd>Git push<cr>", "Git Push" },
                s = { "<cmd>G<cr>", "Git Summary" },
		    },
		    h = {
                name = "hop",
                w = { "<cmd>HopWord<cr>", "Hop Word" },
                c = { "<cmd>HopChar1<cr>", "Hop Character" },
                l = { "<cmd>HopLine<cr>", "Hop Line" },
		    },
		    -- TODO: is there a prettier way to do this UI wise? Telescope maybe?
		    -- https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim
		    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
		    l = {
                name = "lsp",
                ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP Code Action" },
                ci = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Cursor Info " },
                ic = { function() telescope_builtins.lsp_incoming_calls() end, "LSP Incoming Calls" },
                oc = { function() telescope_builtins.lsp_outgoing_calls() end, "LSP Outgoing Calls" },
                rf = { function() telescope_builtins.lsp_references() end, "LSP References" },
                rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP Rename" },
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
	end,
}
