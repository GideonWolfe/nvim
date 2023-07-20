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
        Cursor         {gui='reverse' }, -- Character under the cursor
        -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory { fg = wal_colors.primary.foreground }, -- Directory names (and other special names in listings)
        DiffAdd        { bg = hsl(background).mix(hsl(green), 20)}, -- Diff mode: Added line |diff.txt|
        DiffChange     { bg = hsl(background).mix(hsl(yellow), 20) }, -- Diff mode: Changed line |diff.txt|
        DiffDelete     { bg=background, fg=red }, -- Diff mode: Deleted line |diff.txt|
        DiffText       { bg = hsl(background).mix(hsl(blue), 30)}, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg       { fg=red }, -- Error messages on the command line
        VertSplit      { bg=background}, -- Column separating vertically split windows
        Folded         { bg = hsl(background).mix(hsl(foreground), 30), fg = foreground, gui='bold'}, -- Line used for closed folds
        FoldColumn     { bg = background }, -- 'foldcolumn' 
        SignColumn     { ctermbg=background}, -- Column where |signs| are displayed
        -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute     { gui='reverse'}, -- |:substitute| replacement text highlighting
        LineNr         { fg=foreground }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove    { fg=Normal.fg}, -- Line number for when the 'relativenumber' option is set, above the cursor line
        LineNrBelow    { fg=Normal.fg}, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg=green, gui='bold' }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        CursorLineFold { fg=blue, gui='bold'}, -- Like FoldColumn when 'cursorline' is set for the cursor line (color of + fold icon in column WHEN cursor is on fold line)
        CursorLineSign { bg=background}, -- Like SignColumn when 'cursorline' is set for the cursor line
        -- TODO: this is broken
        -- MatchParen     { gui='reverse', bg=TermCursor.bg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg        { fg=white, gui='bold' }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg=green, gui='bold'}, -- |more-prompt|
        NonText        { fg=green, gui='bold' }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal { fg = white },                           -- Normal text
        NormalFloat { fg = Normal.fg, bg = background }, -- Normal text in floating windows.
        FloatBorder    { fg=blue }, -- Border of floating windows.
        FloatBorderDark    { fg=yellow }, -- Border of floating windows.
        FloatTitle     { fg=green, gui='bold' }, -- Title of floating windows.
        NormalNC       { fg=Normal.fg}, -- normal text in non-current windows
        Pmenu          { ctermfg=foreground, ctermbg=background }, -- Popup menu: Normal item.
        PmenuSel       { fg=green, ctermbg=background}, -- Popup menu: Selected item.
        PmenuKind      { fg = blue}, -- Popup menu: Normal item "kind"
        PmenuKindSel   { fg = cyan}, -- Popup menu: Selected item "kind"
        -- TODO these two need to work better
        PmenuExtra     { fg = Normal.fg }, -- Popup menu: Normal item "extra text"
        PmenuExtraSel  { fg = green}, -- Popup menu: Selected item "extra text"
        PmenuSbar      { fg = green, }, -- Popup menu: Scrollbar.
        PmenuThumb     { fg = blue, bg = cyan}, -- Popup menu: Thumb of the scrollbar.
        Question       { fg=blue, gui='bold'}, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { gui='reverse'}, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad       { fg=red, gui='italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap       { fg=yellow, gui='undercurl'}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal     { fg=magenta, gui='undercurl'}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare      { fg=cyan, gui='undercurl'}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { fg = red, bg=background}, -- Status line of current window
        StatusLineNC   { ctermfg = background, ctermbg=background, bg=background}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine        { }, -- Tab pages line, not active tab page label
        -- TabLineFill    { }, -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        Title          { fg=Normal.fg, gui='bold' }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual         {gui='reverse' }, -- Visual mode selection
        VisualNOS      {gui='reverse' }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg     { fg=red }, -- Warning messages
        Whitespace     { bg = background}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator   { fg = green }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu       { fg=green, gui='bold' }, -- Current match in 'wildmenu' completion
        WinBar         { fg=green, gui='bold'}, -- Window bar of current window
        WinBarNC       { fg=white,}, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg=hsl(Normal.fg).darken(25) }, -- Any comment

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

        Underlined     { fg = Normal.fg, gui = "underline" }, -- Text that stands out, HTML links
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
        -- sym"@text.todo" { fg = red, gui = 'bold' },                          -- Todo
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

        -- TSRainbow
        TSRainbowRed               {fg=red,},
        TSRainbowYellow               {fg=yellow,},
        TSRainbowBlue               {fg=blue,},
        TSRainbowOrange               {fg=yellow,},
        TSRainbowGreen               {fg=green,},
        TSRainbowViolet               {fg=magenta,},
        TSRainbowCyan               {fg=cyan,},

        -- Git Signs
        GitSignsAdd               {fg=green, bg=background }, -- Git sign for added code
        GitSignsChange               {fg=yellow, bg=background }, -- Git sign for changed code
        GitSignsDelete               {fg=red, bg=background }, -- Git sign for deleted code

        -- Diff View
        -- TODO: stil see cursorline
        -- https://github.com/neovim/neovim/issues/9800
        -- DiffviewCursorLine               {fg=background, bg=background }, -- Git sign for deleted code
        DiffviewDiffDeleteDim               {fg=hsl(DiffDelete.fg).darken(25), bg=background }, -- Git sign for deleted code

        -- Indent Lines
        IndentBlanklineContextStart               {guisp='None'}, -- Indent blankline line

        -- Devicons
        -- TODO: doesn't work
        DevIconDefault               {fg = foreground,},

        -- Mason (default colors are ugly)
        MasonHighlightBlockBold               {bg=green, fg=background, gui='bold'},
        MasonHighlightBlockSecondary               {gui='reverse'},
        MasonHighlightBlockBoldSecondary               {gui='bold,reverse'},
        MasonHighlightSecondary               {fg = yellow},
        MasonMuted               {fg = Comment.fg},
        MasonMutedBlock               {bg = Comment.fg, fg = background},
        MasonMutedBlockBold               {bg = Comment.fg, fg = background, gui='bold'},
        MasonHeader               {fg = background, bg=foreground, gui='bold'},

        -- Noice
        -- https://github.com/folke/noice.nvim#-highlight-groups
        NoiceSplit               {fg=blue, bg=background}, -- Split used by Noice
        NoiceSplitBorder               {fg=blue, bg=background}, -- Split border used by Noice
        NoiceCursor               {gui='reverse'}, -- Cursor used by Noice
        -- cmdline options
        -- generic cmdline (applies to all modes)
        NoiceCmdlinePopupTitle               {fg=cyan,}, -- Title for cmd line input box
        NoiceCmdlineIcon               {fg=green,}, -- Icon for cmd line input box


        -- Telescope
        TelescopeSelection               {fg=green, bg=background, gui='bold'}, -- Currently selected item in telescope
        TelescopeSelectionCaret               {fg=magenta, bg=background, gui='bold'}, -- Currently selected item in telescope
        TelescopeMultiSelection               {gui='reverse'}, -- Currently selected item in telescope
        TelescopeBorder               {fg=FloatBorder.fg}, -- Border for floating window
        TelescopePromptBorder               {fg=cyan, gui='bold'}, -- Border for floating window
        TelescopeResultsBorder               {fg=red,}, -- Border for floating window
        TelescopePreviewBorder               {fg=yellow,}, -- Border for floating window
        TelescopeMatching               {fg=cyan,}, -- characters matching input
        TelescopePromptPrefix               {fg=red,}, -- characters matching input

        -- Trouble
        TroubleCount               {fg=red, gui='bold'}, -- Count of errors in trouble

        -- Fidget
        -- TODO: the background color isn't working
        -- Maybe just let Noice handle LSP progress
        FidgetTitle               {Title}, -- Title of fidget messages
        FidgetTask               {fg=cyan, bg=background}, -- Body of fidget messages


        --Dashboard
        DashboardHeader               {fg=red, gui='bold'},
        DashboardCenter               {fg=blue,},
        DashboardCenterIcon               {fg=green,},
        DashboardShortcut               {fg=red,},
        DashboardFooter               {fg=cyan,},

        -- Hop
        HopNextKey               {fg=green, gui='bold'},
        HopNextKey1               {fg=blue, gui='bold'},
        HopNextKey2              {fg=yellow, gui='bold'},
        HopUnmatched              {fg=red, gui='bold'},
        HopCursor              {fg=cyan, gui='bold'},
        HopPreview              {fg=magenta, gui='bold'},

        -- Symbol outline
        FocusedSymbol              {fg=magenta, gui='bold'},

        -- Nvim Notify
        NotifyBackground              {bg=background,},
        NotifyERRORBorder              {fg=DiagnosticError.fg,},
        NotifyERRORIcon              {fg=DiagnosticWarn.fg,},
        NotifyERRORTitle              {fg=DiagnosticError.fg, gui='bold'},
        NotifyWARNBorder              {fg=DiagnosticWarn.fg,},
        NotifyWARNIcon              {fg=DiagnosticError.fg,},
        NotifyWARNTitle              {fg=DiagnosticWarn.fg, gui='bold'},
        NotifyINFOBorder              {fg=DiagnosticInfo.fg,},
        NotifyINFOIcon              {fg=DiagnosticOk.fg,},
        NotifyINFOTitle              {fg=DiagnosticInfo.fg, gui='bold'},
        NotifyDEBUGBorder              {fg=DiagnosticHint.fg,},
        NotifyDEBUGIcon              {fg=DiagnosticOk.fg,},
        NotifyDEBUGTitle              {fg=DiagnosticInfo.fg, gui='bold'},
        NotifyTRACEBorder              {fg=DiagnosticHint.fg,},
        NotifyTRACEIcon              {fg=DiagnosticInfo.fg,},
        NotifyTRACETitle              {fg=DiagnosticWarn.fg, gui='bold'},

        -- Which key
        WhichKeySeparator              {fg=green, gui='bold'}, -- character between map and action/category

        -- LuaLine
        -- colors of the sections themselves for different modes
        -- TODO: these are being overwritten somewhere
        lualine_a_normal               {bg=green, fg=background},
        lualine_a_insert               {bg=blue, fg=background},
        lualine_a_visual               {bg=red, fg=background},
        -- see, this should be bright ass red
        lualine_a_command               {bg="red", fg=background},
        -- colors of diagnostic warning for different modes 
        -- (warn demos how you can change per mode but I use default for hint/error/info)
        lualine_b_diagnostics_warn_terminal               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_inactive               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_replace               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_command               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_visual               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_normal               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_warn_insert               {fg=DiagnosticWarn.fg},
        lualine_b_diagnostics_hint               {fg=DiagnosticHint.fg},
        lualine_b_diagnostics_error               {fg=DiagnosticError.fg},
        lualine_b_diagnostics_info               {fg=DiagnosticInfo.fg},
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
        -- Colors of devicons for different modes
        -- TODO: not sure if these work either
        lualine_x_filetype_DefaultDevIcon_terminal               {fg=white},
        lualine_x_filetype_DefaultDevIcon_inactive               {fg=white},
        lualine_x_filetype_DefaultDevIcon_replace               {fg=white},
        lualine_x_filetype_DefaultDevIcon_command               {fg=white},
        lualine_x_filetype_DefaultDevIcon_visual               {fg=white},
        lualine_x_filetype_DefaultDevIcon_insert               {fg=white},


        -- Bufferline (lots more hl groups but they work fine unmodified. check telescope highlights)
        -- white x button but red for selscted tab
        BufferLineCloseButton               {fg=white},
        BufferLineCloseButtonSelected               {fg=red},



    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
--
