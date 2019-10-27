if (&background ==# "dark" && get(g:, "colors_name", "") ==# "jeskai")
    runtime! colors/yin.vim
    finish
endif

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "jeskai"


let s:palette = {}

let s:palette.white = [15, '#f7f7f7']
let s:palette.offwhite = [255, '#f7f7f7']
let s:palette.gray15 = [253, '#e4e4e4']
let s:palette.gray15 = [253, '#e4e4e4']
let s:palette.gray14 = [250, '#bcbcbc']
let s:palette.gray13 = [249, '#b2b2b2']
let s:palette.gray12 = [248, '#a8a8a8']
let s:palette.gray11 = [247, '#9e9e9e']
let s:palette.gray10 = [246, '#949494']
let s:palette.gray09 = [245, '#8a8a8a']
let s:palette.gray08 = [244, '#808080']
let s:palette.gray07 = [243, '#767676']
let s:palette.gray06 = [242, '#666666']
let s:palette.gray05 = [241, '#606060']
let s:palette.gray04 = [240, '#585858']
let s:palette.gray03 = [239, '#4e4e4e']
let s:palette.gray02 = [238, '#444444']
let s:palette.gray01 = [235, '#262626']
let s:palette.black = [233, '#121212']

let s:palette.purple = [98, '#875fd7']
let s:palette.brown = [52, '#af5f00']
"let s:palette.blue1 = [39, '#73ADFF']
let s:palette.blue1 = [26, '#73ADFF']
let s:palette.blue2 = [26, '#4A92F8']
let s:palette.blue3 = [27, '#1F69D1']
let s:palette.blue4 = [21, '#0047AB']
let s:palette.blue5 = [19, '#003785']
let s:palette.blue6 = [67, '#00275E']
let s:palette.blue7 = [67, '#001738']
let s:palette.blue8 = [67, '#5f87af']
let s:palette.darkblue = [27, '#0047AB']
let s:palette.green = [65, '#5f875f']
let s:palette.red = [1, '#870000']
let s:palette.magenta = [125, '#af005f']
let s:palette.gold = [184, '#af005f']
let s:palette.purple = [57, '#af005f']

if has("nvim") && (has("gui_running") || &termguicolors)
    let g:terminal_color_0 = s:palette.gray01[1]
    let g:terminal_color_1 = s:palette.gray06[1]
    let g:terminal_color_2 = s:palette.gray03[1]
    let g:terminal_color_3 = s:palette.gray11[1]
    let g:terminal_color_4 = s:palette.gray02[1]
    let g:terminal_color_5 = s:palette.gray08[1]
    let g:terminal_color_6 = s:palette.gray09[1]
    let g:terminal_color_7 = s:palette.gray13[1]
    let g:terminal_color_8 = s:palette.gray03[1]
    let g:terminal_color_9 = s:palette.gray10[1]
    let g:terminal_color_10 = s:palette.gray07[1]
    let g:terminal_color_11 = s:palette.gray13[1]
    let g:terminal_color_12 = s:palette.gray05[1]
    let g:terminal_color_13 = s:palette.gray12[1]
    let g:terminal_color_14 = s:palette.gray14[1]
    let g:terminal_color_15 = s:palette.white[1]
endif

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction


call s:hi('Normal', s:palette.black, s:palette.offwhite, 'bold')
set background=light

call s:hi('Constant', s:palette.blue1, [], 'bold')
call s:hi('String', s:palette.blue1, [], '')
call s:hi('Number', s:palette.blue1, [], 'bold')

call s:hi('Identifier', s:palette.blue5, [], 'none')
call s:hi('Function', s:palette.red, [], '')

call s:hi('Statement', s:palette.blue2, [], 'bold')
call s:hi('Operator', s:palette.gray03, [], 'none')
call s:hi('Keyword', s:palette.purple, [], '')

call s:hi('PreProc', s:palette.blue2, [], 'none')

call s:hi('Type', s:palette.purple, [], 'bold')

call s:hi('Special', s:palette.gray10, [], '')
call s:hi('SpecialComment', s:palette.gray12, [], 'bold')

call s:hi('Title', s:palette.gray10, [], 'bold')
call s:hi('Todo', s:palette.purple, s:palette.offwhite, '')
if has("nvim") || has("gui_running")
    call s:hi('Comment', s:palette.gray12, [], 'italic')
else
    call s:hi('Comment', s:palette.gray12, [], '')
endif

call s:hi('LineNr', s:palette.offwhite, s:palette.gray03, 'none')
call s:hi('FoldColumn', s:palette.gray08, s:palette.gray15, 'none')
call s:hi('CursorLine', [], s:palette.gray15, 'none')
call s:hi('CursorLineNr', s:palette.black, s:palette.offwhite, 'none')

call s:hi('Visual', s:palette.offwhite, s:palette.gray06, '')
call s:hi('Search', s:palette.gray15, s:palette.gray03, 'none')
call s:hi('IncSearch', s:palette.offwhite, s:palette.gray11, 'bold')

call s:hi('SpellBad', s:palette.red, s:palette.offwhite, 'undercurl')
call s:hi('SpellCap', s:palette.red, s:palette.offwhite, 'undercurl')
call s:hi('SpellLocal', s:palette.red, s:palette.offwhite, 'undercurl')
call s:hi('SpellRare', s:palette.brown, s:palette.offwhite, 'undercurl')

call s:hi('Error', s:palette.red, s:palette.offwhite, 'bold')
call s:hi('ErrorMsg', s:palette.red, s:palette.offwhite, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.offwhite, '')
call s:hi('ModeMsg', s:palette.gray10, [], '')
call s:hi('MoreMsg', s:palette.gray10, [], '')

call s:hi('MatchParen', s:palette.blue6, s:palette.offwhite, 'reverse')

call s:hi('Cursor', [], s:palette.gray12, '')
call s:hi('Underlined', s:palette.gray08, [], 'underline')
call s:hi('SpecialKey', s:palette.gray13, [], '')
call s:hi('NonText', s:palette.gray13, [], '')
call s:hi('Directory', s:palette.gray08, [], '')

call s:hi('Pmenu', s:palette.gray05, s:palette.gray14, 'none')
call s:hi('PmenuSbar', s:palette.offwhite, s:palette.gray01, 'none')
call s:hi('PmenuSel', s:palette.gray14, s:palette.gray05, '')
call s:hi('PmenuThumb', s:palette.gray14, s:palette.gray03, 'none')

call s:hi('StatusLine', s:palette.gray03, s:palette.gray13, 'none')
call s:hi('StatusLineNC', s:palette.gray13, s:palette.gray15, 'none')
call s:hi('WildMenu', s:palette.gray08, [], '')
call s:hi('VertSplit', s:palette.gray13, s:palette.gray13, 'none')

call s:hi('DiffAdd', s:palette.offwhite, s:palette.green, '')
call s:hi('DiffChange', s:palette.offwhite, s:palette.blue1, '')
call s:hi('DiffDelete', s:palette.offwhite, s:palette.red, '')
call s:hi('DiffText', s:palette.offwhite, s:palette.darkblue, '')
call s:hi('DiffAdded', s:palette.green, s:palette.offwhite, '')
call s:hi('DiffChanged', s:palette.blue1, s:palette.offwhite, '')
call s:hi('DiffRemoved', s:palette.red, s:palette.offwhite, '')


highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
