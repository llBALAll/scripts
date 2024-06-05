"---------------------------------------------------------------------------------------------
" vimrc to give navegation, selection & shortcuts like another editor/IDE;
" It was made/tested in vim 8.2 on mintty/cygwin/git-bash, windows 7, qwerty 75% TKL keyboard;
" This script uses ctags to make tags file;
" I use this script with these plugins:
"   OmniCppComplete - (https://www.vim.org/scripts/script.php?script_id=1520)
"   AutoComplPop - (https://www.vim.org/scripts/script.php?script_id=1879)
"   multiple cursors - (https://github.com/mg979/vim-visual-multi)
"   vim-cpp-enhanced-highlight - (https://www.vim.org/scripts/script.php?script_id=4617)
"   tags for std c++ (STL, streams, ...) - https://www.vim.org/scripts/script.php?script_id=2358
"---------------------------------------------------------------------------------------------

" new buffer horizontal/vertical                    ( C + w + s/v )
" new tab                                           ( C + t ), ( C + w + t )
" switch tab next/previous                          ( C + Tab ), ( C + PageUp/PageDown )
" close buffer/tab/terminal/command line            ( C + q )
" force close window/tab                            ( C + S + Q )
" toggle terminal                                   ( C + ` )
" close terminal                                    ( C + q ), ( Esc )x2
" toggle netwr (file explorer)                      ( C + e )
" open windows explorer on buffer directory         ( C + S + E )
" toggle command line                               ( C + ; )
" open command line history                         ( C + S + : ) 
" save file                                         ( C + s )
" select all buffer                                 ( C + a )
" copy                                              ( C + c )
" paste                                             ( C + v )
" cut                                               ( C + x )
" duplicate current line(s)/selection               ( C + d )
" undo                                              ( C + z )
" redo                                              ( C + S + Z ) , ( C + y )
" suspend vim                                       ( C + S + s )
" find command line, find pattern (selection)       ( C + f )
" find word under keyboard cursor                   ( C + f + w ), ( * )/( # )
" find whole word at mouse click                    ( S + RMB )
" replace word/pattern                              ( C + h )
" toggle case sensitive                             ( F2 )
" match next/previous                               ( F3 )/( S + F3 ), ( n )/( N )
" toggle find whole                                 ( F4 )
" clear search/match highlights                     ( C + S + H ), ( RMB )
" toggle selection word/line                        ( C + l )
" highlight line(s)                                 ( C + S + L )
" redraw screen                                     ( C + S + R )
" set marks (1,2,3,4,5,6,7) & highlight             ( C + S + !,@,#,$,%,^,& )
" jump to marks (1,2,3,4,5,6,7)                     ( C + 1,2,3,4,5,6,7 )
" remove marks (1-7) & clear highlights             ( C + S + C )
" navegation between buffers                        ( A + Arrows )
" toggle maximize on actual buffers                 ( A + Home )
" maximize height & width of actual buffers         ( A + PageUp )
" height & width equal for all buffers              ( A + PageDown )
" switch to next buffers & maximize                 ( A + End )
" move cursor to Begin/End of current line          ( Home/End )
" scroll Up/Down 30 lines                           ( PageUp/PageDown )
" selection characters/lines                        ( S + Arrows )
" selection to start/end of line                    ( S + Home/End )
" select Up/Down 30 lines                           ( S + PageUp/PageDown )
" move cursor 5 lines up/down                       ( C + Up/Down ), ( C + j/k )
" move cursor one word backward/forward             ( C + Left/Right )
" move cursor to the beginning of buffer            ( C + Home )
" move cursor to the end of buffer                  ( C + End )
" select from cursor to begining of buffer          ( C + S + Home )
" select from cursor to the end of buffer           ( C + S + End )
" move line(s)/selection Up/Down                    ( C + S + Up/Down )
" select by words                                   ( C + S + Left/Right )
" visual block selection (arrows)                   ( C + S + V )( S + Arrows )
" visual block selection (mouse)                    ( A + LMB )
" delete word backwards                             ( C + BS )
" delete from cursor to begining of line            ( C + S + BS )
" delete content inside a <>                        ( C + S + < )
" delete content inside a {}                        ( C + S + { )
" delete content inside a []                        ( C + [ )
" delete content inside a ()                        ( C + S + ( )
" delete content inside a ""                        ( C + S + " )
" delete content inside a ''                        ( C + ' )
" indentation left/right                            ( C + ,/. )
" toggle comment line(s)                            ( C + / )
" comment block selection                           ( C + S + ? )
" Jump to tag definition / Jump back                ( C + ] )/( C + S + } ), ( F12 )/( S + F12 ), ( C + LMB )/( C + RMB )
" create tags file recursively with ctags           ( C + S + F12 )
" autocompletion popup                              (typing on insert mode), ( C + n )
" autocompletion by tags (omnicomplete)             ( C + o )x2, ( C + x )( C + o ), ( C + p )
" use selected match in autocompletion popup        ( Tab ), ( Enter )
" toggle special characters visible                 ( F5 )
" toggle indentation SPACE/TAB                      ( F6 )
" convert indentation to space & autoindent         ( F7 )
" switch colorcheme next/previous                   ( F8 )/( S + F8 )
" build current buffer file                         ( F9 )
" build all same ext files on buffer directory      ( F10 )

" how to use multiple cursors
"
"   add cursors at same words
"     (C-S-V)       change to visual block mode
"     (S-Arrows)    select the word
"     (C-n)         add a new cursor on next word & selection match
"     (S-I)         change to insert mode to edit at all cursors
"                   edit what you need with all cursors
"     (Esc)         remove multicursors & change to normal mode
"
"   add cursors at custom locations
"     insert a pattern (like @@) that dont have any match on buffer at all locations you need to edit
"     (C-S-V)       change to visual block mode
"     (S-Arrows)    select the pattern (like @@)
"     (C-S-N)       add cursors & selection all words that matches
"     (S-I)         change to insert mode to edit at all cursors
"                   edit what you need with all cursors
"     (Esc)         remove cursors & change to normal mode

"---------------------------------------------------------------------------------------------
" plugins configs

" don't give ins-completion-menu messages
set shortmess+=c

" omnicppcomplete configs;
set nocp
filetype plugin on

" VIM autocompletion configs ------------------------

" words by dictionary file;
"set dictionary+=~/dict.txt
"set complete=.,w,k
"set complete=.,w,b,u,t,i,ksplell"
set complete=".,w,b,u,t,i"

" set extra tags file;
"set tags+=~/.vim/tags/C_BuildTools
"set tags+=~/.vim/tags/mingw64
set tags+=~/.vim/tags/MSVS_VC
set tags+=~/.vim/tags/WindowsKits
set tags+=~/.vim/tags/DirectxSDK
set tags+=~/.vim/tags/SDL2
set tags+=~/.vim/tags/raylib
set tags+=~/.vim/tags/stb_image
set tags+=~/.vim/tags/tensorflow
set tags+=~/.vim/tags/olive
set tags+=~/.vim/tags/sv

" acp_plugin configs ------------------------

