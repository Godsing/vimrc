"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins managed by vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'madox2/vim-ai'
" Plug 'github/copilot.vim'                  " GitHub Copilot for AI-assisted coding
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x' } " file/directory tree
Plug 'nvim-lua/plenary.nvim'                 " dependency for neo-tree
Plug 'nvim-tree/nvim-web-devicons'           " dependency for neo-tree
Plug 'MunifTanjim/nui.nvim'                  " dependency for neo-tree
Plug '3rd/image.nvim'                        " dependency for neo-tree
Plug 'ervandew/supertab'                     " Enhanced tab completion
Plug 'easymotion/vim-easymotion'             " Quick cursor movement
Plug 'nathanaelkane/vim-indent-guides'       " Display indent guides
" Plug 'tpope/vim-obsession'                   " Session management
Plug 'vim-scripts/ReplaceWithRegister'       " Replace text with register content
Plug 'mileszs/ack.vim'                       " Ack search in project
Plug 'dense-analysis/ale'                    " Show linting errors on the fly
" Plug 'jiangmiao/auto-pairs'                  " Auto-insert closing brackets, quotes, etc.
Plug 'jlanzarotta/bufexplorer'               " Switch between buffers
Plug 'ctrlpvim/ctrlp.vim'                    " Fuzzy find files
Plug 'junegunn/goyo.vim'                     " Distraction-free writing environment
Plug 'morhetz/gruvbox'                       " Color scheme
Plug 'maximbaz/lightline-ale'                " Show linting errors in lightline
Plug 'itchyny/lightline.vim'                 " Status line
Plug 'vim-scripts/mru.vim'                   " Show most recently used files
Plug 'amix/open_file_under_cursor.vim'       " Open file under cursor
Plug 'tpope/vim-commentary'                  " Comment/uncomment lines
Plug 'terryma/vim-expand-region'             " Visually select increasingly larger regions
Plug 'tpope/vim-fugitive'                    " Interact with git
Plug 'airblade/vim-gitgutter'                " Show git diff in the gutter
Plug 'nathanaelkane/vim-indent-guides'       " Show indent levels
Plug 'michaeljsmith/vim-indent-object'       " Allow indent-based text objects
Plug 'plasticboy/vim-markdown'               " Support Markdown syntax
Plug 'terryma/vim-multiple-cursors'          " Have multiple cursors
Plug 'tpope/vim-repeat'                      " Repeat plugins like surround and repeat
Plug 'tpope/vim-surround'                    " Easily manipulate surrounding characters
Plug 'maxbrunsfeld/vim-yankstack'            " Keep track of recently yanked text
Plug 'amix/vim-zenroom2'                     " Distraction-free coding environment
Plug 'farmergreg/vim-lastplace'              " Remember your cursor position
Plug 'vim-scripts/LargeFile'                 " Handle large files efficiently
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭兼容模式
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" set leader to ';'
let mapleader = ";"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" scrolloff/so: 滚动偏移量，即滚动时，光标上下至少显示N行
set so=3

" 让当前文件配置变更立即生效
" let s:current_file_path = resolve(expand('<sfile>:p'))
" autocmd! BufWritePost s:current_file_path source $MYVIMRC
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" 高亮显示匹配的括号
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set regular expression engine automatically
set regexpengine=0

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"=============================
" => 自定义常用快捷键
"=============================
" 快速连按两次<Leader>键，等价于<ESC>
inoremap <Leader><Leader> <ESC>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" :W 表示用 sudo 保存，具体配置见 basic.vim
" 在结对符之间跳转 记忆：match
nmap <Leader>m %
" 去除空行
nnoremap <F2> :g/^\s*$/d<CR>


"=============================
" => 鼠标
"=============================
" 可以在任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key


"=============================
" => Tab页, Buffer, Window
"=============================
" => Tab 页
" Useful mappings for managing tabs
map <leader>a :tabprevious<cr>
map <leader>f :tabnext<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between the current and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with context: the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the current buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" 打开 ~/tmp 用于快速记录点东西
map <leader>tmp :tabnew ~/tmp<cr>

