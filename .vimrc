" Bundle settings
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set shell=/bin/bash
" Other shells like fish may report an error.

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle list
Bundle 'altercation/vim-colors-solarized'
"Bundle 'flazz/vim-colorschemes'
Bundle 'Markdown'
Bundle 'cscope.vim'
Bundle 'SuperTab'
"Bundle 'jpalardy/vim-slime'
"Bundle 'vim-scripts/slimv.vim'
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/powerline'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'fisadev/fisa-vim-colorscheme'
"Bundle 'fisadev/FixedTaskList.vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'nvie/vim-flake8'
Bundle 'pyflakes.vim'
Bundle 'IndexedSearch'
Bundle 'matchit.zip'
Bundle 'Wombat'
Bundle 'SearchComplete'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'jdevera/vim-cs-explorer'
Bundle 'tpope/vim-vividchalk'
Bundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }

" Installing plugins the first time
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif


"""""""""""""""""""""""""""""""""
"           General             "
"""""""""""""""""""""""""""""""""
set langmenu=en_US
set wrap
set nocp
syntax on
syntax enable
set background=dark
colorscheme solarized
if has("gui_running")
  set guioptions-=T
"  set background=dark
"else
"  set background=dark
endif

" navigate windows with meta+arrows
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

set mouse=a
set nobackup
setlocal noswapfile
set bufhidden=hide
set autoread
set showcmd
set autoindent
set sessionoptions+=resize
set scrolloff=7
set cmdheight=2
set ls=2

" Chinese support
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,iso-8859-6
set ambiwidth=double
set guifont=Terminus\ Medium\ 17

" Cursor jumps to the last place while openning file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" |
  \ endif

" Reverse color of current cursor
"if has("gui_running")
"  set cursorline
"  hi cursorline guibg=#333333
"endif

let mapleader=','

" Searching settings
set hlsearch
set incsearch
set ignorecase
nmap <silent> <leader><cr> :noh<cr>

set number " Show line number
set autochdir " auto change working directory
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmenu " Complete command
set showmatch " Jump to the related parenthesses shortly
set matchtime=2 " Time above
set smarttab
filetype plugin on
filetype indent on
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype octave
   \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx, setfiletype python
augroup END

autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %



" foldmethod and F5(F6) to fold(unfold) code
set foldmethod=indent
autocmd FileType fortran set foldmethod=syntax
map <F5> zR
map <F6> zM

" close pair function

function! Pair(char)
  if getline('.')[col('.')] == ""
    if a:char == "("
      return "()"."\<ESC>i"
    elseif a:char == "["
      return "[]"."\<ESC>i"
    elseif a:char == "{"
      return "{}"."\<ESC>i"
    endif
  else
    return a:char
  endif
endfunction