"acp autocomplete popup default value (buffers, dictionary). 
"I like this because acp popups using buffers quickly, and just when i want popup over tags a hit (C-p) to use omnicppcomplete
let g:acp_completeOption = '.,w,b,k'
"acp autocomplete popup over (buffers, dictionary, tags, includes)
"let g:acp_completeOption = ".,w,b,u,t,i"
"acp autocomplete popup over (buffers, dictionary, tags)
"let g:acp_completeOption = ".,w,b,k,t"

" If non-zero, auto-popup is triggered by key mappings instead of CursorMovedI event. 
let g:acp_mappingDriven = 1
"let g:acp_mappingDriven = 0

" Length of keyword characters before the cursor, which are needed to attempt keyword completion.
let g:acp_behaviorKeywordLength = 2
" List of string. If a word before the cursor matches to the front part of one of them, keyword completion won't be attempted.
let g:acp_behaviorKeywordIgnores = ["@"]

" lines commented on file $HOME/.vim/autoload/acp.vim to remove unwanted popup entering into insert mode
"" nnoremap <silent> i i<C-r>=<SID>feedPopup()<CR>
"" nnoremap <silent> a a<C-r>=<SID>feedPopup()<CR>
"" nnoremap <silent> R R<C-r>=<SID>feedPopup()<CR>

" multiple-cursors configs;
let g:multi_cursor_select_all_word_key = '<C-S-n>'

" OmniCppComplete plugin configs ------------------------

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
""set completeopt=menuone,menu,longest,preview
set completeopt=menuone,menu,longest
""let OmniCpp_SelectFirstItem = 2 "Automatically jump to the first one when it pops up automatically

augroup SyntaxComplete
  autocmd Filetype *
        \ if &omnifunc == '' |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
augroup end


