return {
	"phaazon/hop.nvim",
	branch = "v2", -- optional but strongly recommended
	config = function()
		require'hop'.setup {
		  quit_key = '<SPC>',
		  keys = 'etovxqpdygfblzhckisuran',
		  create_hl_autocmd = false,
		}
	end,
}