inoremap ( <c-r>=Pair('(')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ <c-r>=Pair('[')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { <c-r>=Pair('{')<CR>
inoremap } <c-r>=ClosePair('}')<CR>

function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

"""""""""""""""""""""""""""
" End of general settings "
"""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"           Plugins             "
"""""""""""""""""""""""""""""""""
" vim-latexsuite                "
" vim-neocomplcache             "
" vim-latex-box                 "
" vim-tagbar                    "
" vim-ctrlp                     "
" vim-flake8                    "
" vim-indent-guide              "
"""""""""""""""""""""""""""""""""

"vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols='fancy'
"let g:Powerline_colorscheme="solarized"
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_theme="solarized"
let g:airline_enable_syntastic=1
let g:airline_detect_paste=1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Former Error
map <F3> :cn<Enter>
" Next Error
map <F4> :cp<Enter>

"""""""""""""""""
"  tagbar       "
"""""""""""""""""
" F8 Open tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = "/usr/bin/ctags"
" latex support
let g:tagbar_type_tex = {
     \ 'ctagstype' : 'latex',
     \ 'kinds'     : [
          \ 's:sections',
          \ 'g:graphics',
          \ 'l:labels',
          \ 'r:refs:1',
          \ 'p:pagerefs:1'
      \ ],
      \ 'sort'    : 0,
\ }
"""""""""""""""""
" End of tagbar "
"""""""""""""""""

""""""""""""""""""""""
" flake8             "
" CtrlP              "
""""""""""""""""""""""
" pylint
autocmd FileType python map <buffer> <leader>9 :w<cr>:!pylint2 % \| less<CR>
" flake8
autocmd FileType python map <F7> :call Flake8()<CR>
" C-Z quick current buffer
autocmd FileType python map <C-Z> <ESC>:q<CR>
" Ignore errors
let g:flake8_ignore = "E501,E203,E251"
" Shut quickfix
let g:pyflakes_use_quickfix = 0

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
" 调用ctrlp时使用默认搜索文本
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
  execute ':CtrlP' . a:ctrlp_command_end
  call feedkeys(a:search_text)
endfunction
" 带默认文本的ctrlp
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" 不要切换当前工作路径
let g:ctrlp_working_path_mode = 0
" 模糊搜索忽略文件
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
\ }

" SuperTab
let g:SuperTabDefaultCompletionType = '<c-x><c-u>'

" Neocomplcache
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <expr><BS> pumvisible() ? neocomplcache#close_popup() : "\<BS>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Shell like behavior(not recommended).
set completeopt=longest,menu
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Slimv
"let g:slimv_swank_cmd = '! xterm -e sbcl &'
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
autocmd FileType tex set sw=2
set iskeyword+=:

" vim-indent-guide
autocmd FileType python set ts=4 sw=4 et
autocmd FileType vim set ts=2 sw=2 et
autocmd FileType fortran set ts=6 sw=6 et
autocmd FileType html set ts=2 sw=2 et
autocmd FileType css set ts=2 sw=2 et
let g:indent_guides_start_level = 1
autocmd FileType fortran let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1


" K to translate
set keywordprg=ydcv

" Multiple
"


""""""""""""""""""
" End of Plugins "
""""""""""""""""""

"""""""""""""""""""
" Python Settings "
"""""""""""""""""""

" Equal sign for python

autocmd FileType python,c inoremap = <c-r>=EqualSign('=')<CR>
autocmd FileType python,c inoremap + <c-r>=EqualSign('+')<CR>
autocmd FileType python,c inoremap - <c-r>=EqualSign('-')<CR>
autocmd FileType python,c inoremap * <c-r>=EqualSign('*')<CR>
autocmd FileType python,c inoremap < <c-r>=EqualSign('<')<CR>
autocmd FileType python,c inoremap > <c-r>=EqualSign('>')<CR>
autocmd FileType python,c inoremap : <c-r>=Swap()<CR>
autocmd FileType python,c inoremap , ,<SPACE>
autocmd FileType python,c inoremap ! <c-r>=EqualSign('!')<CR>
autocmd FileType c inoremap ; <c-r>=F()<CR>
autocmd FileType c inoremap <CR> <c-r>=Ent()<CR>
autocmd FileType python inoremap ; ;<SPACE>

function Ent()
  if getline('.')[col('.')-1] =~ "}" && getline('.')[col('.') - 2] =~ "{"
    return "\<CR>\<UP>\<End>\<CR>"
  else
    return "\<CR>"
  endif
endfunction

function F()
  if &filetype == "c" && getline('.') =~ "for ("
    return "; "
  else
    return ";"
  endif
endfunction

" Swap函数
" (:)自动():
" 且当:前是)时不空格，其余情况冒号前一个空格
" 当一行有[]时间冒号不空格，应对[::]情况
function! Swap()
  if getline('.')[col('.') - 1] =~ ")"
    return "\<ESC>la:"
  else
    if getline('.')[col('.') - 1] =~ "]"
      return ":"
    else
      if getline('.')[col('.') - 2] =~ ")"
        return ":"
      else
        return " :"
      endif
    endif
  endif