" => Buffer
" 垂直(线)分屏打开buffer
:cnoremap vb vertical rightbelow sb

" => Window
nmap <Leader>q :q<CR>
" 保存所有窗口内容，并退出 vim
nmap <Leader>wq :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口 记忆：next window
nnoremap nw <C-W><C-W>
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l


"=============================
" => 显示：布局、高亮
"=============================
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 显示光标当前位置
set ruler

" 折行
set wrap  " 当一行在屏幕上显示不下时，换行显示

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" 开启行号显示
set number
" 设置相对行号
set rnu

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on


"=============================
" => 显示：主题、字体
"=============================
"set term=xterm
set t_Co=256
set background=dark
colorscheme gruvbox
" 使用 <F4> 自动切换 background
nnoremap <F4> :set background=<C-R>=(&background=='dark'?'light':'dark')<CR><CR>


"=============================
" => 编码
"=============================
" Vim 中文本的默认编码
set encoding=utf-8
" 打开文件时，会逐个尝试以下编码
set fileencodings=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
set termencoding=utf-8
" 东亚地区易混淆字符的宽度
set ambiwidth=double


"=============================
" => 空格和制表符
"=============================
" 将制表符扩展为空格
set expandtab
" Be smart when using tabs
set smarttab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


"=============================
" => 复制粘贴
"=============================
" set backspace=2
set pastetoggle=<F3>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p


"=============================
" => 搜索替换
"=============================
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" When searching try to be smart about cases
set smartcase
" 高亮显示搜索结果
set hlsearch
" 用 // 搜索 选中的文本
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" 用 Ctrl-r 搜索并替换(y确认, n跳过, a全部确认)选中的文本
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"=============================
" => 代码折叠
"=============================
"set foldmethod=indent
set foldmethod=syntax
set foldnestmax=6
" 启动 vim 时关闭折叠代码
set nofoldenable


"=============================
" => 缩进快捷键
"=============================
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >
vnoremap <S-Tab> <
" Ref: https://vim.fandom.com/wiki/Shifting_blocks_visually#Mappings


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 各种插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=============================
" => Plugin: vim-indent-guides
"=============================
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 <leader>i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


"=============================
" => Plugin: easymotion-vim
"=============================
" 以下配置参考了 GitHub 仓库首页说明
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <Leader><Leader>w <Plug>(easymotion-w)
nmap <Leader><Leader>b <Plug>(easymotion-b)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `空格{char}{char}{label}` 通过两个字符快速定位到目标位置
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Space> <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1  " 大小写不敏感
" JK motions: 快速行移动 Line motions
nmap <Leader><Leader>j <Plug>(easymotion-j)
nmap <Leader><Leader>k <Plug>(easymotion-k)


"=============================
" => Plugin: neo-tree
"=============================
nmap <Leader>b :Neotree<CR>

function! TryToggleNeotree()
    if argc() == 0 || (argc() == 1 && isdirectory(argv(0)))
        Neotree
    endif
endfunction

autocmd VimEnter * call TryToggleNeotree()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"=============================
" => Plugin: ALE
"=============================
" 所有的 linter 和 fixer，都需要先安装了才能使用，ALE 只是 LSP client
" Linting:
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_column_always = 1
let g:ale_linters = {
    \   'python': ['pyright', 'jedils'],
    \   'cpp': ['gcc', 'ccls', 'cppcheck'],
    \}
nmap <silent> <Leader>a <Plug>(ale_next_wrap)

" Fixing:
let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \   'python': ['yapf'],
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}
let g:ale_fix_on_save = 0

" Completion:
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" imap <Leader><Space> <Plug>(ale_complete)

" Rename:
nmap <Leader>r :ALERename<Return>

" Go To Definition:
nmap gd <Plug>(ale_go_to_definition)

" Find References:
nmap <silent> <leader>n :ALEFindReferences -relative<Return>

