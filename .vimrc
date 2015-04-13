"语法高亮
syntax enable
syntax on

colorscheme desert

"设置TLIST

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"设置WM
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

"设置GREP
nnoremap <silent> <F3> :Grep<CR>

"显示行号
set number

"设置鼠标功能
set mouse=a

"解决中文乱码问题
set fenc=chinese

"处理文本中显示乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
 set fileencoding=chinese
else
 set fileencoding=utf-8
endif

"处理菜单及右键菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
   
"处理consle输出乱码
language messages zh_CN.utf-8
"中文乱码结束

set hls

nnoremap <silent> <F12> :A<CR>

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

set autochdir

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 状态栏
set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
     let curdir = substitute(getcwd(), $HOME, "~", "g")
     return curdir
endfunction
""set statusline=%{CurDir()}/%f\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
nnoremap <silent> <Leader>l :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<CR>
nnoremap <silent> <Leader>w :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . line(".") . "l\\%" . col(".") . "c\\w*\\>')"<CR>
nnoremap <silent> <Leader>c :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . virtcol(".") . "v\\w*\\>')"<CR>
nnoremap <silent> <Leader><CR> :call clearmatches()<CR>
set splitright

nmap <buffer> <C-]> :let word=expand("<cword>")<CR><C-W>l:exe "tag" word<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 显示相关  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  

"winpos 5 5          " 设定窗口位置  

"set lines=40 columns=155    " 设定窗口大小  

"set nu              " 显示行号  

set go=             " 不要图形按钮  

"color asmanian2     " 设置背景主题  

set guifont=Courier_New:h10:cANSI   " 设置字体  

"syntax on           " 语法高亮  

autocmd InsertLeave * se nocul  " 用浅色高亮当前行  

autocmd InsertEnter * se cul    " 用浅色高亮当前行  

"set ruler           " 显示标尺  

set showcmd         " 输入的命令显示出来，看的清楚些  

"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  

"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  

"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  

set novisualbell    " 不要闪烁(不明白)  

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  

set foldenable      " 允许折叠  

set foldmethod=manual   " 手动折叠  

"set background=dark "背景使用黑色 

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示中文帮助

if version >= 603

    set helplang=cn

    set encoding=utf-8

endif

" 设置配色方案

"colorscheme murphy

"字体 

"if (has("gui_running")) 

"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 

"endif 


 
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

set termencoding=utf-8

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936

set fileencoding=utf-8



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新建.c,.h,.sh,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 

func SetTitle() 

    "如果文件类型为.sh文件 

    if &filetype == 'sh' 

        call setline(1,"\#########################################################################") 

        call append(line("."), "\# File Name: ".expand("%")) 

        call append(line(".")+1, "\# Author: Jiejing shan") 

        call append(line(".")+2, "\# mail: ujfj1986@163.com") 

        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 

        call append(line(".")+4, "\#########################################################################") 

        call append(line(".")+5, "\#!/bin/bash") 

        call append(line(".")+6, "") 

    else 

        call setline(1, "/*************************************************************************") 

        call append(line("."), "    > File Name: ".expand("%")) 

        call append(line(".")+1, "    > Author: Jiejing shan") 

        call append(line(".")+2, "    > Mail: ujfj1986@163.com ") 

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

endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"键盘命令

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



nmap <leader>w :w!<cr>

nmap <leader>f :find<cr>



" 映射全选+复制 ctrl+a

map <C-A> ggVGY

map! <C-A> <Esc>ggVGY

map <F12> gg=G

" 选中状态下 Ctrl+c 复制

vmap <C-c> "+y

"去空行  

nnoremap <F2> :g/^\s*$/d<CR> 

"比较文件  

nnoremap <C-F2> :vert diffsplit 

"新建标签  

map <M-F2> :tabnew<CR>  

"列出当前目录文件  

map <F3> :tabnew .<CR>  

"打开树状文件目录  

map <C-F3> \be  

"C，C++ 按F5编译运行

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

    exec "w"

    if &filetype == 'c'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'cpp'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'java' 

        exec "!javac %" 

        exec "!java %<"

    elseif &filetype == 'sh'

        :!./%

    endif

endfunc

"C,C++的调试

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "wa"

    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""实用设置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置当文件被改动时自动载入