endfunction

" EqualSign函数
" 当一行有[]时-不空格，应对[-1]情况
" 实现运算符包括+=、*=前后空格
" a + b情况可以补输入符号比如=
" a = b情况可以补输入符号如+

function Sft()
  if &filetype == "c" && (getline('.') =~ "#include" || getline('.') =~ "#" || getline('.') =~ "\".*\"" || getline('.') =~ "putchar(.*" || getline('.') =~ "FILE" || getline('.') =~ "#include")
    return 1
  elseif &filetype == "python" && (getline('.') =~ "#" || strpart(getline('.'),col('.') - 1) =~ "\"" || getline('.') =~ "re\..*(")
    return 1
  else
    return 0
  endif
endfunction

function! EqualSign(char)
  if Sft()
    return a:char
  endif
  let la1 = strpart(getline('.'), col('.') - 1, 1)
  if la1 =~ "[=]"
    return a:char
  endif
  if a:char =~ "-" && (getline('.') =~ "def ()" || getline('.') =~ "[\[\]]")
    return a:char
  endif 
  let ex1 = getline('.')[col('.') - 3]
  let ex2 = getline('.')[col('.') - 2]
  if ex1 =~ "+" && a:char =~ "+" || ex1 =~ "-" && a:char =~ "-"
    if strpart(getline('.'), col('.') - 3, 3) =~ "++" || strpart(getline('.'), col('.') - 3, 3) =~ "--"
      return a:char
    else
      return "\<ESC>hhs".a:char."\<ESC>lls"
    endif
  endif
  if a:char =~ "[+-]"
    if strpart(getline('.'), col('.') - 3, 2) =~ "[\d][eE]" || getline('.')[col('.') - 3] =~ "[+-=\*\/,;:]" || getline('.')[col('.') - 2] =~ "[(\[]"
      return a:char
    endif
  endif
  if ex1 == "=" && a:char != "="
    return a:char
  endif
  if ex2 =~ "[-=+><>\/\*!]"
    return "\<ESC>a".a:char
  endif
  if ex1 =~ "[-=+><>\/\*!]"
    if ex2 =~ "\<SPACE>"
      return "\<ESC>i".a:char."\<ESC>la"
    else
      return "\<SPACE>".a:char."\<SPACE>"
    endif 
  else
    return "\<SPACE>".a:char."\<SPACE>"
  endif
endfunction

" $c add comment
au FileType python inoremap <buffer> $c <esc>O#<cr>##<space><cr>#<esc>kA


"""""""""""""""""""""""""""""""""
" python调试                    "
" ctrl+F7设置断点               "
" ctrl+F8移除断点               "
" F9(Python2)执行               "
" F10(Python3)执行              "
"""""""""""""""""""""""""""""""""

