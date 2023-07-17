--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl
local wal_colors = require('core.chameleon.colors.wal_colors')

-- Define some basic colors from the cached wal file
local background = wal_colors.primary.background
local foreground = wal_colors.primary.foreground
local black = wal_colors.normal.black
local red = wal_colors.normal.red
local green = wal_colors.normal.green
local yellow = wal_colors.normal.yellow
local blue = wal_colors.normal.blue
local magenta = wal_colors.normal.magenta
local cyan = wal_colors.normal.cyan
local white = wal_colors.normal.white
local brightblack = wal_colors.bright.black
local brightred = wal_colors.bright.red
local brightgreen = wal_colors.bright.green
local brightyellow = wal_colors.bright.yellow
local brightblue = wal_colors.bright.blue
local brightmagenta = wal_colors.bright.magenta
local brightcyan = wal_colors.bright.cyan
local brightwhite = wal_colors.bright.cyan






-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
        -- groups, mostly used for styling UI elements.
        -- Comment them out and add your own properties to override the defaults.
        -- An empty definition `{}` will clear all styling, leaving elements looking
        -- like the 'Normal' group.
        -- To be able to link to a group, it must already be defined, so you may have
        -- to reorder items as you go.
        --
        -- See :h highlight-groups
        --
        -- ColorColumn    { }, -- Columns set with 'colorcolumn'
        -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        -- Cursor         {fg=red }, -- Character under the cursor
        -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory { fg = wal_colors.primary.foreground }, -- Directory names (and other special names in listings)
        -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
        -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
        -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
        -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        -- ErrorMsg       { }, -- Error messages on the command line
        VertSplit      { bg=black}, -- Column separating vertically split windows
        -- Folded         { }, -- Line used for closed folds
        -- FoldColumn     { }, -- 'foldcolumn'
        SignColumn     { ctermbg=black}, -- Column where |signs| are displayed
        -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute     { }, -- |:substitute| replacement text highlighting
        LineNr         { fg=Normal.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove    { fg=Normal.fg}, -- Line number for when the 'relativenumber' option is set, above the cursor line
        LineNrBelow    { fg=Normal.fg}, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg=green, gui='bold' }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg        { }, -- |more-prompt|
        -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal { fg = white },                           -- Normal text
        NormalFloat { fg = Normal.fg, bg = background }, -- Normal text in floating windows.
        -- FloatBorder    { }, -- Border of floating windows.
        -- FloatTitle     { }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { ctermfg=white, ctermbg=black }, -- Popup menu: Normal item.
        PmenuSel       { fg=green, ctermbg=black}, -- Popup menu: Selected item.
        PmenuKind      { fg = blue}, -- Popup menu: Normal item "kind"
        PmenuKindSel   { fg = cyan}, -- Popup menu: Selected item "kind"
        -- TODO these two need to work better
        PmenuExtra     { fg = Normal.fg }, -- Popup menu: Normal item "extra text"
        PmenuExtraSel  { fg = green}, -- Popup menu: Selected item "extra text"
        PmenuSbar      { fg = green, }, -- Popup menu: Scrollbar.
        PmenuThumb     { fg = blue, bg = cyan}, -- Popup menu: Thumb of the scrollbar.
        -- Question       { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad       { fg=red, gui='italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap       { fg=yellow, gui='undercurl'}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal     { fg=magenta, gui='undercurl'}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare      { fg=cyan, gui='undercurl'}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { ctermfg = red, ctermbg=black}, -- Status line of current window
        StatusLineNC   { ctermfg = black, ctermbg=black, bg=black}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine        { }, -- Tab pages line, not active tab page label
        -- TabLineFill    { }, -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
        -- Visual         { }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg     { }, -- Warning messages
        Whitespace     { bg = black}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator   { fg = green }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu       { }, -- Current match in 'wildmenu' completion
        -- WinBar         { }, -- Window bar of current window
        -- WinBarNC       { }, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        -- Comment        { }, -- Any comment

        Constant       {fg = green}, -- (*) Any constant
        String         {fg = green}, --   A string constant: "this is a string"
        Character      {fg = green}, --   A character constant: 'c', '\n'
        Number         {fg = green}, --   A number constant: 234, 0xff
        Boolean        {fg = green}, --   A boolean constant: TRUE, false
        Float          {fg = green}, --   A floating point constant: 2.3e10

        Identifier     {fg = cyan }, -- (*) Any variable name
        Function       {fg = cyan }, --   Function name (also: methods for classes)

        Statement      {fg = yellow, gui='bold'}, -- (*) Any statement
        Conditional    { fg = yellow, gui='bold'}, --   if, then, else, endif, switch, etc.
        Repeat         { fg = yellow, gui='bold'}, --   for, do, while, etc.
        Label          { fg = yellow, gui='bold'}, --   case, default, etc.
        Operator       { fg = yellow, gui='bold'}, --   "sizeof", "+", "*", etc.
        Keyword        { fg = yellow, gui='bold'}, --   any other keyword
        Exception      { fg = yellow, gui='bold'}, --   try, catch, throw

        PreProc        { fg = brightmagenta,}, -- (*) Generic Preprocessor
        Include        { fg = brightmagenta,}, --   Preprocessor #include
        Define         { fg = brightmagenta,}, --   Preprocessor #define
        Macro          { fg = brightmagenta,}, --   Same as Define
        PreCondit      { fg = brightmagenta,}, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = brightgreen,}, -- (*) int, long, char, etc.
        StorageClass   { fg = brightgreen,}, --   static, register, volatile, etc.
        Structure      { fg = brightgreen,}, --   struct, union, enum, etc.
        Typedef        { fg = brightgreen,}, --   A typedef

        Special        {fg = brightblue,}, -- (*) Any special symbol
        SpecialChar    {fg = brightblue,}, --   Special character in a constant
        Tag            {fg = brightblue,}, --   You can use CTRL-] on this
        Delimiter      {fg = brightblue,}, --   Character that needs attention
        SpecialComment {fg = brightblue,}, --   Special things inside a comment (e.g. '\n')
        Debug          {fg = brightblue,}, --   Debugging statements

        -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { fg = red, gui='bold,italic' }, -- Any erroneous construct
        Todo           {fg = yellow, gui='bold' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError { fg = red },                                                             -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn { fg = yellow },                                                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo { fg = brightblue },                                                       -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint { fg = white },                                                            -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticOk { fg = green },                                                              -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticVirtualTextError { fg = DiagnosticError.fg },                                   -- Used for "Error" diagnostic virtual text.
        DiagnosticVirtualTextWarn { fg = DiagnosticWarn.fg },                                     -- Used for "Warn" diagnostic virtual text.
        DiagnosticVirtualTextInfo { fg = DiagnosticInfo.fg },                                     -- Used for "Info" diagnostic virtual text.
        DiagnosticVirtualTextHint { fg = DiagnosticHint.fg },                                     -- Used for "Hint" diagnostic virtual text.
        DiagnosticVirtualTextOk { fg = DiagnosticOk.fg },                                         -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError { fg = DiagnosticError.fg, gui = 'bold' },                       -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn { fg = Normal.fg, gui = 'undercurl', guifg = DiagnosticWarn.fg }, -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo    { fg = Normal.fg, gui='undercurl',guisp=DiagnosticInfo.fg} , -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint    { fg = Normal.fg, gui='undercurl',guisp=DiagnosticHint.fg} , -- Used to underline "Hint" diagnostics.
        DiagnosticUnderlineOk      { fg = Normal.fg, gui='undercurl',guisp=DiagnosticError.fg } , -- Used to underline "Ok" diagnostics.
        DiagnosticFloatingError    { fg = DiagnosticError.fg} , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        DiagnosticFloatingWarn     { fg = DiagnosticWarn.fg} , -- Used to color "Warn" diagnostic messages in diagnostics float.
        DiagnosticFloatingInfo     { fg = DiagnosticInfo.fg} , -- Used to color "Info" diagnostic messages in diagnostics float.
        DiagnosticFloatingHint     { fg = DiagnosticHint.fg} , -- Used to color "Hint" diagnostic messages in diagnostics float.
        DiagnosticFloatingOk       { fg = DiagnosticOk.fg } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        DiagnosticSignError        { fg = DiagnosticError.fg } , -- Used for "Error" signs in sign column.
        DiagnosticSignWarn         { fg = DiagnosticWarn.fg } , -- Used for "Warn" signs in sign column.
        DiagnosticSignInfo         { fg = DiagnosticInfo.fg } , -- Used for "Info" signs in sign column.
        DiagnosticSignHint         { fg = DiagnosticHint.fg } , -- Used for "Hint" signs in sign column.
        DiagnosticSignOk           { fg = DiagnosticOk.fg } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        -- sym"@text.literal"      { }, -- Comment
        -- sym"@text.reference"    { }, -- Identifier
        -- sym"@text.title"        { }, -- Title
        -- sym"@text.uri"          { }, -- Underlined
        -- sym"@text.underline"    { }, -- Underlined
        sym"@text.todo" { fg = red, gui = 'bold' },                          -- Todo
        --sym"@comment" { fg = Normal.fg.desaturate(20).lighten(25) },         -- Comment
        -- sym"@punctuation"       { }, -- Delimiter
        -- sym"@constant"          { }, -- Constant
        -- sym"@constant.builtin"  { }, -- Special
        sym"@constant.macro" { fg = magenta },   -- Define
        sym"@define" { fg = magenta },           -- Define
        sym"@macro" { fg = magenta },            -- Macro
        -- sym"@string"            { }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        -- sym"@character"         { }, -- Character
        -- sym"@character.special" { }, -- SpecialChar
        -- sym"@number"            { }, -- Number
        -- sym"@boolean"           { }, -- Boolean
        -- sym"@float"             { }, -- Float
        -- sym"@function"          { }, -- Function
        -- sym"@function.builtin"  { }, -- Special
        -- sym"@function.macro"    { }, -- Macro
        -- sym"@parameter"         { }, -- Identifier
        -- sym"@method"            { }, -- Function
        -- sym"@field"             { }, -- Identifier
        -- sym"@property"          { }, -- Identifier
        -- sym"@constructor"       { }, -- Special
        -- sym"@conditional"       { }, -- Conditional
        -- sym"@repeat"            { }, -- Repeat
        -- sym"@label"             { }, -- Label
        -- sym"@operator"          { }, -- Operator
        -- sym"@keyword"           { }, -- Keyword
        -- sym"@exception"         { }, -- Exception
        -- sym"@variable"          { }, -- Identifier
        -- sym"@type"              { }, -- Type
        -- sym"@type.definition"   { }, -- Typedef
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        -- sym"@namespace"         { }, -- Identifier
        -- sym"@include"           { }, -- Include
        -- sym"@preproc"           { }, -- PreProc
        -- sym"@debug"             { }, -- Debug
        -- sym"@tag"               { }, -- Tag


        --------------------------------------
        -- PLUGIN SPECIFIC HIGHLIGHT GROUPS --
        --------------------------------------

        -- Git Signs
        GitSignsAdd               {fg=green, bg=black }, -- Git sign for added code
        GitSignsChange               {fg=yellow, bg=black }, -- Git sign for changed code
        GitSignsDelete               {fg=red, bg=black }, -- Git sign for deleted code

        -- Indent Lines
        IndentBlanklineContextStart               {guisp='None'}, -- Indent blankline line


        -- Noice
        NoiceSplit               {fg=blue, bg=black}, -- Split uised by Noice
        NoiceSplitBorder               {fg=blue, bg=black}, -- Split uised by Noice

        -- LuaLine
        -- colors of diagnostic warning for different modes
        lualine_b_diagnostics_warn_terminal               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_inactive               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_replace               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_command               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_visual               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_normal               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_insert               {fg=DiagnosticWarn.fg},
        -- colors of diffs for different modes
        lualine_b_diff_added_terminal               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_inactive               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_replace               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_command               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_visual               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_normal               {fg=GitSignsAdd.fg},
        lualine_b_diff_added_insert               {fg=GitSignsAdd.fg},
        lualine_b_diff_modified_terminal               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_inactive               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_replace               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_command               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_visual               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_normal               {fg=GitSignsChange.fg},
        lualine_b_diff_modified_insert               {fg=GitSignsChange.fg},
        lualine_b_diff_removed_terminal               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_inactive               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_replace               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_command               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_visual               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_normal               {fg=GitSignsDelete.fg},
        lualine_b_diff_removed_insert               {fg=GitSignsDelete.fg},

    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
--