set autoread

" quickfix模式

autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 

set completeopt=preview,menu 

"允许插件  

filetype plugin on

"共享剪贴板  

set clipboard+=unnamed 

"从不备份  

set nobackup

"make 运行

:set makeprg=g++\ -Wall\ \ %

"自动保存

set autowrite

set ruler                   " 打开状态栏标尺

set cursorline              " 突出显示当前行

set magic                   " 设置魔术

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏

"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 设置在状态行显示的信息

set foldcolumn=0

set foldmethod=indent 

set foldlevel=3 

set foldenable              " 开始折叠

" 不要使用vi的键盘模式，而是vim自己的

set nocompatible

" 语法高亮

set syntax=on

" 去掉输入错误的提示声音

set noeb

" 在处理未保存或只读文件的时候，弹出确认

set confirm

" 自动缩进

set autoindent

set cindent

" Tab键的宽度

set tabstop=4

" 统一缩进为4

set softtabstop=4

set shiftwidth=4

" 不要用空格代替制表符

set noexpandtab

" 在行和段开始处使用制表符

set smarttab

" 显示行号

set number

" 历史记录数

set history=1000

"禁止生成临时文件

set nobackup

set noswapfile

"搜索忽略大小写

set ignorecase

"搜索逐字符高亮

set hlsearch

set incsearch

"行内替换

set gdefault

"编码设置

set enc=utf-8

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置

set langmenu=zh_CN.UTF-8

set helplang=cn

" 我的状态行显示的内容（包括文件类型和解码）

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 总是显示状态行

set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2

""set cmdheight=2

" 侦测文件类型

filetype on

" 载入文件类型插件

filetype plugin on

" 为特定文件类型载入相关缩进文件

filetype indent on

" 保存全局变量

set viminfo+=!

" 带有如下符号的单词不要被换行分割

set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目

set linespace=0

" 增强模式中的命令行自动完成操作

set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等

set backspace=2

" 允许backspace和光标键跨越行边界

set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）

set mouse=a

set selection=exclusive

set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过

set report=0

" 在被分割的窗口间显示空白，便于阅读

set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号

set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）

set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离

set scrolloff=3

" 为C程序提供自动缩进

set smartindent

" 高亮显示普通txt文件（需要txt.vim脚本）

au BufRead,BufNewFile *  setfiletype txt

"自动补全

:inoremap ( ()<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {<CR>}<ESC>O

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

filetype plugin indent on 

"打开文件类型检测, 加了这句才可以用智能补全

set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags的设定  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Sort_Type = "name"    " 按照名称排序  

""let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  

let Tlist_Compart_Format = 1    " 压缩方式  

let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  

let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  

let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  

"autocmd FileType java set tags+=D:\tools\java\tags  

"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  

"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的

"设置tags  

set tags=tags  

"set autochdir 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"其他东东

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"默认打开Taglist 

""let Tlist_Auto_Open=1 

"""""""""""""""""""""""""""""" 

" Tag list (ctags) 

"""""""""""""""""""""""""""""""" 

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 

""let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 

""let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 

""let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

" minibufexpl插件的一般设置

let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplMapWindowNavArrows = 1

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" vimwiki
 
"     是否在词条文件保存时就输出html  这个会让保存大词条比较慢
"       所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,
"     现在没有修改html的格式，暂时把这两句注释掉
"
"    \ 'html_header': 'E:/My Dropbox/Public/vimwiki_template/header.htm',
"    \ 'html_footer': 'E:/My Dropbox/Public/vimwiki_template/footer.htm',
" 多个维基项目的配置
let g:vimwiki_list = [{'path': '/Users/shjj/vimwiki/work',
    \'path_html' : '/Users/shjj/vimwiki/html',
    \ 'diary_link_count': 5},
    \{ 'path': '/Users/shjj/vimwiki/life'}]
                                 
 " 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
 let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否开启按语法折叠  会让文件比较慢
let g:vimwiki_folding = 1

" 是否在计算字串长度时用特别考虑中文字符
 let g:vimwiki_CJK_length = 1
 
" 添加更多可识别的html标签
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

map <S-F4> :VimwikiAll2HTML<cr>
map <F4> :Vimwiki2HTML<cr>
