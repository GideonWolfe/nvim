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
local custom_theme = require('lualine.themes.auto')

-- custom_theme.normal.a.bg = 'black'
-- custom_theme.normal.a.fg = 'blue'
-- custom_theme.normal.b.bg = 'black'
-- custom_theme.normal.b.fg = 'green'
-- custom_theme.normal.c.bg = 'black'
--
-- custom_theme.insert.a.bg = 'black'
-- custom_theme.insert.a.fg = 'green'
-- custom_theme.insert.b.bg = 'black'
-- custom_theme.insert.b.fg = 'yellow'
-- custom_theme.insert.c.bg = 'black'
-- custom_theme.insert.c.fg = 'green'
--
-- custom_theme.command.a.bg = 'black'
-- custom_theme.command.a.fg = 'cyan'
-- custom_theme.command.b.bg = 'black'
-- custom_theme.command.b.fg = 'purple'
-- custom_theme.command.c.bg = 'black'
-- custom_theme.command.c.fg = 'magenta'
--
-- custom_theme.replace.a.bg = 'black'
-- custom_theme.replace.a.fg = 'cyan'
-- custom_theme.replace.b.bg = 'black'
-- custom_theme.replace.b.fg = 'purple'
-- custom_theme.replace.c.bg = 'black'
-- custom_theme.replace.c.fg = 'magenta'
--
-- custom_theme.visual.a.bg = 'black'
-- custom_theme.visual.a.fg = 'green'
-- custom_theme.visual.b.bg = 'black'
-- custom_theme.visual.b.fg = 'yellow'
-- custom_theme.visual.c.bg = 'black'
-- custom_theme.visual.c.fg = 'purple'


-- TODO: seems to always consider window inactive??
-- custom_theme.inactive.a.bg = 'black'
-- custom_theme.inactive.a.fg = 'grey'
-- custom_theme.inactive.b.bg = 'black'
-- custom_theme.inactive.b.fg = 'grey'
-- custom_theme.inactive.c.bg = 'black'
-- custom_theme.inactive.c.fg = 'grey'


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "auto",
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
        lualine_a = { fmtMode },
        lualine_b = {
            'branch',
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
        lualine_c = {
            -- {
            --     -- TODO: https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#changing-filename-color-based-on--modified-status
            --     -- could be integrated https://github.com/nvim-lualine/lualine.nvim/issues/916
            --     'filename',
            --     symbols = {
            --         modified = icons.ui.Pencil,
            --         readonly = icons.ui.Lock,
            --         unnamed = icons.documents.File,
            --         newfile = icons.ui.NewFile,
            --     }
            -- }
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
            -- Custom section to show recording macro messages in status
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "DiagnosticInfo" }
            }
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
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
