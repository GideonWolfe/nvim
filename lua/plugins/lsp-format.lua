-- LSP integrated formatting
return {
	"lukas-reineke/lsp-format.nvim",
	config = function()
		require("lsp-format").setup {
		    -- exclude = { "lua_ls" }
		}
	end,
}
