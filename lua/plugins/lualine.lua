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

-- TODO: This theme structure doesn't support HL groups
-- Can I reference Lush theme colors?
-- Why aren't all these colors available as highlight groups?
-- local my_theme = {
  -- normal = {
    -- a = {bg = "DiagnosticError", fg = "magenta", gui = 'bold'},
    -- b = {bg = "red", fg = "green"},
    -- c = {bg = colors.darkgray, fg = colors.gray}
  -- },
  -- insert = {
  --   a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
  --   b = {bg = colors.lightgray, fg = colors.white},
  --   c = {bg = colors.lightgray, fg = colors.white}
  -- },
  -- visual = {
  --   a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
  --   b = {bg = colors.lightgray, fg = colors.white},
  --   c = {bg = colors.inactivegray, fg = colors.black}
  -- },
  -- replace = {
  --   a = {bg = colors.red, fg = colors.black, gui = 'bold'},
  --   b = {bg = colors.lightgray, fg = colors.white},
  --   c = {bg = colors.black, fg = colors.white}
  -- },
  -- command = {
  --   a = {bg = colors.green, fg = colors.black, gui = 'bold'},
  --   b = {bg = colors.lightgray, fg = colors.white},
  --   c = {bg = colors.inactivegray, fg = colors.black}
  -- },
  -- inactive = {
  --   a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
  --   b = {bg = colors.darkgray, fg = colors.gray},
  --   c = {bg = colors.darkgray, fg = colors.gray}
  -- }
-- }

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        -- theme = my_theme,
        -- TODO: find separators that work better
        --component_separators = { left = '', right = '' },
        --section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        --component_separators = { left = '\\', right = '/' },
        component_separators = { right = '╱', left = '╲' },
        -- component_separators = { left = '⦒', right = '⦑' },
        -- section_separators = { left = '', right = '' },
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
                source = diff_source,
                colored = true,
                -- Disabled because hl groups handle it with more granularity
                -- diff_color = {
                --     added = 'green',
                --     modified = 'yellow',
                --     removed = 'red',
                -- },
                symbols = {
                    added = icons.git.Add,
                    modified = icons.git.Mod,
                    removed = icons.git.Remove,
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
