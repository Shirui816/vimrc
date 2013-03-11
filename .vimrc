" vundle设置
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set nocompatible
filetype off
set shell=/bin/bash " 不用bash的同学，一定要注意，我用fish就一直悲剧……要加入这行的。
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 各种插件
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" tagbar
Bundle 'majutsushi/tagbar'
" powerline
Bundle 'Lokaltog/powerline'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " 新版powerline-vim，需要字体。
" 模糊搜索
Bundle 'kien/ctrlp.vim'
" Git 集成 :help git
Bundle 'motemen/git-vim'
" tasks list
Bundle 'fisadev/FixedTaskList.vim'
" python mode
Bundle 'klen/python-mode'
" flake8
Bundle 'nvie/vim-flake8'
" neocomplcache
Bundle 'Shougo/neocomplcache'
" Latex-box
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" Bundles from vim-scripts repos

" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Autocompletion inside search
Bundle 'SearchComplete'

" 首次运行，如果你没有~/.vim文件夹的话。
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


"""""""""""""""""""""""""""""""""
"           通用配置            "
"""""""""""""""""""""""""""""""""
set langmenu=zh_CN
set nocp "设置不兼容模式
syntax on "打开语法高亮
if has("gui_running")
    set guioptions-=T "关闭工具栏
    colorscheme wombat "载入色彩方案
else
    set background=dark
    colorscheme zellner
endif
 
" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
 
set mouse=a "设置鼠标支持
set nobackup "取消自动备份
setlocal noswapfile "不要生成swap文件
set bufhidden=hide "当buffer被丢弃时隐藏
set autoread "设置自动读取文件当外部文件被修改时
set showcmd "设置显示未完成的命令
set autoindent "设置自动缩进
set sessionoptions+=resize "保存窗口大小
set scrolloff=7 "光标上下两侧最少保留的屏幕行数
set cmdheight=2 "设置命令行高度为2行
set ls=2
 
" 设置中文支持
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,iso-8859-6
set ambiwidth=double
set guifont=Terminus\ (TTF)\ for\ Powerline\ Medium\ 16 " 打过补丁的字体
 
"打开文件时，总是跳到退出之前的光标处
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif
 
"反显光标当前行颜色
if has("gui_running")
    set cursorline
    hi cursorline guibg=#333333
endif
 
let mapleader=','
"设置高亮搜索、输入字符串就显示匹配点
set hlsearch "搜索出之后高亮关键词
set incsearch "搜索时高亮关键词
set ignorecase "搜索时忽略大小写
nmap <silent> <leader><cr> :noh<cr> "快速清除高亮搜索
 
"关于标签的快捷键
map <leader>tn :tabnew%<cr> "将当前内容在新标签中打开
map <leader>te :tabedit<cr> "打开空白新标签
map <leader>tm :tabmove
"移动当前标签,使用方法为
":tabmove [N]把当前标签页移到第N个标签页之后.
"用0使用当前标签页成为首个标签页.如果没有N,
"当前标签页成为最后一个.
 
set number "设置显示行号
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmenu "命令行补全
set showmatch "插入括号时短暂跳转到匹配的对应括号
set matchtime=2 "跳转到匹配括号的时间
filetype plugin on "允许使用ftplugin目录下的文件类型特定脚本
filetype indent on "允许使用indent目录下的文件类型缩进
 
"设置以缩进的方式自动折叠和设置快捷方式
set foldmethod=indent
"map <F3> zO "打开折叠
"map <F4> zC "关闭折叠
map <F5> zR "打开所有折叠
map <F6> zM "关闭所有折叠
 
"""""""""""""""""""""""""""""""""
"           插件设置            "
"""""""""""""""""""""""""""""""""
" vim-latexsuite                "
" vim-neocomplcache             "
" vim-supertab                  "
" vim-latex-box                 "
" vim-tagbar                    "
" vim-ctrlp                     "
" vim-python-mode-git           "
" vim-flake8                    "
"""""""""""""""""""""""""""""""""
"上一个错误
map <F3> :cn<Enter>
"下一个错误
map <F4> :cp<Enter>
 
"""""""""""""""""
"  tagbar 设置  "
"""""""""""""""""
" 设置按键是F8
map <F8> :TagbarToggle<CR>
" 宽度
let g:tagbar_width = 25
" 放在左边
let g:tagbar_left = 1
" 打开后切换到tagbar
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = "/usr/bin/ctags"
" latex支持
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
" python mode        "
" flake8             "
" CtrlP              "
""""""""""""""""""""""
" 使用pylint
autocmd FileType python map <buffer> <leader>9 :w<cr>:!pylint %<CR>
" 使用flake8
autocmd FileType python map <F7> :call Flake8()<CR>
" C-Z退出当前窗口
autocmd FileType python map <C-Z> <ESC>:q<CR>
" flake8忽略错误
let g:flake8_ignore = "E501,E203"
" 启用/不启用quickfix
let g:pyflakes_use_quickfix = 0
"let g:flake8_builtins = "_,apply"
"let g:flake8_max_line_length = 99
"let g:flake8_max_complexity = 10
 
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
 