python << EOF
import time
import vim
def SetBreakpoint():
    import re
    nLine = int(vim.eval('line(".")'))
    strLine = vim.current.line 
    strWhite = re.search('^(\s*)',strLine).group(1)
    vim.current.buffer.append( "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" 
          % {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break 
        else: 
            vim.current.buffer.append( 'import pdb', 2)
            vim.command( 'normal j1')
            break

vim.command( 'map <C-F7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1
    vim.command( 'normal %dG' % nCurrentLine)

vim.command('map <C-F8> :py RemoveBreakpoints()<cr>')
vim.command('map <F9> :w<cr>:!python2 %<cr>')
vim.command('map <F10> :w<cr>:!python %<cr>')
EOF

""""""""""""""""""""""""""
" End of python settings "
""""""""""""""""""""""""""


""""""""""""""""""""
" Fortran settings "
""""""""""""""""""""

let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_have_tabs=1
let fortran_fold=1
let fortran_indent_more=1
autocmd FileType fortran set fdm=syntax
autocmd FileType fortran map <Leader>ll :w<CR>:!gfortran -g % -o %.o | map <Leader>lv :!./%.o<CR>
autocmd FileType c map <Leader>ll :w<CR>:!gcc -g % -o %.o | map <Leader>lv :!./%.o<CR>

autocmd FileType fortran inoremap * <c-r>=FEqualSign("*")<CR>
autocmd FileType fortran inoremap = <c-r>=FEqualSign("=")<CR>
autocmd FileType fortran inoremap + <c-r>=FEqualSign("+")<CR>
autocmd FileType fortran inoremap - <c-r>=FEqualSign("-")<CR>
autocmd FileType fortran inoremap , <c-r>=Coma()<CR>
autocmd FileType fortran inoremap ! <c-r>=Fnum("!")<CR>
autocmd FileType fortran inoremap 0 <c-r>=Fnum('0')<CR>
autocmd FileType fortran inoremap 1 <c-r>=Fnum('1')<CR>
autocmd FileType fortran inoremap 2 <c-r>=Fnum('2')<CR>
autocmd FileType fortran inoremap 3 <c-r>=Fnum('3')<CR>
autocmd FileType fortran inoremap 4 <c-r>=Fnum('4')<CR>
autocmd FileType fortran inoremap 5 <c-r>=Fnum('5')<CR>
autocmd FileType fortran inoremap 6 <c-r>=Fnum('6')<CR>
autocmd FileType fortran inoremap 7 <c-r>=Fnum('7')<CR>
autocmd FileType fortran inoremap 8 <c-r>=Fnum('8')<CR>
autocmd FileType fortran inoremap 9 <c-r>=Fnum('9')<CR>
autocmd FileType fortran inoremap / <c-r>=FEqualSign('/')<CR>

function Fnum(num)
  let colnum = col('.')
""  let ex1 = getline('.')[col('.') - 4]
""  let ex2 = getline('.')[col('.') - 3]
""  if ex2 =~ "[-+]" && ex1 =~ "[+=(\/\*,]"
""    return "\<ESC>hi"."\<space>"."\<ESC>lls".a:num
""  endif
  if colnum == 1
    return "\<ESC>s".a:num
  else
    if colnum <= 6
      return "\<ESC>ls".a:num
    else
      return a:num
    endif
  endif
endfunction

function FEqualSign(char)
  if a:char == "*"
    let re = getline('.')
    if getline('.')[col('.') - 2] == "(" || getline('.')[col('.') - 3] == "," || strpart(re, col('.') - 5, 4) =~ "real" || strpart(re, col('.') - 6, 5) =~ "print"
      return a:char
    endif
  endif
  if a:char =~ "[+-]"
    if strpart(getline('.'), col('.') - 3, 2) =~ "[0-9][eE]" || getline('.')[col('.') - 3] =~ "[+-=\*\/,;:]" || getline('.')[col('.') - 2] =~ "[(\[]"
      return a:char
    endif
  endif
  let ex1 = getline('.')[col('.') - 3]
  let ex2 = getline('.')[col('.') - 2]
  if ex2 =~ "[-=+><>\/\*!]"
    return "\<ESC>a".a:char
  endif
  if ex1 =~ "[-=+><>\/\*!]"
    if ex2 =~ "\<SPACE>"
      return "\<ESC>i".a:char."\<ESC>la"
    else
      return "\<SPACE>".a:char."\<SPACE>"
    endif 
  else
    return "\<SPACE>".a:char."\<SPACE>"
  endif
endfunction

function Coma()
  if getline('.')[col('.') - 3] =~ "*" && getline('.')[col('.') - 2] =~ '\s'
    return "\<ESC>i,\<ESC>la"
  else
    return ", "
  endif
endfunction

""""""""""""""""""
" End of Fortran "
""""""""""""""""""

"""""""""""""""""""""""""""""""""
"           其他设置            "
"""""""""""""""""""""""""""""""""
" 保存代码文件前自动修改最后修改时间
au BufWritePre *.sh
  \ call TimeStamp('#')
au BufWritePre .vimrc,*.vim
  \ call TimeStamp('"')
au BufWritePre *.c,*.h
  \ call TimeStamp('*')
au BufWritePre *.cpp,*.hpp
  \ call TimeStamp('//')
au BufWritePre *.cxx,*.hxx
  \ call TimeStamp('//')
au BufWritePre *.java
  \ call TimeStamp('//')
au BufWritePre *.rb
  \ call TimeStamp('#')
au BufWritePre *.py
  \ call TimeStamp('#')
au BufWritePre Makefile
  \ call TimeStamp('#')
au BufWritePre *.php
  \ call TimeStamp('<?php //', '?>')
au BufWritePre *.html,*htm
  \ call TimeStamp('<!--', '-->')

" Last change用到的函数，返回时间，能够自动调整位置
function! TimeStamp(...)
  let sbegin = ''
  let send = ''
  if a:0 >= 1
  let sbegin = a:1.'\s*'
  if a:1 == '*'
    let sbegin = '\' . sbegin
  endif
  endif
  if a:0 >= 2
  let send = ' '.a:2
  endif
  let pattern = 'Last Change:.*'
    \. send
  let pattern = '^\s*' . sbegin . pattern . '\s*$'
  let now = strftime('%Y年%m月%d日 %H时%M分%S秒',
    \localtime())
  let row = search(pattern, 'n')
  if row != 0
  let curstr = getline(row)
  let col = match( curstr , 'Last')
  let leftcol = match(curstr,sbegin)
  let spacestr = repeat(' ',col - len(a:1)-leftcol)
  let leftspacestr = repeat(' ',leftcol)
  let now = leftspacestr . a:1 . spacestr . 'Last Change: '
    \. now . send
  call setline(row, now)
  endif
endfunction

""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
function SetTitle() 
  "如果文件类型为.sh文件 
  if &filetype == 'sh' 
    call setline(1,"\#########################################################################") 
    call append(line("."), "\# File Name: ".expand("%")) 
    call append(line(".")+1, "\# Author: Shirui") 
    call append(line(".")+2, "\# mail: shirui816@gmail.com") 
    call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "\#########################################################################") 
    call append(line(".")+5, "\#!/bin/bash") 
    call append(line(".")+6, "") 
   else 
    call setline(1, "/*************************************************************************") 
    call append(line("."), "    > File Name: ".expand("%")) 
    call append(line(".")+1, "    > Author: Shirui") 
    call append(line(".")+2, "    > Mail: shirui816@gmail.com") 
    call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
    call append(line(".")+4, " ************************************************************************/") 
    call append(line(".")+5, "")
  endif
  if &filetype == 'cpp'
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "using namespace std;")
    call append(line(".")+8, "")
  endif
  if &filetype == 'c'
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "")
  endif
  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G
endfunction

""""""""""""""
" C settings "
""""""""""""""
" Cscope plugin
"
" Use both cscope and ctag  
set cscopetag  
  
" Show msg when cscope db added  
set cscopeverbose  
  
" Use tags for definition search first  
set cscopetagorder=1  
  
" Use quickfix window to show cscope results  
" set cscopequickfix=s-,c-,d-,i-,t-,e- 

"autocmd FileType c,cpp nmap <C-]>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
"autocmd FileType c,cpp nmap <C-]>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"
" s -- 查找 C 符号
" g -- 查找定义
" d -- 查找被这个函数调用的函数（们）
" c -- 查找调用这个函数的函数（们）
" t -- 查找这个字符串
" e -- egrep查找
" f -- 查找这个文件
" i -- 查找#include这个文件的文件（们）
"



"""""""""""""""""""""""""""""""""
"              EOF              "
"""""""""""""""""""""""""""""""""
