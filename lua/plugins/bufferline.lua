return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'kyazdani42/nvim-web-devicons',
	config = function()
		local icons = require('core.icons')
		local bufferline = require('bufferline')

		-- Helper function to add icons/count for diagnostics
		local function diag_indicators(count, level, diagnostics_dict, context) 
		    local s = " "
		    for e, n in pairs(diagnostics_dict) do
			local sym = e == "error" and icons.diagnostics.Error.." "
			  or (e == "warning" and icons.diagnostics.Warning.." " or icons.diagnostics.Information )
			s = s .. n .. sym
		    end
		    return s
		end


		-- HACK: Disabling this because all opts are registered as required
		-- https://github.com/akinsho/bufferline.nvim/pull/812
		---@diagnostic disable-next-line missing-fields
		bufferline.setup({
		    ---@diagnostic disable-next-line missing-fields
		    options = {
			themeable = true,
			mode = 'tabs',
			-- TODO: lsp diagnostics don't show up in tabs
			diagnostics = "nvim_lsp",
			diagnostics_indicator = diag_indicators,
			style_preset = bufferline.style_preset.minimal,
			buffer_close_icon = icons.ui.Close,
			modified_icon = icons.git.Mod,
			left_trunc_marker = '',
			right_trunc_marker = '',
			separator_style = "thin",
			color_icons = true,
			offsets = { -- TODO: not saying "File Explorer, saying NvimTree_1"
				{
				    filetype = "NvimTree",
				    text = "File Explorer",
				    text_align = "left",
				    separator = true,
				}
			},
		    }
		})
	end,
}
