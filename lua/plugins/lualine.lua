-- Status line
return {
	'nvim-lualine/lualine.nvim',
	dependencies = 'kyazdani42/nvim-web-devicons',
	after = 'chameleon',
	config = function()

		-- TODO: some of these modes aren't recognized in lualine?
		local function fmtMode()
		    local mode = vim.api.nvim_get_mode()["mode"]
		    if mode == "n" then
			return ''
		    elseif mode == "i" then
			return ''
		    elseif mode == "v" then
			return ''
		    elseif mode == "V" then
			return ''
		    elseif mode == "\22" then -- wierd encodings for ctrl + v
			return ''
		    elseif mode == "c" then
			return ''
		    elseif mode == "R" then
			return ''
			-- else
			--  return '?'
		    end
		end


		-- Import core icons to use in the lualine
		local icons = require("core.icons")

		-- helper function to source diff info from gitsigns
		-- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff
		local function diff_source()
		    local gitsigns = vim.b.gitsigns_status_dict
		    if gitsigns then
			return {
			    added = gitsigns.added,
			    modified = gitsigns.changed,
			    removed = gitsigns.removed
			}
		    end
		end

		-- Custom color options
		-- These HL groups are custom defined in the colorscheme file, they can be changed there.
		-- Colors for normal mode
		local LuaLineANormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineANormalReversed" })
		local LuaLineANormal = vim.api.nvim_get_hl(0, { name = "LuaLineANormal" })
		local LuaLineBNormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineBNormalReversed" })
		local LuaLineBNormal = vim.api.nvim_get_hl(0, { name = "LuaLineBNormal" })
		local LuaLineCNormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineCNormalReversed" })
		local LuaLineCNormal = vim.api.nvim_get_hl(0, { name = "LuaLineCNormal" })
		local LuaLineXNormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineXNormalReversed" })
		local LuaLineXNormal = vim.api.nvim_get_hl(0, { name = "LuaLineXNormal" })
		local LuaLineYNormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineYNormalReversed" })
		local LuaLineYNormal = vim.api.nvim_get_hl(0, { name = "LuaLineYNormal" })
		local LuaLineZNormalReversed = vim.api.nvim_get_hl(0, { name = "LuaLineZNormalReversed" })
		local LuaLineZNormal = vim.api.nvim_get_hl(0, { name = "LuaLineZNormal" })

		-- Colors for insert mode
		local LuaLineAInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineAInsertReversed" })
		local LuaLineAInsert = vim.api.nvim_get_hl(0, { name = "LuaLineAInsert" })
		local LuaLineBInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineBInsertReversed" })
		local LuaLineBInsert = vim.api.nvim_get_hl(0, { name = "LuaLineBInsert" })
		local LuaLineCInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineCInsertReversed" })
		local LuaLineCInsert = vim.api.nvim_get_hl(0, { name = "LuaLineCInsert" })
		local LuaLineXInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineXInsertReversed" })
		local LuaLineXInsert = vim.api.nvim_get_hl(0, { name = "LuaLineXInsert" })
		local LuaLineYInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineYInsertReversed" })
		local LuaLineYInsert = vim.api.nvim_get_hl(0, { name = "LuaLineYInsert" })
		local LuaLineZInsertReversed = vim.api.nvim_get_hl(0, { name = "LuaLineZInsertReversed" })
		local LuaLineZInsert = vim.api.nvim_get_hl(0, { name = "LuaLineZNormal" })

		-- Colors for visual mode
		local LuaLineAVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineAVisualReversed" })
		local LuaLineAVisual = vim.api.nvim_get_hl(0, { name = "LuaLineAVisual" })
		local LuaLineBVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineBVisualReversed" })
		local LuaLineBVisual = vim.api.nvim_get_hl(0, { name = "LuaLineBVisual" })
		local LuaLineCVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineCVisualReversed" })
		local LuaLineCVisual = vim.api.nvim_get_hl(0, { name = "LuaLineCVisual" })
		local LuaLineXVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineXVisualReversed" })
		local LuaLineXVisual = vim.api.nvim_get_hl(0, { name = "LuaLineXVisual" })
		local LuaLineYVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineYVisualReversed" })
		local LuaLineYVisual = vim.api.nvim_get_hl(0, { name = "LuaLineYVisual" })
		local LuaLineZVisualReversed = vim.api.nvim_get_hl(0, { name = "LuaLineZVisualReversed" })
		local LuaLineZVisual = vim.api.nvim_get_hl(0, { name = "LuaLineZNormal" })

		-- Colors for command mode
		local LuaLineACommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineACommandReversed" })
		local LuaLineACommand = vim.api.nvim_get_hl(0, { name = "LuaLineANormal" })
		local LuaLineBCommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineBCommandReversed" })
		local LuaLineBCommand = vim.api.nvim_get_hl(0, { name = "LuaLineBNormal" })
		local LuaLineCCommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineCCommandReversed" })
		local LuaLineCCommand = vim.api.nvim_get_hl(0, { name = "LuaLineCNormal" })
		local LuaLineXCommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineXCommandReversed" })
		local LuaLineXCommand = vim.api.nvim_get_hl(0, { name = "LuaLineXNormal" })
		local LuaLineYCommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineYCommandReversed" })
		local LuaLineYCommand = vim.api.nvim_get_hl(0, { name = "LuaLineYNormal" })
		local LuaLineZCommandReversed = vim.api.nvim_get_hl(0, { name = "LuaLineZCommandReversed" })
		local LuaLineZCommand = vim.api.nvim_get_hl(0, { name = "LuaLineZNormal" })


		-- TODO: This theme structure doesn't support HL groups
		-- Can I reference Lush theme colors?
		-- Why aren't all these colors available as highlight groups?
		local my_theme = {
		  normal = {
		    a = 'LuaLineANormalReversed',
		    b = 'LuaLineBNormalReversed',
		    c = 'LuaLineCNormal',
		    x = 'LuaLineXNormal',
		    y = 'LuaLineYNormalReversed',
		    z = 'LuaLineZNormalReversed',
		  },
		  insert = {
		    a = 'LuaLineAInsertReversed',
		    b = 'LuaLineBInsertReversed',
		    c = 'LuaLineCInsert',
		    x = 'LuaLineXInsert',
		    y = 'LuaLineYInsertReversed',
		    z = 'LuaLineZInsertReversed',
		  },
		  visual = {
		    a = 'LuaLineAVisualReversed',
		    b = 'LuaLineBVisualReversed',
		    c = 'LuaLineCVisual',
		    x = 'LuaLineXVisual',
		    y = 'LuaLineYVisualReversed',
		    z = 'LuaLineZVisualReversed',
		  },
		  -- replace = {
		  --   a = {bg = colors.red, fg = colors.black, gui = 'bold'},
		  --   b = {bg = colors.lightgray, fg = colors.white},
		  --   c = {bg = colors.black, fg = colors.white}
		  -- },
		  command = {
		    a = 'LuaLineACommandReversed',
		    b = 'LuaLineBCommandReversed',
		    c = 'LuaLineCCommand',
		    x = 'LuaLineXCommand',
		    y = 'LuaLineYCommandReversed',
		    z = 'LuaLineZCommandReversed',
		  },
		  -- inactive = {
		  --   a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
		  --   b = {bg = colors.darkgray, fg = colors.gray},
		  --   c = {bg = colors.darkgray, fg = colors.gray}
		  -- }
		}

		require('lualine').setup {
		    options = {
			icons_enabled = true,
			-- theme = "auto",
			theme = my_theme,
			-- TODO: find separators that work better
			-- Arrow look
			--component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			-- Hard slant look
			-- section_separators = { left = '', right = '' },
			component_separators = { left = '╲', right = '╱' },
			--section_separators = { left = '', right = '' },
			disabled_filetypes = {
			    statusline = {},
			    winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
			    statusline = 1000,
			    tabline = 1000,
			    winbar = 1000,
			}
		    },
		    sections = {
			 -- A section
			lualine_a = {
			    fmtMode
			},
			-- B section
			-- TODO: add solid color background so so its distinct from C section
			lualine_b = {
			    'branch',
			},
			-- C section
			lualine_c = {
			    -- Git Diffs
			    {
				'diff',
				--source = diff_source,
				source = nil,
				colored = true,
				-- TODO: these stopped showing
				symbols = {
				    --added = icons.git.Add,
				    added = icons.git.Add.." ",
				    modified = icons.git.Mod.." ",
				    removed = icons.git.Remove.." ",
				}
			    },
			    -- File diagnostics
			    {
				'diagnostics',
				symbols = {
				    error = icons.diagnostics.Error,
				    warn = icons.diagnostics.Warning,
				    info = icons.diagnostics.Information,
				    hint = icons.diagnostics.Hint
				},
				diagnostics_color = {
				    error = "DiagnosticError",
				    warn = "DiagnosticWarn",
				    info = "DiagnosticInfo",
				    hint = "DiagnosticHint"
				}
			    },
			    -- File name
			    {
				-- TODO: https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#changing-filename-color-based-on--modified-status
				-- could be integrated https://github.com/nvim-lualine/lualine.nvim/issues/916
				'filename',
				symbols = {
				    modified = icons.ui.Pencil,
				    readonly = icons.ui.Lock,
				    unnamed = icons.documents.File,
				    newfile = icons.ui.NewFile,
				}
			    }
			},
			-- X section
			lualine_x = {
			    -- File encoding
			    {
				'encoding'
			    },
			    -- File Format
			    {
				'fileformat'
			    },
			    -- File Type
			    {
				'filetype'
			    },
			    -- Custom section to show recording macro messages in status
			    {
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "DiagnosticInfo" }
			    }
			},
			-- Y section
			lualine_y = {
			    -- Progress in file
			    {
				'progress'
			    }
			},
			-- Z section
			lualine_z = {
			    -- Location in file
			    {
				'location'
			    }
			}
		    },
		    inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		    },
		    tabline = {},
		    winbar = {},
		    inactive_winbar = {},
		    extensions = {
			'lazy',
			'nvim-tree',
			'trouble',
			'symbols-outline',
			'nvim-dap-ui',
			'fugitive',
			'man',
		    }
		}
	end,
}