" python-mode 设置
" 不必每次保存文件的时候显示lint信息
let g:pymode_lint_write = 0
" pep8+pyflakes+pylint---<,8>运行
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" 错误容忍
let g:pymode_lint_ignore = "E501,W293,E203"
let g:pymode_lint_signs = 0
" 打开python文件不折叠
let g:pymode_folding = 1
" 默认不加载rope，想加载用1
let g:pymode_rope = 0 
" python-mode的rope设定
"nmap ,d :RopeGotoDefinition<CR>
"nmap ,o :RopeFindOccurrences<CR>
 
""""""""""""""""""""""""""
"   End of Python mode   "
""""""""""""""""""""""""""
 
 
" neocomplcache设置，摘自官网
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 上面照搬官网，下面这条是关闭自动提示，只用neocomplcache生成cache，supertab进行补全
let g:neocomplcache_disable_auto_complete = 1

" powerline 设置
let g:Powerline_symbols = 'fancy'
 
" 启用omni补全
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 
 
" Supertab设置
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-U>"
set ofu=syntaxcomplete#Complete
set completeopt=menu,longest "不在补全的时候显示奇怪的窗口
 
 
" vim-latexsuite设置
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
 
 
" K 翻译当前单词
" 设置vim字典翻译功能
set keywordprg=/home/shirui/Workspace/ydcv/ydcv.py
 
 
" 设置( { [ < 自动配对和closepair函数
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
 
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
 
" 设置运算符前后空格和+=等符号，只在python下有效
autocmd FileType python inoremap = <c-r>=EqualSign('=')<CR>
autocmd FileType python inoremap + <c-r>=EqualSign('+')<CR>
autocmd FileType python inoremap - <c-r>=EqualSign('-')<CR>
autocmd FileType python inoremap * <c-r>=EqualSign('*')<CR>
autocmd FileType python inoremap ! <c-r>=Bang()<CR>
autocmd FileType python inoremap < <c-r>=EqualSign('<')<CR>
autocmd FileType python inoremap > <c-r>=EqualSign('>')<CR>
autocmd FileType python inoremap : <c-r>=Swap()<CR>
autocmd FileType python inoremap / <c-r>=EqualSign('/')<CR>
autocmd FileType python inoremap , ,<SPACE>
autocmd FileType python inoremap ; ;<SPACE>
"autocmd FileType python inoremap . .<SPACE>
 
 
" Bang函数
" 感叹号前面是数字或者空格的时候不空格
" 前方不是数字的时候两端空格
function! Bang()
    if getline('.')[col('.') - 2] =~ "[0123456789\<SPACE>]"
        return "! "
    else
        return " ! "
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
        if getline('.') =~ "["
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
" a + b情况可以在a +| b(|为光标所在)补输入符号比如=
function! EqualSign(char)
    if a:char =~ "=" && getline('.') =~ ")"
        return a:char
    endif
    if a:char =~ "-" && getline('.') =~ "["
        return a:char
    endif 
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]
    if ex2 =~ "[-=+><>\/\*!]"
        return "\<ESC>a".a:char
    endif
    if ex1 =~ "[-=+><>\/\*!]"
        if ex2 =~ "/s"
            return "\<ESC>i".a:char."\<SPACE>"
        else
            return "\<ESC>xa".a:char."\<SPACE>"
        endif 
    else
        if ex2 !~ "/s"
            return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
        else
            return a:char."\<SPACE>\<ESC>a"
        endif 
    endif
endfunction
 
 
" python各种设置
" tab是4个空格，输入制表符用CTRL-V<Tab>
autocmd FileType python setlocal expandtab | setlocal shiftwidth=4 |
    \ setlocal softtabstop=4 | setlocal tabstop=4 | set wrap
 
" 在输入模式下$c添加注释
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
 
"""""""""""""""""""""""""""""""""
"              EOF              "
"""""""""""""""""""""""""""""""""
