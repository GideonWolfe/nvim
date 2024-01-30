-- mapping names from LSP -> mason
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

local icons = require('core.icons')

-- Diagnostics symbols for display in the sign column.
-- define them in a function/loop instead so we can use core icons
-- the commented out section below doesn't support variables in text field
local signs = {
    Error = icons.diagnostics.Error,
    Warn = icons.diagnostics.Warning,
    Hint = icons.diagnostics.Hint,
    Information = icons.diagnostics.Information
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic configs
vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    }
})

local lspconfig = require('lspconfig')

-- change border of :LspInfo
require('lspconfig.ui.windows').default_options = {
  border = "rounded"
}

-- Setup language servers.

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
-- lspconfig.denols.setup { on_attach = require("lsp-format").on_attach }
lspconfig.denols.setup { }

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
lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
