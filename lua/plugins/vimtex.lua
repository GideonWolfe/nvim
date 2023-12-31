return {
    'lervag/vimtex',
    config = function()
        local g = vim.g
        g.vimtex_view_method = 'zathura'
        g.latex_view_general_viewer = 'zathura'
        g.tex_flavor = 'latex'
        g.vimtex_complete_enabled = 1
        -- g.vimtex_quickfix_method = 'latexmk'
        g.vimtex_compiler_progname = 'nvr'
        -- g.tex_conceal = ''
        -- g.vimtex_quickfix_mode = 2
        -- g.vimtex_view_forward_search_on_start = 0
        -- g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
        -- -- This must be a dictionary, and {} gets converted to a list
        -- g.vimtex_syntax_conceal = { foo = false }
    end,
}
