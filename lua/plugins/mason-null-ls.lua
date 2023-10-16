-- Download formatters through mason
return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
		    ensure_installed = {
			"bash-debug-adapter",
			"cpptools",
			"debugpy",
			"delve",
			"firefox-debug-adapter",
			"java-debug-adapter",
			"java-test",
			"js-debug-adapter",
			"kotlin-debug-adapter",
			"php-debug-adapter",
			"stylua",
			"jq",
			--"haskell-debug-adapter",
		    }
		})
	end,
}
