-- Enable telescope to find media files
return {
	"nvim-telescope/telescope-media-files.nvim",
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	enabled = true
}
