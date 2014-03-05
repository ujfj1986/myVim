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

set tags=tags;
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
set statusline=%{CurDir()}/%f\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
nnoremap <silent> <Leader>l :exe "let m = matchadd('WildMenu','\\%" . line('.') . "l')"<CR>
nnoremap <silent> <Leader>w :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . line(".") . "l\\%" . col(".") . "c\\w*\\>')"<CR>
nnoremap <silent> <Leader>c :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . virtcol(".") . "v\\w*\\>')"<CR>
nnoremap <silent> <Leader><CR> :call clearmatches()<CR>
set splitright

nmap <buffer> <C-]> :let word=expand("<cword>")<CR><C-W>l:exe "tag" word<CR>
