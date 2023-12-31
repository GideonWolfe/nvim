-- config bridge between mason and lspconfig
return {
	'williamboman/mason-lspconfig.nvim',
	config = function()
		require("mason-lspconfig").setup {
		    -- automatic_installation = true,
		    ensure_installed = {
			"angularls",
			"rust_analyzer",
			"pyright",
			"cmake",
			"clangd",
            -- TODO: errors on laptop?
			--"awk_ls",
			"bashls",
			"ansiblels",
			"arduino_language_server",
			"azure_pipelines_ls",
			"clojure_lsp",
			"codeqlls",
            -- TODO: errors on laptop?
			--"csharp_ls",
			"cssls",
			"cssmodules_ls",
			"docker_compose_language_service",
			"dockerls",
			"denols",
			"gopls",
			"graphql",
			"html",
			"julials",
			"jdtls",
			"jsonls",
			"lemminx",
			"kotlin_language_server",
			"lua_ls",
			"marksman",
			"openscad_lsp",
			"perlnavigator",
			"powershell_es",
			"puppet",
			"r_language_server",
			"ruby_ls",
			"rnix",
			"sqlls",
			"tailwindcss",
			"texlab",
			"tflint",
			"tsserver",
			"vimls",
			"volar",
			"yamlls",
			--"phpactor",
		    },
		}
	end
}