"""""""""
" tests

""function! OpenCompletion()
""    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
""        call feedkeys("\<C-x>\<C-o>", "n")
""    endif
""endfunction
""
""autocmd InsertCharPre * call OpenCompletion()

""function! OpenCompletion2()
""  if !pumvisible() && (len(expand("<cWORD>")) > 0)
""    ""echo "tab IF"
""    ""call feedkeys("\<C-x>\<C-o>", "n")
""    return 1
""  else
""    ""echo "tab ELSE"
""    ""call feedkeys("\<Tab>", "n")
""    return 0
""  endif
""endfunction

""inoremap <expr> <Tab> OpenCompletion2() ? '<C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>' : '<C-o>:call feedkeys("\<Tab>", "n")<CR>'

" ( Enter ), ( Tab ) shortcut to use selected match in autocompletion popup
inoremap <silent> <expr> <Tab> pumvisible() ? "\<CR>" : "\<Tab>"

"---------------------------------------------------------------------------------------------
" general configs

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" set language, encoding
language en_US.utf8
" enable rectangular visual block selection where there is no actual characters
"set virtualedit=all
set virtualedit=block
" turn off beep and flash
"set visualbell 
"set t_vb=
"set vb t_vb=
set belloff=all
" enable command-line completion
set wildmenu
" set command line history limit
set history=100
" enable highlighting
syntax enable
" print the line number in front of each line
set number
" print the line numberr relative to the cursor line in front of each line
"set relativenumber
" disable wrap lines longer than the buffer width
set nowrap
" enable the use of the mouse for all modes.
set mouse=a

"set paste

" a new line receive same indentation from last
"set autoindent
" in Insert, Replace or Visual mode put a message on the last line
"set showmode
set noshowmode
" highlight search
set hlsearch
" show search count when searching
set shortmess-=S

"---------------------------------------------------------------------------------------------
" statusline config

function! ReadOnly()
  return (&readonly || !&modifiable) ? '<read only>' : ''
endfunction
function! Modified()
  return (&modified) ? '<modified>' : '<new>'
endfunction
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'VReplace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal',
\}

"set laststatus=2
"hi statusline guibg=Blue ctermfg=6 guifg=Black ctermbg=0

set statusline=
"set statusline+=%{ChangeAccentColor()}
"set statusline+=%1*\ /%{toupper(g:currentmode[mode()])}/\  " Current mode
set statusline+=%1*\ <%{toupper(g:currentmode[mode()])}>\  " Current mode
set statusline+=%2*\%<%f\  " Filepath
set statusline+=%2*\%{Modified()} " Modified Flags
set statusline+=%2*\ %= " To the right
set statusline+=%2*\%{ReadOnly()} " ReadOnly Flags
"set statusline+=%2*\ %{Modified()} " Modified Flags
set statusline+=%1*\ %l,%c\ %LL\ " Position
"set statusline+=%2*\ %{&filetype} " Filetype
set statusline+=%2*\%{&filetype} " Filetype
"set statusline+=%2*\ %{toupper((&fenc!=''?&fenc:&enc))}\ %{&ff} " Encoding & Fileformat
set statusline+=%2*\ %{toupper((&fenc!=''?&fenc:&enc))}\ %{&ff}\ " Encoding & Fileformat
"set statusline+=%2*\ %{Modified()} " Modified Flags
"set statusline+=%1*\%l;%c\ \%L\  " Position
"set statusline+=%1*\ \%l;%c\ \%L\ \%P\  " Position

"---------------------------------------------------------------------------------------------
" colorscheme config

"nice dark themes
colorscheme simple_dark_mod1
"colorscheme molokai
"colorscheme Benokai_mod
"colorscheme simple_dark_mod
"colorscheme simple_dark
"colorscheme itg_flat_mod
"colorscheme wellsokai
"colorscheme gruvbox
"colorscheme Monokai_mod
"colorscheme oceanic_material
"colorscheme kalisi
"colorscheme iceberg
"colorscheme scheakur
"colorscheme 256-grayvim
"colorscheme jellybeans
"colorscheme challenger_deep
"colorscheme snow
"colorscheme monokai
"colorscheme happy_hacking
"colorscheme apprentice
"colorscheme angr
"colorscheme tender
"colorscheme flattr

"nice light themes
"colorscheme scheakur
"colorscheme simple-white

"set background=dark
"set background=light

"---------------------------------------------------------------------------------------------
" cursor config

" Set cursor color for diferent modes;
"use an green cursor in insert mode
let &t_SI = "\<Esc>]12;green\x7"
" use a white cursor otherwise
let &t_EI = "\<Esc>]12;white\x7"

"set cursorcolumn 
"hi CursorColumn ctermbg=8
set cursorline
"hi CursorLine ctermbg=234

"---------------------------------------------------------------------------------------------
" Reload buffer file - Check if the files inside buffers was changed outside VIM;

" Manual reload - When enter in a buffer make a check if it was changed outside of Vim,
" and manually answer to reload/not reload file from disk;
"autocmd BufEnter * checktime
" this if is need to dont warning when open the command line history"
autocmd BufEnter * if mode() == 'n' && getcmdwintype() == '' | checktime | endif

" Automatic reload - When enter in a buffer make a check if it was changed outside of Vim,
" automatically reload it;
"set autoread

"---------------------------------------------------------------------------------------------
" fix Alt keycodes to use in shortcuts;

for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor

"---------------------------------------------------------------------------------------------
" ( F5 ) shortcut to toggle special characters visible;

"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" uncomment if using font: Unispace
set listchars=eol:¶,tab:\|\ ,trail:~,extends:>,precedes:<,space:␣

" uncomment if using font: vinnymodterminal
"set listchars=eol:ô,tab:\|\ ,trail:~,extends:>,precedes:<,space:␣

noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

"---------------------------------------------------------------------------------------------
" ( C + o )x2 shortcut to autocompletion by tags (omnicomplete)
" default: ( C + x )( C + o )

nnoremap <C-o>o i<C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>
inoremap <C-o>o <C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>
vnoremap <C-o>o <C-\><C-n>i<C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>

nnoremap <C-o><C-o> i<C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>
inoremap <C-o><C-o> <C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>
vnoremap <C-o><C-o> <C-\><C-n>i<C-o>:call feedkeys("\<C-x>\<C-o>", "n")<CR>

"---------------------------------------------------------------------------------------------
" ( F6 ) shortcut to toggle indentation config (tabs/spaces);

let g:flagIndentation = 0

function! UseTab()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpace()
  "set tabstop=2     " Size of a hard tabstop (ts).
  "set shiftwidth=2  " Size of an indentation (sw).
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

call UseSpace()

function ToggleCfgIndent()
  if g:flagIndentation
      call UseTab()
      echo "Indentation config: TAB"
      let g:flagIndentation = 0
  else
      call UseSpace()
      echo "Indentation config: SPACE"
      let g:flagIndentation = 1
  endif
endfunction

map <F6> :call ToggleCfgIndent()<CR>
map! <F6> <Esc>:call ToggleCfgIndent()<CR>

"---------------------------------------------------------------------------------------------
" shortcuts to indentation;
" default: ( S + </> );

" shortcuts to indentation multiple lines selected
vnoremap > >gv
vnoremap < <gv

" ( C + ,/. ) shortcuts to indentation;
nnoremap <C-.> >>
vnoremap <C-.> >gv
inoremap <C-.> <C-o>>>
nnoremap <C-,> <<
vnoremap <C-,> <gv
inoremap <C-,> <C-o><<

vnoremap <Tab> >gv

" ( F7 ) shortcut to auto-indentation & convert to space;
" gg moves cursor to beginning of file. 
" =G formats the code from the cursor to the end of the file. 
" `` brings the cursor back.
nnoremap <F7> gg=G``
vnoremap <F7> <Esc>gg=G``
inoremap <F7> <Esc>gg=G``

"---------------------------------------------------------------------------------------------
" ( C + / ) shortcut to toggle comment line(s) of code;

autocmd FileType asm                                                  let b:comment_leader = ';'
autocmd FileType c,cpp,cs,go,java,javascript,scala,php,rust,pascal    let b:comment_leader = '//'
autocmd FileType conf,fstab,sh,perl,python,ruby                       let b:comment_leader = '#'
autocmd FileType dosbatch                                             let b:comment_leader = 'rem'
autocmd FileType haskel,lua,sql                                       let b:comment_leader = '--'
autocmd FileType mail                                                 let b:comment_leader = '>'
autocmd FileType matlab,tex                                           let b:comment_leader = '%'
autocmd FileType vim                                                  let b:comment_leader = '"'

function! ToggleComment()
  if exists("b:comment_leader")
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
  endif
endfunction

nnoremap <C-/> :call ToggleComment()<CR>i
vnoremap <C-/> :call ToggleComment()<CR>gv
inoremap <C-/> <C-o>:call ToggleComment()<CR>

"---------------------------------------------------------------------------------------------
" ( C + S + ? ) shortcut to comment block selection

autocmd FileType asm,c,cpp,cs,css,go,java,javascript,php,rust,sql,scala   let b:commentbs = '/*'      | let b:commentbe = '*/'
autocmd FileType haskel                                                   let b:commentbs = '{-'      | let b:commentbe = '-}'
autocmd FileType html,xml                                                 let b:commentbs = '<!--'    | let b:commentbe = '-->'
autocmd FileType lua                                                      let b:commentbs = '--[['    | let b:commentbe = ']]'
autocmd FileType pascal                                                   let b:commentbs = '{'       | let b:commentbe = '}'
autocmd FileType perl                                                     let b:commentbs = '=begin'  | let b:commentbe = '=cut'
autocmd FileType python                                                   let b:commentbs = '"""'     | let b:commentbe = '"""'
autocmd FileType ruby                                                     let b:commentbs = '=begin'  | let b:commentbe = '=end'

" some languages just agree use of block comment operators before and after lines of self comment block
" to do: a function know about that languages above and execute the function below to comment block
"function! BlockComment_outlines()
"  if exists("b:commentbs")
"    call append(line("'<")-1, b:commentbs)
"    call append(line("'>"), b:commentbe)
"  endif
"endfunction

function! BlockComment()
  " if exists the block comment operator on language buffer FileType
  if exists("b:commentbs")
    " add char at end of line of last selection, to bypass normal mode line selection limitation (before the \n)
    '>normal A.
    " set cursor position to start of the last selection
    call cursor (line("'<"), col("'<"))
    " write comment block start operator
    exec "normal i" . b:commentbs
    " if the block selection is in just on line
    if line("'<") == line("'>")
      call cursor (line("'>"), col("'>")+strlen(b:commentbs))
      " write comment block end operator
      exec "normal i" . b:commentbe
      " remove char added at end of line of last selection to bypass move cursor position from insert mode to normal mode
      '>normal $x
      " set cursor position to the new correct position after comments
      call cursor (line("'>"), col("'>")+strlen(b:commentbs)+strlen(b:commentbe))
    else
      call cursor (line("'>"), col("'>"))
      " write comment block end operator
      exec "normal i" . b:commentbe
      " remove char added at end of line of last selection, to bypass normal mode line selection limitation (before the \n)
      '>normal $x
      " set cursor position to the new correct position after comments
      call cursor (line("'>"), col("'>")+strlen(b:commentbe))
    endif
  endif
endfunction

nnoremap <C-S-?> :call BlockComment()<CR>
vnoremap <C-S-?> <Esc>:call BlockComment()<CR>
inoremap <C-S-?> <C-o>:call BlockComment()<CR>

"---------------------------------------------------------------------------------------------
" shortcuts misc;

" ( C + e ) toggle Netwr (file explorer);
let g:netrw_winsize = 24
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2

function! OpenNetwr()
  Lexplore
  call ArrowsMode()
  " clean last command from command line
  echon ''
  " set status line visible when Lexplore go out
  set laststatus=2
endfunction

" timer to clear after some secs the warnings like "modifiable" of Lexplorer
autocmd CursorHold * echo

nnoremap <C-e> :call OpenNetwr()<CR>
inoremap <C-e> <Esc>:call OpenNetwr()<CR>
""inoremap <C-e> <C-o>:call OpenNetwr()<CR>

" Open Netrw after Vim starts up
autocmd VimEnter * :call OpenNetwr()

" ( C + S + E ) open windows explorer on current buffer directory;
function! OpenWinexplorer()
  " create the path buffer argument for the command (if in cygwin mintty remove pattern /cygdrive & replace /drive to drive: & replace / to \\) & run
  execute '!v_bp=`echo "%:p:h" | sed "s/\/cygdrive//" | sed "s/\///" |  sed "s/\//:\//" | sed "s/\//\\\\\\\/g"` && ' . 'explorer' . ' $v_bp'
endfunction

nnoremap <C-S-E> :call OpenWinexplorer()<CR>
inoremap <C-S-E> <C-o>:call OpenWinexplorer()<CR>

" ( C + q ) close window/tab/terminal;
nnoremap <C-q> :q<CR>
inoremap <C-q> <C-o>:q<CR>
vnoremap <C-q> <Esc>:q<CR>
cnoremap <C-q> <Esc>:q<CR>
tnoremap <C-q> <C-d>

" ( C + S + Q ) force close window/tab;
nnoremap <C-S-Q> :q!<CR>
vnoremap <C-S-Q> <Esc>:q!<CR>
inoremap <C-S-Q> <Esc>:q!<CR>
cnoremap <C-S-Q> <C-c>:q!<CR>
tnoremap <C-S-Q> <C-\><C-n>:q!<CR>i

" ( C + s ) save file;
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" ( C + a ) select all buffer;
nnoremap <C-a> ggVG
vnoremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVG

" ( C + c ) copy selection;
vmap <C-c> "+yi
"vnoremap <C-c> "+y<CR>
"vmap <C-c> y<Esc>i

" ( C + v ) paste;
nnoremap <C-v> i<C-r><C-o>+
vnoremap <C-v> c<Esc>"+p
inoremap <C-v> <C-r><C-o>+
"vmap <C-v> c<Esc>"+p
"imap <C-v> <C-r><C-o>+

" ( C + x ) cut selection;
vmap <C-x> "+c
"vmap <C-x> d<Esc>i

" ( C + d ) duplicate current line(s);
nnoremap <C-d> yyp
vnoremap <C-d> yp<CR>gv
"vnoremap <C-d> :'<,'>copy.<CR>gv
inoremap <C-d> <C-o>:copy.<CR>

" ( C + z ) undo;
nnoremap <C-z> u
vnoremap <C-z> <Esc>:u<CR>
"inoremap <C-z> <Esc>u
inoremap <C-z> <C-o>u

" ( C + y ), ( C + S + Z ) redo;
nnoremap <C-y> <C-r>
vnoremap <C-y> <Esc><C-r>
inoremap <C-y> <C-o><C-r>

nnoremap <C-S-z> <C-r>
vnoremap <C-S-z> <Esc><C-r>
inoremap <C-S-z> <C-o><C-r>

" ( C + S + S ) suspend VIM;
nnoremap <C-S-S> :suspend<CR>
vnoremap <C-S-S> <Esc>:suspend<CR>
inoremap <C-S-S> <C-o>:suspend<CR>
cnoremap <C-S-S> <Esc>:suspend<CR>

" ( C + End ) move cursor to the end of buffer;
nnoremap <C-End> G

" ( C + Up/Down ), ( C + j/k ) fast scroll with keyboard;
nnoremap <C-k> 5k
inoremap <C-k> <C-o>5k
nnoremap <C-j> 5j
inoremap <C-j> <C-o>5j
nnoremap <C-Up> 5k
inoremap <C-Up> <C-o>5k
nnoremap <C-Down> 5j
inoremap <C-Down> <C-o>5j

" ( C + S + v ) shortcut to start visual block mode (selection);
"inoremap <C-S-v> <Esc><C-S-v>
""inoremap <C-S-v> <Right><Esc><C-S-v>

" if you dont use ACP plugin uncomment(inoremap <C-S-v> <Right><Esc><C-S-v>) and comment 2 below inoremap lines
" disable ACP plugin to prevent bug when using the multiple cursors plugin
inoremap <C-S-v> <Right><Esc>:AcpDisable<CR><C-S-v>
" reenable ACP plugin after default <C-p> shortcut to completation
"inoremap <C-p> <Esc>:AcpEnable<CR>i<Right><C-p>
inoremap <C-p> <Esc>:AcpEnable<CR>i<Right><C-x><C-o>

"---------------------------------------------------------------------------------------------
" ( F2 ) shortcut to toggle case sensitive

set noignorecase
let g:flagCS = 1

function! ToggleFCS()
  if g:flagCS == 1
    set ignorecase
    echo 'Case sensitive <OFF>'
    let g:flagCS = 0
  else
    set noignorecase
    echo 'Case sensitive <ON>'
    let g:flagCS = 1
  endif  
endfunction

nnoremap <F2> :call ToggleFCS()<CR>
vnoremap <F2> <Esc>:call ToggleFCS()<CR>
inoremap <F2> <Esc>:call ToggleFCS()<CR>

"---------------------------------------------------------------------------------------------
" shortcuts to find & replace
" ( C + f ) command line to find, find pattern (selection)
" ( C + f + w ), ( * )/( # ) find word under keyboard cursor
" ( S + RMB ) find whole word at mouse click
" ( C + h ) command line to replace word under keyboard cursor, command line to replace pattern (selection)

let g:flagWhole = 0

" function to map find/replace shortcuts deppending on flagWhole
function! MapFind(findWhole)
  if a:findWhole
    " maps to find & replace with whole option
    
    " get command line to find pattern
    nnoremap <C-f> :/\<pattern\>
    inoremap <C-f> <Esc>:/\<pattern\>
    " nnoremap <C-f> *
    " inoremap <C-f> <C-o>*
    " find pattern (selection)
    "vnoremap <C-f> y/\<<C-r>0\><CR><C-c><Esc>^[
    vnoremap <C-f> y/\<<C-r>"\><CR><C-c><Esc>^[
    " find word under keyboard cursor
    nnoremap <C-f>w *
    inoremap <C-f>w <C-o>*
    nnoremap <C-f><C-w> *
    inoremap <C-f><C-w> <C-o>*
    nnoremap <C-f-w> *
    inoremap <C-f-w> <C-o>*

    " get command line to replace word under keyboard cursor
    nnoremap <C-h> :%s/\<<C-r>=expand("<cword>")<CR>\>/replace/gc
    " nnoremap <C-h> yiw:%s/\<<C-r>"\>/replace/gc
    inoremap <C-h> <C-o>:%s/\<<C-r>=expand("<cword>")<CR>\>/replace/gc
    " get command line to replace pattern (selection)
    vnoremap <C-h> y:%s/\<<C-r>"\>/replace/gc
  else
    " maps to find & replace without whole option
    
    " get command line to find
    nnoremap <C-f> :/
    inoremap <C-f> <Esc>:/
    " nnoremap <C-f> /<C-r>=expand("<cword>")<CR><CR>
    " inoremap <C-f> <Esc>/<C-r>=expand("<cword>")<CR><CR>
    " find pattern (selection)
    vnoremap <C-f> y/\V<C-r>=escape(@",'/\')<CR><CR><C-c><Esc>^[
    " find word under keyboard cursor
    nnoremap <C-f>w :/<C-r>=expand("<cword>")<CR><CR>
    inoremap <C-f>w <Esc>:/<C-r>=expand("<cword>")<CR><CR>
    nnoremap <C-f><C-w> :/<C-r>=expand("<cword>")<CR><CR>
    inoremap <C-f><C-w> <Esc>:/<C-r>=expand("<cword>")<CR><CR>
    nnoremap <C-f-w> :/<C-r>=expand("<cword>")<CR><CR>
    inoremap <C-f-w> <Esc>:/<C-r>=expand("<cword>")<CR><CR>

    " get command line to replace word under keyboard cursor
    " nnoremap <C-h> yiw:%s/\V<C-r>=escape(@",'/\')<CR>/replace/gc
    nnoremap <C-h> :%s/\V<C-r>=expand("<cword>")<CR>/replace/gc
    inoremap <C-h> <C-o>:%s/\V<C-r>=expand("<cword>")<CR>/replace/gc
    " get command line to replace pattern (selection)
    vnoremap <C-h> y:%s/\V<C-r>=escape(@",'/\')<CR>/replace/gc
  endif
endfunction

call MapFind(g:flagWhole)


" ( LMB x2 ) shortcut to find whole word under cursor by double left mouse click
" default: ( S + RMB )
"nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"---------------------------------------------------------------------------------------------
" ( F3 )/( S + F3 ) shortcuts to find next/previous

" ( F3 ) next match
nnoremap <F3> :exec "normal! n"<CR>
vnoremap <F3> <Esc>:exec "normal! n"<CR>
inoremap <F3> <C-o>:exec "normal! n"<CR>

" ( S + F3 ) previous match
set <S-F3>=^[[1;2R
"set <S-F3>={C-v}{Esc}[1;2R
map <Esc>[1;2R <S-F3>
map! <Esc>[1;2R <S-F3>

nnoremap <S-F3> :exec "normal! N"<CR>
vnoremap <S-F3> <Esc>:exec "normal! N"<CR>
inoremap <S-F3> <C-o>:exec "normal! N"<CR>

"---------------------------------------------------------------------------------------------
" ( F4 ) shortcut to toggle find whole

function! ToggleFWW()
  if g:flagWhole == 1
    let g:flagWhole = 0
    call MapFind(g:flagWhole)
    echo 'Find whole <OFF>'
  else
    let g:flagWhole = 1
    call MapFind(g:flagWhole)
    echo 'Find whole <ON>'
  endif
endfunction

nnoremap <F4> :noh<CR>:call ToggleFWW()<CR>
vnoremap <F4> <Esc>:noh<CR>:call ToggleFWW()<CR>
inoremap <F4> <Esc>:noh<CR>:call ToggleFWW()<CR>

"---------------------------------------------------------------------------------------------
" ( C + S + H ), ( RMB ) shortcuts to clear search/match highlights

nnoremap <C-S-H> :noh<CR>:call clearmatches()<CR>
vnoremap <C-S-H> <Esc>:noh<CR>:call clearmatches()<CR>
inoremap <C-S-H> <Esc>:noh<CR>:call clearmatches()<CR>i

nnoremap <silent> <RightMouse> :noh<CR>:call clearmatches()<CR>

"---------------------------------------------------------------------------------------------
" ( C + l ) shortcut to toggle selection word/line

let g:flagToggleWL = 0

function! ToggleWL()
  let g:flagToggleWL = g:flagToggleWL ? 0 : 1
  return !g:flagToggleWL
endfunction

"nnoremap <expr> <C-l> ToggleWL() ? 'V' : 'viw<C-g>'
"vnoremap <expr> <C-l> ToggleWL() ? '<Esc>V' : '<Esc>viw<C-g>'
"inoremap <expr> <C-l> ToggleWL() ? '<C-o>V' : '<C-o>viw<C-g>'

"nnoremap <expr> <C-l> ToggleWL() ? 'V' : 'bve<C-g>'
"vnoremap <expr> <C-l> ToggleWL() ? '<Esc>V' : '<Esc>bve<C-g>'
"inoremap <expr> <C-l> ToggleWL() ? '<Esc>V' : '<Esc>bve<C-g>'

nnoremap <expr> <C-l> ToggleWL() ? 'V' : 'wbve<C-g>'
vnoremap <expr> <C-l> ToggleWL() ? '<Esc>V' : '<Esc>wbve<C-g>'
inoremap <expr> <C-l> ToggleWL() ? '<C-o>V' : '<Esc>wbve<C-g>'

"" select word
"nnoremap <C-8> viw<C-g>
"vnoremap <C-8> <Esc>viw<C-g>
"inoremap <C-8> <Esc>viw<C-g>
"
"" select line
"nnoremap <C-l> 0v$
"vnoremap <C-l> <Esc>0v$
"inoremap <C-l> <Esc>0v$

"---------------------------------------------------------------------------------------------
" ( C + S + L ) shortcut to highlight line(s)

"highlight LineHighlight ctermbg=236
"highlight LineHighlight ctermbg=208
"highlight LineHighlight ctermbg=30
"highlight LineHighlight ctermbg=31
"highlight LineHighlight ctermbg=102
"highlight LineHighlight ctermbg=66
"highlight LineHighlight ctermbg=67
"highlight LineHighlight ctermbg=26

function! HighlightCFG()
  highlight LineHighlight ctermbg=26
endfunction

call HighlightCFG()

function! HighlightSelection()
  for i in range(line('v'),line("'>"))
    call matchadd('LineHighlight', '\%'.i.'l')
  endfor
endfunction

" shortcut to highlight cursor line
nnoremap <silent> <C-S-L> :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
inoremap <silent> <C-S-L> <C-o>:call matchadd('LineHighlight', '\%'.line('.').'l')<CR>

" shortcut to highlight selection
vnoremap <silent> <C-S-L> :<C-u>call HighlightSelection()<CR>

"---------------------------------------------------------------------------------------------
" ( C + S + R ) shortcut to redraw screen

nnoremap <C-S-R> :redraw!<CR>
vnoremap <C-S-R> <Esc>:redraw!<CR>
inoremap <C-S-R> <Esc>:redraw!<CR>i

"---------------------------------------------------------------------------------------------
" shortcuts to open/close/toggle terminal;

" size used when opening the terminal window
set termwinsize=30x0

" ( C + ` ) toggle terminal openning below all splits;
" open terminal
nnoremap <C-`> :bo term<CR>
vnoremap <C-`> <Esc>:bo term<CR>
inoremap <C-`> <C-o>:bo term<CR>
" close terminal
tnoremap <C-`> <C-d>
" close terminal & change to insert mode
"tnoremap <C-`> <C-\><C-n>:q!<CR>i

" ( Esc x2 ) close terminal
" close terminal;
tnoremap <Esc><Esc> <C-d>
" close terminal & change to insert mode
"tnoremap <Esc><Esc> <C-\><C-n>:q!<CR>i

"---------------------------------------------------------------------------------------------
" ( C + ; ) shortcut to toggle command line

nnoremap <C-;> :
"vnoremap <C-;> <Esc>:
vnoremap <C-;> :
inoremap <C-;> <C-o>:
cnoremap <C-;> <Esc><Esc>i

"---------------------------------------------------------------------------------------------
" ( C + S + : ) shortcut to open command line history into insert mode

nnoremap <C-S-:> q:i
vnoremap <C-S-:> <Esc>q:i
inoremap <C-S-:> <Esc>q:i
"cnoremap <C-S-:> <Esc><Esc>:q<CR>
cnoremap <C-S-:> <Esc><Esc>i

"---------------------------------------------------------------------------------------------
" shortcuts to mapping keys to enter insert mode;

" keybind Arrows keys to default navigation;
function ArrowsDefault()
  nnoremap <Up> <Up>
  nnoremap <Down> <Down>
  nnoremap <Left> <Left>
  nnoremap <Right> <Right>
endfunction

" keybind Arrows keys to enter insert mode;
function ArrowstoIM()
  nnoremap <Up> i<Up>
  nnoremap <Down> i<Down>
  nnoremap <Left> i<Left>
  nnoremap <Right> i<Right>
endfunction

call ArrowsDefault()

" keybind enter key to enter insert mode;
nnoremap <Enter> i<Enter>
vnoremap <Enter> <Del><Esc>i
"vnoremap <Enter> <Esc>i<Enter>

" keybind delete key to enter insert mode;
nnoremap <Del> i<Del>
vnoremap <Del> di

" keybind tab key to enter insert mode;
nnoremap <Tab> i<Tab>

" keybind backspace key to enter insert mode;
" nnoremap <BS> <BS>
nnoremap <BS> i<BS>
vnoremap <BS> di

" ( C + BS ) delete word backwards 
noremap <C-BS> dbi
inoremap <C-BS> <C-o>db
vnoremap <C-BS> <Esc>dbi

" ( C + S + BS ) delete from cursor to begining of line
noremap <C-S-BS> d0i
inoremap <C-S-BS> <C-o>d0i
vnoremap <C-S-BS> <Esc>d0i

" ( C + Del ) delete word forwards
"inoremap <C-Del> <C-o>dw

"set <Del>=^[[3~
"map <Esc>[3;5~ <C-Del>
"map! <Esc>[3;5~ <C-Del>

" ( C + S + Del ) delete from cursor to end of line
"inoremap <C-S-Del> <C-o>C

"set <C-S-Del>=^[[3;6~
"map <Esc>[3;6~ <C-S-Del>
"map! <Esc>[3;6~ <C-S-Del>

" keybind space key to enter insert mode;
nnoremap <Space> i<Space>
vnoremap <Space> di<Space>

"---------------------------------------------------------------------------------------------
" Update keybind of Arrow keys when get in/out of unmodifiable buffers;

function ArrowsMode()
  if &modifiable
    call ArrowstoIM()
  else
    call ArrowsDefault()
  endif   
endfunction

autocmd BufEnter * :call ArrowsMode()
"autocmd WinEnter * :call ArrowsMode()

"---------------------------------------------------------------------------------------------
" ( PageUp/PageDown ) shortcuts to scroll Up/Down 30 lines;

nnoremap <PageUp> 30k
vnoremap <PageUp> <C-\><C-n>30k
snoremap <PageUp> <C-\><C-n>30k
inoremap <PageUp> <C-o>30k

nnoremap <PageDown> 30j
vnoremap <PageDown> <C-\><C-n>30j
snoremap <PageDown> <C-\><C-n>30j
inoremap <PageDown> <C-o>30j

"---------------------------------------------------------------------------------------------
" ( S + PageUp/PageDown ) shortcuts to select Up/Down 30 lines;

nnoremap <S-PageUp> v30k
vnoremap <S-PageUp> 30k
inoremap <S-PageUp> <C-o>v30k

nnoremap <S-PageDown> v30j
vnoremap <S-PageDown> 30j
inoremap <S-PageDown> <C-o>v30j

"---------------------------------------------------------------------------------------------
" ( C + S + Up/Down ) change line(s) position Up/Down;
" The == re-indents the line to suit its new position; For the visual-mode mappings, 
" gv reselects the last visual block and = re-indents that block;

nnoremap <C-S-Up> :m .-2<CR>==
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
nnoremap <C-S-Down> :m .+1<CR>==
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi

"---------------------------------------------------------------------------------------------
" shortcuts to delete/change content inside a block <> {} [] () "" '';
" default: ( d+i+ </> ), ( d+i+ {/} ), ( d+i+ [/] ), ( d+i+ (/) ), ( d+i+" );
" default: ( c+i+ </> ), ( c+i+ {/} ), ( c+i+ [/] ), ( c+i+ (/) ), ( c+i+" );

" ( C + S + < )
nnoremap <C-S-<> di<
vnoremap <C-S-<> <Esc>ci<
inoremap <C-S-<> <C-o>ci<
" ( C + S + { )
nnoremap <C-S-{> di{
vnoremap <C-S-{> <Esc>ci{
inoremap <C-S-{> <C-o>ci{

" ( C + [ )
nnoremap <C-[> di]
vnoremap <C-[> <Esc>ci]
inoremap <C-[> <C-o>ci]
" its need to dont bug <Esc> (because <Esc>=^[, <C-[>=^[)
inoremap <Esc> <Esc>

" ( C + S + ( )
nnoremap <C-S-(> di(
vnoremap <C-S-(> <Esc>ci(
inoremap <C-S-(> <C-o>ci(

" ( C + S + " )
nnoremap <C-S-"> di"
vnoremap <C-S-"> <Esc>ci"
inoremap <C-S-"> <C-o>ci"

" ( C + ' )
nnoremap <C-'> di'
inoremap <C-'> <C-o>ci'
vnoremap <C-'> <Esc>ci'

"---------------------------------------------------------------------------------------------
" shortcuts to navegate between buffers & enter insert mode;
" default: ( C + w + Up/Down/Left/Right/w );

" ( A + Arrows ) fast navegation between buffers (two keys);
nnoremap <A-Up> <C-w>ki
vnoremap <A-Up> <Esc><C-w>ki
inoremap <A-Up> <Esc><C-w>ki
tnoremap <A-Up> <Esc><C-w>ki
nnoremap <A-Down> <C-w>ji
vnoremap <A-Down> <Esc><C-w>ji
inoremap <A-Down> <Esc><C-w>ji
tnoremap <A-Down> <Esc><C-w>ji
nnoremap <A-Left> <C-w>hi
vnoremap <A-Left> <Esc><C-w>hi
inoremap <A-Left> <Esc><C-w>hi
tnoremap <A-Left> <Esc><C-w>hi
nnoremap <A-Right> <C-w>li
vnoremap <A-Right> <Esc><C-w>li
inoremap <A-Right> <Esc><C-w>li
tnoremap <A-Right> <Esc><C-w>li

" ( C + b + Arrows ) same shortcuts of TMUX to navegate between buffers;
"nnoremap <C-b><Up> <C-w>k
"nnoremap <C-b><Down> <C-w>j
"nnoremap <C-b><Left> <C-w>h
"nnoremap <C-b><Right> <C-w>l

"---------------------------------------------------------------------------------------------
" shortcuts to change size of buffers;

" ( A + PageUp ) maximize height & width of actual buffers;
nnoremap <A-PageUp> <C-w><Bar><C-w>_i
vnoremap <A-PageUp> <Esc><C-w><Bar><C-w>_i
inoremap <A-PageUp> <Esc><C-w><Bar><C-w>_i

" ( A + PageDown ) make all windows equal height & width;
nnoremap <A-PageDown> <C-w>=i
vnoremap <A-PageDown> <Esc><C-w>=i
inoremap <A-PageDown> <Esc><C-w>=i

" ( A + Home ) toggle maximize on actual buffers;
function! ToggleMaximize(vmax)
  if exists("t:restore_size") && (a:vmax == v:true || t:restore_size.win != winnr())
      exec t:restore_size.cmd
      unlet t:restore_size
  elseif a:vmax
      let t:restore_size = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-w>\|\<C-w>_"
  endif
endfunction

augroup restore_size
    au WinEnter * silent! :call ToggleMaximize(v:false)
augroup END

nnoremap <silent> <A-Home> :call ToggleMaximize(v:true)<CR>i
inoremap <silent> <A-Home> <Esc>:call ToggleMaximize(v:true)<CR>i

" ( A + End ) switch to next window & maximize (loop);
nnoremap <A-End> <C-w>w<C-w><Bar><C-w>_i
vnoremap <A-End> <Esc><C-w>w<C-w><Bar><C-w>_i
inoremap <A-End> <Esc><C-w>w<C-w><Bar><C-w>_i

"---------------------------------------------------------------------------------------------
" shortcuts to split window & enter insert mode;
" default: ( C + w + v/s )

" ( C + w + v ) create a new buffer on a vertical split;
nnoremap <C-w>v :vnew<CR>i
vnoremap <C-w>v <Esc>:vnew<CR>i
inoremap <C-w>v <Esc>:vnew<CR>i
nnoremap <C-w><C-v> :vnew<CR>i
vnoremap <C-w><C-v> <Esc>:vnew<CR>i
inoremap <C-w><C-v> <Esc>:vnew<CR>i

" ( C + w + s ) create a new buffer on a horizontal split;
nnoremap <C-w>s :new<CR>i
vnoremap <C-w>s <Esc>:new<CR>i
inoremap <C-w>s <Esc>:new<CR>i
nnoremap <C-w><C-s> :new<CR>i
vnoremap <C-w><C-s> <Esc>:new<CR>i
inoremap <C-w><C-s> <Esc>:new<CR>i

" ( C + b + %/" ) same shortcuts of TMUX to split window;
"nnoremap <C-B>% <C-w>v
"nnoremap <C-B>" <C-w>s

"---------------------------------------------------------------------------------------------
" shortcuts to tabs;
" default: ( C + PageUp/PageDown ) switch tabs next/prev

" ( C + t ) create a new tab;
nnoremap <C-t> :tabnew<CR>
vnoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-t> <C-o>:tabnew<CR>

" ( C + w + t ) create a new tab;
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-w><C-t> :tabnew<CR>

" ( C + Tab ) switch to next tab (cyclic);
nnoremap <C-Tab> :tabN<CR>
vnoremap <C-Tab> <Esc>:tabN<CR>
inoremap <C-Tab> <C-o>:tabN<CR>

"---------------------------------------------------------------------------------------------
" shortcuts to tags;
" ( C + ] )/( C + S + } ), ( F12 )/( S + F12 )
" default: ( C + LMB )/( C + RMB )

" ( C + ] ) Jump to the tag definition
"inoremap <C-]> <C-o><C-]>
inoremap <C-]> <C-o>:w<CR><C-o><C-]>

" ( C + S + } ) Jump back on tag stack
nnoremap <C-S-}> <C-RightMouse>
vnoremap <C-S-}> <Esc><C-RightMouse>
inoremap <C-S-}> <C-RightMouse>

" ( F12 ) Jump to the tag definition
nnoremap <F12> <C-]>
vnoremap <F12> <Esc><C-]>
inoremap <F12> <C-o><C-]>

" ( S + F12 ) Jump back on tag stack
nnoremap <S-F12> <C-RightMouse>
vnoremap <S-F12> <Esc><C-RightMouse>
inoremap <S-F12> <C-RightMouse>

" ( C + S + F12 ) create a tags file using ctags recursively on active buffer directory to use with omnicppcomplete plugin
nnoremap <C-S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h""/tags" "%:p:h""/"<CR><CR>
vnoremap <C-S-F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h""/tags" "%:p:h""/"<CR>
inoremap <C-S-F12> <C-o>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h""/tags" "%:p:h""/"<CR><CR>

"---------------------------------------------------------------------------------------------
" ( C + S + !,@,#,$,%,^,& ) shortcuts to set marks (1-7) and match (highlight entire line)

" function to set mark and match (highlight entire line) removing previous matchs when set same marks
function! SetMark(markName)
  let l:matchList = getmatches()
  let l:matchPat = ''
  let l:matchId = 0
  let l:matchLine = 0
  let l:cursorLine = line('.')

  " if the current buffer dont have the previousMark variable, this is defined
  " previousMark is a variable to store previous match positions(lines) for each mark
  if (!exists('b:previousMark'))
    let b:previousMark = [0, 0, 0, 0, 0, 0, 0, 0]
  endif

  " if markName has already been used, find/remove previous match defined for this markName
  if (b:previousMark[a:markName] != 0)
    for i in range(0, len(l:matchList)-1)
      if (exists('l:matchList[i]["pattern"]'))
        let l:matchPat = l:matchList[i]['pattern']
        let l:matchId = l:matchList[i]['id']
        let l:matchLine = strpart(l:matchPat, 2, strlen(l:matchPat)-3)

        " if exist previous matchs for this matchLine, remove
        if (l:matchLine == b:previousMark[a:markName])
          call matchdelete(l:matchId)
        endif
      endif
    endfor
  endif

  " set mark at cursor cursor position
  exec 'normal m' . a:markName
  " add match & highlight entire line at cursor position
  call matchadd('LineHighlight', '\%'.l:cursorLine.'l')
  " update match variable to store the new match position (line)
  let b:previousMark[a:markName] = l:cursorLine
endfunction

nnoremap <C-S-!> :call SetMark(1)<CR>
vnoremap <C-S-!> <Esc>:call SetMark(1)<CR>
inoremap <C-S-!> <C-o>:call SetMark(1)<CR>

nnoremap <C-S-@> :call SetMark(2)<CR>
vnoremap <C-S-@> <Esc>:call SetMark(2)<CR>
inoremap <C-S-@> <C-o>:call SetMark(2)<CR>

nnoremap <C-S-#> :call SetMark(3)<CR>
vnoremap <C-S-#> <Esc>:call SetMark(3)<CR>
inoremap <C-S-#> <C-o>:call SetMark(3)<CR>

nnoremap <C-S-$> :call SetMark(4)<CR>
vnoremap <C-S-$> <Esc>:call SetMark(4)<CR>
inoremap <C-S-$> <C-o>:call SetMark(4)<CR>

nnoremap <C-S-%> :call SetMark(5)<CR>
vnoremap <C-S-%> <Esc>:call SetMark(5)<CR>
inoremap <C-S-%> <C-o>:call SetMark(5)<CR>

nnoremap <C-S-^> :call SetMark(6)<CR>
vnoremap <C-S-^> <Esc>:call SetMark(6)<CR>
inoremap <C-S-^> <C-o>:call SetMark(6)<CR>

nnoremap <C-S-&> :call SetMark(7)<CR>
vnoremap <C-S-&> <Esc>:call SetMark(7)<CR>
inoremap <C-S-&> <C-o>:call SetMark(7)<CR>

"---------------------------------------------------------------------------------------------
" ( C + S + C ) shortcut to remove marks (1-7) and clear matchs highlight

nnoremap <C-S-C> :delmarks 1-7<CR>:call clearmatches()<CR>
vnoremap <C-S-C> <Esc>:delmarks 1-7<CR>:call clearmatches()<CR>
inoremap <C-S-C> <Esc>:delmarks 1-7<CR>:call clearmatches()<CR>

"---------------------------------------------------------------------------------------------
" ( C + 1,2,3,4,5,6,7 ) shortcuts to jump to marks

" function to reload matchs (clear/add matchs) when jump to marks out of current buffer
function! ReloadMarks()
  " if current buffer has marks defined
  if (exists('b:previousMark'))
    " remove matchs from previous buffer
    call clearmatches()
    " add matchs of current buffer
    call matchaddpos('LineHighlight', b:previousMark)
  endif
endfunction

" its needed in case of jumping to marks out of current buffer
autocmd BufEnter * :call ReloadMarks()

nnoremap <C-1> `1
vnoremap <C-1> <Esc>`1
inoremap <C-1> <C-o>`1

nnoremap <C-2> `2
vnoremap <C-2> <Esc>`2
inoremap <C-2> <C-o>`2

nnoremap <C-3> `3
vnoremap <C-3> <Esc>`3
inoremap <C-3> <C-o>`3

nnoremap <C-4> `4
vnoremap <C-4> <Esc>`4
inoremap <C-4> <C-o>`4

nnoremap <C-5> `5
vnoremap <C-5> <Esc>`5
inoremap <C-5> <C-o>`5

nnoremap <C-6> `6
vnoremap <C-6> <Esc>`6
inoremap <C-6> <C-o>`6

nnoremap <C-7> `7
vnoremap <C-7> <Esc>`7
inoremap <C-7> <C-o>`7

"---------------------------------------------------------------------------------------------
" shortcut to switch colorscheme;
" ( F8 ) next scheme (loop);
" ( S + F8 ) previous scheme;

if v:version < 700 || exists('loaded_switchcolor') || &cp
  finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
"let s:swindex = 0

" update index variable based on current colorscheme
function! UpdateIndex()
  let l:current_scheme = get(g:, 'colors_name', 'default')
  let s:swindex = index(s:swcolors, l:current_scheme)
endfunction

" change colorscheme by increment
function! SwitchColor(swinc)
  " if have switched background: dark/light
  if (s:swback == 1)
    let s:swback = 0
    let s:swindex += a:swinc
    let i = s:swindex % len(s:swcolors)

    " in skip list
    if (index(s:swskip, s:swcolors[i]) == -1)
      execute "colorscheme " . s:swcolors[i]
      " reload highlight custom config
      call HighlightCFG()
    else
      return SwitchColor(a:swinc)
    endif

  else
    let s:swback = 1
    if (&background == "light")
      execute "set background=dark"
    else
      execute "set background=light"
    endif

    " roll back if background is not supported
    if (!exists('g:colors_name'))
      return SwitchColor(a:swinc)
    endif
  endif

  " show current name on screen. :h :echo-redraw;
  redraw
  execute "colorscheme"
endfunction

 map <F8>        :call UpdateIndex()<CR>:call SwitchColor(1)<CR>
imap <F8>   <Esc>:call UpdateIndex()<CR>:call SwitchColor(1)<CR>
 map <S-F8>      :call UpdateIndex()<CR>:call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call UpdateIndex()<CR>:call SwitchColor(-1)<CR>

"---------------------------------------------------------------------------------------------
" shortcuts to Save & Build/Run;

let g:scriptBuildCPP = "/cygdrive/g/Vinicius/scripts/build/buildexeMSVC.bat"
"let g:scriptBuildCPP = "/cygdrive/g/Vinicius/scripts/build/buildexeGCC32b.bat"
"let g:scriptBuildCPP = "/cygdrive/g/Vinicius/scripts/build/buildexeGCC64b.bat"
"let g:scriptBuildCPP = "/g/Vinicius/scripts/build/buildexeMSVC.bat"

function! BuildSingle(scriptPath) 
  " creating a argument variable for the build script (if in cygwin mintty remove pattern /cygdrive & replacing /drive to drive:) & runnning
  ":!v_bp=`echo "%:p" | sed "s/\/cygdrive//" | sed "s/\///" |  sed "s/\//:\//"` && /cygdrive/c/vinny/scripts/buildexeMSVC.bat $v_bp
  execute '!v_bp=`echo "%:p" | sed "s/\/cygdrive//" | sed "s/\///" |  sed "s/\//:\//"` && ' . a:scriptPath . ' $v_bp'
endfunction

function! BuildAll(scriptPath)
  " creating a argument variable for the build script (if in cygwin mintty remove pattern /cygdrive & replacing /drive to drive:) & runnning
  execute '!v_bp=`echo "%:p:h" | sed "s/\/cygdrive//" | sed "s/\///" |  sed "s/\//:\//"` && ' . a:scriptPath . ' $v_bp/*."%:e"'
endfunction

" ( F9 ) save & build current buffer;
map <F9> :w<CR>:call BuildSingle(g:scriptBuildCPP)<CR>
imap <F9> <C-o>:w<CR><C-o>:call BuildSingle(g:scriptBuildCPP)<CR>
"map <F9> :w<CR>:!/cygdrive/c/Vinicius/bin/buildexeMSVC.bat %<CR>
"imap <F9> <C-o>:w<CR><C-o>:!/cygdrive/c/Vinicius/bin/buildexeMSVC.bat %<CR>

" ( F10 ) save current buffer & build all files with same extension on current buffer directory;
map <F10> :w<CR>:call BuildAll(g:scriptBuildCPP)<CR>
imap <F10> <C-o>:w<CR><C-o>:call BuildAll(g:scriptBuildCPP)<CR>
"map <F10> :w<CR>:!/cygdrive/c/Vinicius/bin/buildexeMSVC.bat *.cpp<CR>
"imap <F10> <C-o>:w<CR><C-o>:!/cygdrive/c/Vinicius/bin/buildexeMSVC.bat *.cpp<CR>

"---------------------------------------------------------------------------------------------
" By using command iabbrev its possible to make snippets for any language

autocmd FileType c,cpp :call Csnippets()

function! Csnippets()
  " this snippets dont moves the carret to the best position after write because this bugs the ACPCOMPLETION plugin
  iabbrev template@ #include <stdio.h><CR><CR>int main (int argc, char** argv) {<CR><CR><CR><Tab>return 0;<CR><BS>}<Esc>
  iabbrev main@ int main (int argc, char** argv) {<CR><CR><CR><Tab>return 0;<CR><BS>}<Esc>
  iabbrev for@ for (int i=0; i <  ; ++i) {<CR><CR>}<Esc>
  iabbrev struct@ typedef struct {<CR><Tab>char* name;<CR>int speed;<CR><BS>} Car;<Esc>
endfun
