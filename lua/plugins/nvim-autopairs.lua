require('nvim-autopairs').setup({
  fast_wrap = {
    chars = { '{', '[', '(', '"', "'", "`" },
  },
})

-- adding mapping for cmp_pos
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
