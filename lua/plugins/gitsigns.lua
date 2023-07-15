require('gitsigns').setup {
  signs = {
    add = {hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr'},
    change = {hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr'},
    delete = {hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    topdelete = {hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr'}
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
}
