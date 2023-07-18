-- mapping names from LSP -> mason
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define DiagnosticSignError text=✖ texthl=DiagnosticError numhl=DiagnosticError')
vim.cmd('sign define DiagnosticSignWarn text= texthl=DiagnosticsWarn numhl=DiagnosticWarn')
vim.cmd('sign define DiagnosticSignInfo text= texthl=DiagnosticInfo numhl=DiagnosticInfo')
vim.cmd('sign define DiagnosticSignHint text= texthl=DiagnosticHint numhl=DiagnosticHint')


-- Diagnostic configs
vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    }
})

-- Border for floating windows provided by LSP
-- local border = {
--     { "🭽", "FloatBorder" },
--     { "▔",  "FloatBorder" },
--     { "🭾", "FloatBorder" },
--     { "▕",  "FloatBorder" },
--     { "🭿", "FloatBorder" },
--     { "▁",  "FloatBorder" },
--     { "🭼", "FloatBorder" },
--     { "▏",  "FloatBorder" },
-- }

-- Override open floating window functions to include borders
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--     opts = opts or {}
--     opts.border = opts.border or border
--     return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- Setup language servers.
local lspconfig = require('lspconfig')

-- Awk
lspconfig.awk_ls.setup { on_attach = require("lsp-format").on_attach }

-- Azure Pipelines
lspconfig.azure_pipelines_ls.setup { on_attach = require("lsp-format").on_attach }

-- Arduino
lspconfig.arduino_language_server.setup { on_attach = require("lsp-format").on_attach }

-- Bash
lspconfig.bashls.setup { on_attach = require("lsp-format").on_attach }

-- Clojure
lspconfig.clojure_lsp.setup { on_attach = require("lsp-format").on_attach }

-- Cmake
lspconfig.cmake.setup { on_attach = require("lsp-format").on_attach }

-- CodeQL
lspconfig.codeqlls.setup { on_attach = require("lsp-format").on_attach }

-- C Sharp
lspconfig.csharp_ls.setup { on_attach = require("lsp-format").on_attach }

-- CSS
lspconfig.cssls.setup { on_attach = require("lsp-format").on_attach }

-- CSS Modules
lspconfig.cssmodules_ls.setup { on_attach = require("lsp-format").on_attach }

-- Deno (JS)
lspconfig.denols.setup { on_attach = require("lsp-format").on_attach }

-- Dockerfiles
lspconfig.dockerls.setup { on_attach = require("lsp-format").on_attach }

-- Docker Compose
lspconfig.docker_compose_language_service.setup { on_attach = require("lsp-format").on_attach }

-- GO
lspconfig.gopls.setup { on_attach = require("lsp-format").on_attach }

-- GraphQL
lspconfig.graphql.setup { on_attach = require("lsp-format").on_attach }

-- GraphQL
lspconfig.html.setup { on_attach = require("lsp-format").on_attach }

-- Java
lspconfig.jdtls.setup { on_attach = require("lsp-format").on_attach }

-- Julia
lspconfig.julials.setup { on_attach = require("lsp-format").on_attach }

-- JSON
lspconfig.jsonls.setup { on_attach = require("lsp-format").on_attach }

-- Kotlin
lspconfig.kotlin_language_server.setup { on_attach = require("lsp-format").on_attach }

-- XML
lspconfig.lemminx.setup { on_attach = require("lsp-format").on_attach }

-- Markdown
lspconfig.marksman.setup { on_attach = require("lsp-format").on_attach }

-- OpenSCAD
lspconfig.openscad_lsp.setup { on_attach = require("lsp-format").on_attach }

-- PowerShell
lspconfig.powershell_es.setup { on_attach = require("lsp-format").on_attach }

-- Python
lspconfig.pyright.setup { on_attach = require("lsp-format").on_attach }

-- Puppet
lspconfig.puppet.setup { on_attach = require("lsp-format").on_attach }

-- Nix
lspconfig.rnix.setup { on_attach = require("lsp-format").on_attach }

-- R
lspconfig.r_language_server.setup { on_attach = require("lsp-format").on_attach }

-- Rust
lspconfig.rust_analyzer.setup { on_attach = require("lsp-format").on_attach }

-- Ruby
lspconfig.ruby_ls.setup { on_attach = require("lsp-format").on_attach }

-- SQL
lspconfig.sqlls.setup { on_attach = require("lsp-format").on_attach }

-- Tailwind CSS
lspconfig.tailwindcss.setup { on_attach = require("lsp-format").on_attach }

-- LaTeX
lspconfig.texlab.setup { on_attach = require("lsp-format").on_attach }

-- Terraform
lspconfig.tflint.setup { on_attach = require("lsp-format").on_attach }

-- Typescript
lspconfig.tsserver.setup { on_attach = require("lsp-format").on_attach }

-- VimScript
lspconfig.vimls.setup { on_attach = require("lsp-format").on_attach }

-- VimScript
lspconfig.volar.setup { on_attach = require("lsp-format").on_attach }

-- YAML
lspconfig.yamlls.setup { on_attach = require("lsp-format").on_attach }


-- Lua
lspconfig.lua_ls.setup({
    --on_attach = require("lsp-format").on_attach, -- specifying to use the formatter
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                -- Hide annoying workspace questions when file opens
                checkThirdParty = false
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