" Hovering:
nmap <silent> K :ALEHover<Return>


"=============================
" => Plugin: lightline-ale
"=============================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': '|' }
      \ }

let g:lightline.component_expand = {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_infos': 'lightline#ale#infos',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \}

let g:lightline.component_type = {
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'right',
    \}

let g:lightline.active = {
        \ 'right': [ [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'filetype', 'fileencoding'],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
        \          ]}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

"=============================
" => Other Plugins
"=============================
" let g:jedi#completions_command = "<Leader><Space>"
nnoremap <silent> <leader>z :Goyo<cr>
" for big File more than 1MB, turn off syntax highlighting
let g:LargeFile = 1

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

"=============================
" => Plugin: MiniBufExplorer
"=============================
" " 显示/隐藏 MiniBufExplorer 窗口
" map <Leader>bl :MBEToggle<cr>
" " buffer 切换快捷键
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>

" " 设置环境保存项
" set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" " 保存 undo 历史
" set undodir=~/.undo_history/
" set undofile
" " 保存快捷键
" map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" " 恢复快捷键
" map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" supertab
" let g:SuperTabMappingForward = '<nul>'
" let g:SuperTabMappingBackward = '<s-nul>'
" let g:SuperTabMappingForward = '<s-tab>'
" let g:SuperTabMappingBackward = '<tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

"=============================
" => Filetype
"=============================
" 开启文件类型侦测
" filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on

" => Filetype: Python
let python_highlight_all=1
au Filetype python set tabstop=4  " au[tocmd]: meaning defining autocommands
au Filetype python set softtabstop=4  " au [group] {event} {file pattern} [nested] {cmd}
au Filetype python set shiftwidth=4
"au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99


"=============================
" => Helper functions
"=============================
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"=============================
" => 文件开头模板
"=============================
""定义函数SetTitle，自动插入文件头
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\#!/usr/bin/env bash")
        call append(line(".")+1, "\# Author: Gengxin Wang")
        call append(line(".")+2, "\# Mail: wanggengxin.01@bytedance.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "")
    elseif &filetype == 'cpp'
        call append(line(".")+5, "#include <iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
    elseif &filetype == 'c'
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    elseif &filetype == 'python'
        call setline(1, "#-*- coding: utf-8 -*-")
        call append(line("."),"")
        call append(line(".")+1, "\# Author: Gengxin Wang")
        call append(line(".")+2, "\# mail: wanggengxin.01@bytedance.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
        call append(line(".")+4, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > Author: Gengxin Wang")
        call append(line(".")+1, "    > Mail: wanggengxin.01@bytedance.com")
        call append(line(".")+2, "    > Created Time: ".strftime("%Y-%m-%d",localtime()))
        call append(line(".")+3, " ************************************************************************/")
        call append(line(".")+4, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunction

"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py :call SetTitle()

"=============================
" => 保存时自动删除行尾空格
"=============================
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

"=================================================================================
"
"   Following file contains the commands on how to run the currently open code.
"   The default mapping is set to F5 like most code editors.
"   Change it as you feel comfortable with, keeping in mind that it does not
"   clash with any other keymapping.
"
"   NOTE: Compilers for different systems may differ. For example, in the case
"   of C and C++, we have assumed it to be gcc and g++ respectively, but it may
"   not be the same. It is suggested to check first if the compilers are installed
"   before running the code, or maybe even switch to a different compiler.
"
"   NOTE: Adding support for more programming languages
"
"   Just add another elseif block before the 'endif' statement in the same
"   way it is done in each case. Take care to add tabbed spaces after each
"   elseif block (similar to python). For example:
"
"   elseif &filetype == '<your_file_extension>'
"       exec '!<your_compiler> %'
"
"   NOTE: The '%' sign indicates the name of the currently open file with extension.
"         The time command displays the time taken for execution. Remove the
"         time command if you dont want the system to display the time
"
"=================================================================================

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
endif
endfunc
