return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
		    -- uses DiffviewDiffDeletedDim for HL group 
		    enhanced_diff_hl = true,
		})
	end,
}
