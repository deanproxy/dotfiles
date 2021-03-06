" Vim color file - oceanblack
" Generated by http://bytefluent.com/vivify 2012 01 28
set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "oceanblack"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." guisp=#".a:bg." ctermbg=".<SID>rgb(a:bg)
	endif
	if a:attr != ""
		exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
	endif
endfun
" }}}
call <SID>X("Boolean","00ffff","000000","none")
call <SID>X("CTagsClass","e2e4e5","","none")
call <SID>X("CTagsGlobalConstant","e2e4e5","","none")
call <SID>X("CTagsGlobalVariable","e2e4e5","","none")
call <SID>X("CTagsImport","e2e4e5","","none")
call <SID>X("CTagsMember","e2e4e5","","none")
call <SID>X("Character","e2e4e5","","none")
call <SID>X("Comment","875f5f","","none")
call <SID>X("Conditional","5fd75f","000000","none")
call <SID>X("Constant","008080","000000","none")
call <SID>X("Cursor","ffffff","afd7d7","none")
call <SID>X("CursorColumn","e2e4e5","","none")
call <SID>X("CursorLine","","333333","none")
call <SID>X("Debug","e2e4e5","","none")
call <SID>X("Define","87afd7","000000","none")
call <SID>X("DefinedName","e2e4e5","","none")
call <SID>X("Delimiter","e2e4e5","","none")
call <SID>X("DiffAdd","ffffff","005f00","none")
call <SID>X("DiffChange","ff5fff","870087","none")
call <SID>X("DiffDelete","0000af","00005f","none")
call <SID>X("DiffText","00ffff","000000","none")
call <SID>X("Directory","c000c0","000000","none")
call <SID>X("EnumerationName","e2e4e5","","none")
call <SID>X("EnumerationValue","e2e4e5","","none")
call <SID>X("Error","ffffd7","d75f5f","none")
call <SID>X("ErrorMsg","ffffd7","d75f5f","none")
call <SID>X("Exception","5fd75f","000000","none")
call <SID>X("Float","e2e4e5","","none")
call <SID>X("FoldColumn","afd7d7","5f8787","none")
call <SID>X("Folded","afd7d7","5f8787","none")
call <SID>X("Function","afd7af","000000","none")
call <SID>X("Identifier","afd7d7","","none")
call <SID>X("Ignore","5f87af","","none")
call <SID>X("IncSearch","afd7af","000000","none")
call <SID>X("Include","afafd7","000000","none")
call <SID>X("Keyword","5fd75f","000000","none")
call <SID>X("Label","afd7af","","none")
call <SID>X("LineNr","767676","202020","none")
call <SID>X("LocalVariable","e2e4e5","","none")
call <SID>X("Macro","afd7d7","000000","none")
call <SID>X("MatchParen","e2e4e5","","none")
call <SID>X("ModeMsg","5fd75f","005f00","none")
call <SID>X("MoreMsg","5faf87","000000","bold")
call <SID>X("NonText","87d7ff","000000","none")
call <SID>X("Normal","c0c0c0","000000","none")
call <SID>X("Number","00ffff","000000","none")
call <SID>X("Operator","87ff00","000000","none")
call <SID>X("PMenu","1c1c1c","9e9e9e","none")
call <SID>X("PMenuSbar","1c1c1c","121212","none")
call <SID>X("PMenuSel","000000","e4e4e4","none")
call <SID>X("PMenuThumb","1c1c1c","767676","none")
call <SID>X("PreCondit","5fafd7","000000","none")
call <SID>X("PreProc","87d7ff","","none")
call <SID>X("Question","5fffaf","000000","bold")
call <SID>X("Repeat","5fffaf","000000","none")
call <SID>X("Search","000000","5f8787","none")
call <SID>X("SignColumn","e2e4e5","","none")
call <SID>X("Special","9e9e9e","","none")
call <SID>X("SpecialChar","e2e4e5","","none")
call <SID>X("SpecialComment","e2e4e5","","none")
call <SID>X("SpecialKey","5f5f87","000000","none")
call <SID>X("SpellBad","e2e4e5","","none")
call <SID>X("SpellCap","e2e4e5","","none")
call <SID>X("SpellLocal","e2e4e5","","none")
call <SID>X("SpellRare","e2e4e5","","none")
call <SID>X("Statement","5fd75f","","none")
call <SID>X("StatusLine","000000","e4e4e4","none")
call <SID>X("StatusLineNC","1c1c1c","9e9e9e","none")
call <SID>X("StorageClass","87afd7","000000","none")
call <SID>X("String","87afff","000000","none")
call <SID>X("Structure","87afd7","000000","none")
call <SID>X("TabLine","e2e4e5","000000","none")
call <SID>X("TabLineFill","e2e4e5","","none")
call <SID>X("TabLineSel","e2e4e5","666666","none")
call <SID>X("Tag","e2e4e5","","none")
call <SID>X("Title","d75fff","000000","bold")
call <SID>X("Todo","00ffff","5f8787","none")
call <SID>X("Type","87afd7","","none")
call <SID>X("Typedef","87afd7","000000","none")
call <SID>X("Underlined","878787","000000","underline")
call <SID>X("Union","e2e4e5","","none")
call <SID>X("VertSplit","000000","9e9e9e","none")
call <SID>X("Visual","","666666","none")
call <SID>X("VisualNOS","afd7af","000000","bold,underline")
call <SID>X("WarningMsg","ff5f5f","000000","bold")
call <SID>X("WildMenu","000000","87ff00","bold")
call <SID>X("pythonBuiltin","99cf50","","none")
call <SID>X("JavaScriptStrings","87afff","","none")
call <SID>X("htmlTagName","e2e4e5","","none")
" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}


