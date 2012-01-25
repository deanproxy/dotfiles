set background=dark "or light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256

highlight Boolean             guifg=#b1d631 ctermfg=148                           gui=none cterm=none
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Comment             guifg=#3f3f3f ctermfg=237                           gui=italic cterm=italic
highlight Conditional         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Constant            guifg=#ff9800 ctermfg=208                           gui=none cterm=none
highlight Cursor              guifg=#eeeeee ctermfg=255 guibg=#626262 ctermbg=241 gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#e2e2e5 ctermfg=146                           gui=none cterm=none
highlight DiffChange          guifg=#e2e2e5 ctermfg=146                           gui=none cterm=none
highlight DiffDelete          guifg=#e2e2e5 ctermfg=146                           gui=none cterm=none
highlight DiffText            guifg=#ff9800 ctermfg=208                           gui=none cterm=none
highlight Directory           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight ErrorMsg            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Exception           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Folded              guifg=#a0a8b0 ctermfg=67  guibg=#384048 ctermbg=67  gui=none cterm=none
highlight Function            guifg=#ffff00 ctermfg=11                            gui=none cterm=none
highlight Identifier          guifg=#b1d631 ctermfg=148                           gui=none cterm=none
highlight Ignore              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight IncSearch           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Include             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Keyword             guifg=#ff9800 ctermfg=208                           gui=none cterm=none
highlight Label               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight LineNr              guifg=#303030 ctermfg=236 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight MatchParen          guifg=#d0ffc0 ctermfg=156 guibg=#202020 ctermbg=234 gui=bold cterm=bold
highlight ModeMsg             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight MoreMsg             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight NonText             guifg=#808080 ctermfg=8   guibg=#202020 ctermbg=234 gui=none cterm=none
highlight Normal              guifg=#e2e2e5 ctermfg=146 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight Number              guifg=#ff9800 ctermfg=208                           gui=none cterm=none
highlight Operator            guifg=#e2e2e5 ctermfg=146                           gui=none cterm=none
highlight PMenu               guifg=#ffffff ctermfg=15  guibg=#202020 ctermbg=234 gui=none cterm=none
highlight PMenuSbar           guifg=#ffffff ctermfg=15  guibg=#202020 ctermbg=234 gui=none cterm=none
highlight PMenuSel            guifg=#000000 ctermfg=0   guibg=#b1d631 ctermbg=148 gui=none cterm=none
highlight PMenuThumb          guifg=#ffffff ctermfg=15  guibg=#303030 ctermbg=236 gui=none cterm=none
highlight PreCondit           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight PreProc             guifg=#faf4c6 ctermfg=230                           gui=none cterm=none
highlight Question            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Repeat              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Search              guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SignColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Special             guifg=#ff9800 ctermfg=208                           gui=none cterm=none
highlight SpecialChar         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#808080 ctermfg=8   guibg=#343434 ctermbg=236 gui=none cterm=none
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#7e8aa2 ctermfg=68                            gui=none cterm=none
highlight StatusLine          guifg=#d3d3d5 ctermfg=146 guibg=#303030 ctermbg=236 gui=none cterm=none
highlight StatusLineNC        guifg=#939395 ctermfg=103 guibg=#303030 ctermbg=236 gui=none cterm=none
highlight StorageClass        guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight String              guifg=#606060 ctermfg=59                            gui=none cterm=none
highlight Structure           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#f6f3e8 ctermfg=230                           gui=bold cterm=bold
highlight Todo                guifg=#8f8f8f ctermfg=245                           gui=none cterm=none
highlight Type                guifg=#7e8aa2 ctermfg=68                            gui=none cterm=none
highlight Typedef             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Underlined          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#444444 ctermfg=238 guibg=#303030 ctermbg=236 gui=none cterm=none
highlight Visual              guifg=#faf4c6 ctermfg=230 guibg=#3c414c ctermbg=68  gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight WarningMsg          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight WildMenu            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight pythonBuiltin       guifg=#e2e2e5 ctermfg=146                           gui=none cterm=none
