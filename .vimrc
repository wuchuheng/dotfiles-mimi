" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/nerdtree'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-scripts/AuthorInfo'
Plug 'matze/vim-move'
Plug 't9md/vim-choosewin'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'spf13/PIV'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'spf13/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-grepper'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'gregsexton/gitv'
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           插件 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree 配置
    let NERDTreeShowLineNumbers=1                   "Nerdtree插件 使用行号
    let NERDTreeWinPos="right"
    let NERDTreeChDirMode=1                         "Nerdtree插件 不改变根目录
    let NERDTreeShowHidden=1
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=1
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    "跳到NERDTree栏
    nnoremap <space>f :NERDTreeFind<CR>
    nnoremap <leader>e :NERDTreeToggle<CR>
    
"airline 配置
    let g:airline_powerline_fonts=1
    let g:airline_left_sep=''                      "airline插件  S›lightly fancier than '>'
    let g:airline_right_sep=''                     "airline插件  Sl‹ightly fancier than '<'
    let g:airline_letf_alt_sep = ''
    let g:airline_right_alt_sep = ''
    let g:aireline_symbols = {}
    let g:airline_symbols_branch = ''
    let g:airline_symbols_readonly = ''
    let g:airline#extensions#tabline#enabled = 1    "airline插件 启用顶部标签栏
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number


"EasyAlign 配置 
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    
"airline 主题配置

"状态栏配色
    let g:airline_theme='light'                     "状态栏主题

"easymoution 映射
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    "nmap s <Plug>(easymotion-overwin-f3)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

"tagbar 配置
let g:tagbar_left = 1       "右侧开启
nmap <leader>tt :TagbarToggle<CR>

"neocomplet 自动补全配置
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"ctrlp 配置
    let g:ctrlp_map = '<c-p>'            "当前目录查找
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_show_hidden = 1
    nmap <space>b :CtrlPBuffer<CR>
"matze/vim-move 配置
let g:move_key_modifier = 'C'

"choosewin 配置 
nmap  <space><space>  <Plug>(choosewin)

"grepper 配置
nmap <space>s :Grepper<CR>

"AuthorInfo 配置
let g:vimrc_author='wuchuheng'
let g:vimrc_email='wuchuheng@163.com'
let g:vimrc_homepage='http://www.wuchuheng.com'
nmap <F4> :AuthorInfoDetect<cr>

"gruvbox 配置  
colorscheme gruvbox
"let g:airline_theme='gruvbox'
let colorscheme_bg = "dark"

"""
""" ultisnips
"""
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""
"" stephpy/vim-php-cs-fixer
""
let g:php_cs_fixer_path = "~/dotfiles/php-cs-fixer" 
let g:php_cs_fixer_level = "laravel"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php" 
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0    
let g:php_cs_fixer_verbose = 0     
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

""" 
"""  scrooloose/nerdtree
""" 
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           参数 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','                             "指定leader键位
set bg=dark                                     "背景
let maplocalleader = '-'                        "指定local leader键位
set foldlevelstart=99                           " 打开文件是默认不折叠代码
set t_Co=256                                    "终端显示的颜色数量
set ignorecase                                  "查找忽略大小写
set smartcase                                   "查找大小写自动识别
set autoindent                                  "自动缩进
set softtabstop=4 shiftwidth=4 sw=4 et          "tab 4空格
set incsearch                                   "查找高亮
set hlsearch                                    "查找结果高亮
set number 					"行号
set fileformat=unix                             "文件格式
set encoding=utf-8                              "编码格式
set nobomb                                      "无bom格式
set wrap                                        "自动换行显示 
set history=200                                 "历史记录量
syntax on                                       "启用语法高亮
set relativenumber                            "相对行号
set mouse=a                                     "支持鼠标
set hidden                                      "隐藏当前缓冲区禁用提示
set spell                                       "启用字典
set spelllang=en_us                             "默认英文字典
set backupcopy=yes                              "docker挂载文件保存生效
set nowrap                                      "不折行
set cc=80                                       "80列宽度标尺
"et paste                                       "粘贴不排版不乱
cnoremap <c-n> <down>                           
cnoremap <c-p> <up>
nmap <space>' :term<CR>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nmap <Up> <C-w>+
nmap <Down> <C-w>-
nmap <Left> :winc <<CR>
nmap <right> :winc ><CR>
nmap tc :pclose<CR>
nmap ts <c-w>}
nmap <c-t>s <c-w>]
nmap tn :tnext<CR>
nmap tp :tprev<CR>
nmap tl :tlast<CR>
"g<c-]> 说明 https://xu3352.github.io/linux/2018/12/16/practical-vim-skills-chapter-16
set undodir=~/dotfiles/.undo/
set backupdir=~/dotfiles/.backup/
set undofile
set directory=~/dotfiles/.swp/
"set viminfo
"syntime on
"set nobackup
"set noswapfile
set cin                                           "C语言缩进
set helplang=cn
set autoindent                                    "自动缩进
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           nnoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F12 切换php语法高亮
nnoremap <F12> :set syntax=php<CR>              
"[b buffer上一文件
nnoremap <silent> [b : bprevious<CR>            
"]b buffer下一文件
nnoremap <silent> ]b : bnext<CR>                
"[B buffer头文件
nnoremap <silent> [B : bfirst<CR>               
"]B buffer尾文件
nnoremap <silent> ]B : blast<CR>                
"[a 列表参数上一文件
nnoremap <silent> [a : prev<CR>                 
"]a 列表参数下一文件
nnoremap <silent> ]a : next<cr>                 
"[A 列表参数头文件
nnoremap <silent> [A : first<C-R>               
"]A 列表参数尾文件
nnoremap <silent> ]A : last<C-R>                
"临时关闭高亮快捷键映射
map <silent><space>l :<C-u>nohlsearch<CR>
"&命令修正
nnoremap & :&&<CR>                              
"ctags F5刷新
nnoremap <f5> :! ctags -R --languages=php ./<CR>                     
"选择窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>a <C-c>:tab split<CR>
nnoremap <Leader>m :make<cr>
"跳转到第n个标签页面
nnoremap <leader>1 :1tabnext<cr>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>
"tab窗口号移动
nnoremap t1 :tabmove 0<CR>
nnoremap t2 :tabmove 1<CR>
nnoremap t3 :tabmove 2<CR>
nnoremap t4 :tabmove 3<CR>
nnoremap t5 :tabmove 4<CR>
nnoremap t6 :tabmove 5<CR>
nnoremap t7 :tabmove 6<CR>
nnoremap t8 :tabmove 7<CR>
nnoremap t9 :tabmove 8<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            sldf njjsadk;lfj                xnoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"&命令修正
xnoremap & :&&<CR> 
"查找当前选中快捷键映射
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR> 
"查找当前选中快捷键映射
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR> 




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           inoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap  ~php <CR>/**<CR>*<CR>* @author    wuchuheng<CR>* @email    root@wuchuheng.com<CR>*<CR>**/<CR>
"插入模式向前移动一个长词
inoremap <C-E> <C-c>Ea                          
"插入模式向前移动一个词
inoremap <C-e> <C-c>ea                          
"插入模式向后移动一个长词
inoremap <C-b> <C-c>ba                          
"插入模式向后移动一个长词
inoremap <C-B> <C-c>Ba                          
"单词转大写
inoremap <C-u> <C-c>vawgUi
"行尾加分号; 
inoremap <C-;> <C-c>A;<C-c>g;i





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           onoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"操作映射
"操作"删除下一个括号内字符
onoremap in( :<c-u>normal! f(vi(<cr>            
"删除上一个括号内字符
onoremap il( :<c-u>normal! F)vi(<cr>            
"删除markdown上一个标题
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr> 
"删除markdown上一个标题和等号
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType sh : iabbrev <buffer>if if [  ]<left><left> "sh脚本if判断自动补全中括号 
"autocmd FileType php : call MakeConfPHP()<CR>                "php编译
"记住上次打开的位置
if has("autocmd")                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           自定义函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""
" @info 查找当前选中
""
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

""
" @info php make 配置
""
function! MakeConfPHP()
   setlocal makeprg=php\ %
endfunction

""
" @info 来源声明
"
"function! Ggi()
"    "php 声明
"    "inoremap  ~php <CR>/**<CR>*<CR>* @author    root<CR>* @email     root@163.com<CR>*<CR>**/<CR>     "php程序头部声明
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=tags.vendor
"autocmd BufWritePost *.php silent execute \"!ctags -R --languages=php --fields=+lS ./"
set autoindent                                    "自动缩进



"  matchit.vim: (global plugin) Extended "%" matching
"  Last Change: Fri Jan 25 10:00 AM 2008 EST
"  Maintainer:  Benji Fisher PhD   <benji@member.AMS.org>
"  Version:     1.13.2, for Vim 6.3+
"  URL:		http://www.vim.org/script.php?script_id=39

" Documentation:
"  The documentation is in a separate file, matchit.txt .

" Credits:
"  Vim editor by Bram Moolenaar (Thanks, Bram!)
"  Original script and design by Raul Segura Acevedo
"  Support for comments by Douglas Potts
"  Support for back references and other improvements by Benji Fisher
"  Support for many languages by Johannes Zellner
"  Suggestions for improvement, bug reports, and support for additional
"  languages by Jordi-Albert Batalla, Neil Bird, Servatius Brandt, Mark
"  Collett, Stephen Wall, Dany St-Amant, Yuheng Xie, and Johannes Zellner.

" Debugging:
"  If you'd like to try the built-in debugging commands...
"   :MatchDebug      to activate debugging for the current buffer
"  This saves the values of several key script variables as buffer-local
"  variables.  See the MatchDebug() function, below, for details.

" TODO:  I should think about multi-line patterns for b:match_words.
"   This would require an option:  how many lines to scan (default 1).
"   This would be useful for Python, maybe also for *ML.
" TODO:  Maybe I should add a menu so that people will actually use some of
"   the features that I have implemented.
" TODO:  Eliminate the MultiMatch function.  Add yet another argument to
"   Match_wrapper() instead.
" TODO:  Allow :let b:match_words = '\(\(foo\)\(bar\)\):\3\2:end\1'
" TODO:  Make backrefs safer by using '\V' (very no-magic).
" TODO:  Add a level of indirection, so that custom % scripts can use my
"   work but extend it.

" allow user to prevent loading
" and prevent duplicate loading
if exists("loaded_matchit") || &cp
  finish
endif
let loaded_matchit = 1
let s:last_mps = ""
let s:last_words = ":"

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> %  :<C-U>call <SID>Match_wrapper('',1,'n') <CR>
nnoremap <silent> g% :<C-U>call <SID>Match_wrapper('',0,'n') <CR>
vnoremap <silent> %  :<C-U>call <SID>Match_wrapper('',1,'v') <CR>m'gv``
vnoremap <silent> g% :<C-U>call <SID>Match_wrapper('',0,'v') <CR>m'gv``
onoremap <silent> %  v:<C-U>call <SID>Match_wrapper('',1,'o') <CR>
onoremap <silent> g% v:<C-U>call <SID>Match_wrapper('',0,'o') <CR>

" Analogues of [{ and ]} using matching patterns:
nnoremap <silent> [% :<C-U>call <SID>MultiMatch("bW", "n") <CR>
nnoremap <silent> ]% :<C-U>call <SID>MultiMatch("W",  "n") <CR>
vmap [% <Esc>[%m'gv``
vmap ]% <Esc>]%m'gv``
" vnoremap <silent> [% :<C-U>call <SID>MultiMatch("bW", "v") <CR>m'gv``
" vnoremap <silent> ]% :<C-U>call <SID>MultiMatch("W",  "v") <CR>m'gv``
onoremap <silent> [% v:<C-U>call <SID>MultiMatch("bW", "o") <CR>
onoremap <silent> ]% v:<C-U>call <SID>MultiMatch("W",  "o") <CR>

" text object:
vmap a% <Esc>[%v]%

" Auto-complete mappings:  (not yet "ready for prime time")
" TODO Read :help write-plugin for the "right" way to let the user
" specify a key binding.
"   let g:match_auto = '<C-]>'
"   let g:match_autoCR = '<C-CR>'
" if exists("g:match_auto")
"   execute "inoremap " . g:match_auto . ' x<Esc>"=<SID>Autocomplete()<CR>Pls'
" endif
" if exists("g:match_autoCR")
"   execute "inoremap " . g:match_autoCR . ' <CR><C-R>=<SID>Autocomplete()<CR>'
" endif
" if exists("g:match_gthhoh")
"   execute "inoremap " . g:match_gthhoh . ' <C-O>:call <SID>Gthhoh()<CR>'
" endif " gthhoh = "Get the heck out of here!"

let s:notslash = '\\\@<!\%(\\\\\)*'

function! s:Match_wrapper(word, forward, mode) range
  " In s:CleanUp(), :execute "set" restore_options .
  let restore_options = (&ic ? " " : " no") . "ignorecase"
  if exists("b:match_ignorecase")
    let &ignorecase = b:match_ignorecase
  endif
  let restore_options = " ve=" . &ve . restore_options
  set ve=
  " If this function was called from Visual mode, make sure that the cursor
  " is at the correct end of the Visual range:
  if a:mode == "v"
    execute "normal! gv\<Esc>"
  endif
  " In s:CleanUp(), we may need to check whether the cursor moved forward.
  let startline = line(".")
  let startcol = col(".")
  " Use default behavior if called with a count.
  if v:count
    exe "normal! " . v:count . "%"
    return s:CleanUp(restore_options, a:mode, startline, startcol)
  end

  " First step:  if not already done, set the script variables
  "   s:do_BR	flag for whether there are backrefs
  "   s:pat	parsed version of b:match_words
  "   s:all	regexp based on s:pat and the default groups
  "
  if !exists("b:match_words") || b:match_words == ""
    let match_words = ""
    " Allow b:match_words = "GetVimMatchWords()" .
  elseif b:match_words =~ ":"
    let match_words = b:match_words
  else
    execute "let match_words =" b:match_words
  endif
  let default = escape(&mps, '[$^.*~\\/?]') . (strlen(&mps) ? "," : "") .
    \ '\/\*:\*\/,#if\%(def\)\=:#else\>:#elif\>:#endif\>'
  let match_words = match_words . (strlen(match_words) ? "," : "") . default
" Thanks to Preben "Peppe" Guldberg and Bram Moolenaar for this suggestion!
  if (match_words != s:last_words) || (&mps != s:last_mps) ||
    \ exists("b:match_debug")
    let s:last_words = match_words
    let s:last_mps = &mps
    " The next several lines were here before
    " BF started messing with this script.
    " quote the special chars in 'matchpairs', replace [,:] with \| and then
    " append the builtin pairs (/*, */, #if, #ifdef, #else, #elif, #endif)
    " let default = substitute(escape(&mps, '[$^.*~\\/?]'), '[,:]\+',
    "  \ '\\|', 'g').'\|\/\*\|\*\/\|#if\>\|#ifdef\>\|#else\>\|#elif\>\|#endif\>'
    " s:all = pattern with all the keywords
    if match_words !~ s:notslash . '\\\d'
      let s:do_BR = 0
      let s:pat = match_words
    else
      let s:do_BR = 1
      let s:pat = s:ParseWords(match_words)
    endif
    let s:all = substitute(s:pat, s:notslash . '\zs[,:]\+', '\\|', 'g')
    let s:all = '\%(' . s:all . '\)'
    " let s:all = '\%(' . substitute(s:all, '\\\ze[,:]', '', 'g') . '\)'
    if exists("b:match_debug")
      let b:match_pat = s:pat
    endif
  endif

  " Second step:  set the following local variables:
  "     matchline = line on which the cursor started
  "     curcol    = number of characters before match
  "     prefix    = regexp for start of line to start of match
  "     suffix    = regexp for end of match to end of line
  " Require match to end on or after the cursor and prefer it to
  " start on or before the cursor.
  let matchline = getline(startline)
  if a:word != ''
    " word given
    if a:word !~ s:all
      echohl WarningMsg|echo 'Missing rule for word:"'.a:word.'"'|echohl NONE
      return s:CleanUp(restore_options, a:mode, startline, startcol)
    endif
    let matchline = a:word
    let curcol = 0
    let prefix = '^\%('
    let suffix = '\)$'
  " Now the case when "word" is not given
  else	" Find the match that ends on or after the cursor and set curcol.
    let regexp = s:Wholematch(matchline, s:all, startcol-1)
    let curcol = match(matchline, regexp)
    " If there is no match, give up.
    if curcol == -1
      return s:CleanUp(restore_options, a:mode, startline, startcol)
    endif
    let endcol = matchend(matchline, regexp)
    let suf = strlen(matchline) - endcol
    let prefix = (curcol ? '^.*\%'  . (curcol + 1) . 'c\%(' : '^\%(')
    let suffix = (suf ? '\)\%' . (endcol + 1) . 'c.*$'  : '\)$')
  endif
  if exists("b:match_debug")
    let b:match_match = matchstr(matchline, regexp)
    let b:match_col = curcol+1
  endif

  " Third step:  Find the group and single word that match, and the original
  " (backref) versions of these.  Then, resolve the backrefs.
  " Set the following local variable:
  " group = colon-separated list of patterns, one of which matches
  "       = ini:mid:fin or ini:fin
  "
  " Reconstruct the version with unresolved backrefs.
  let patBR = substitute(match_words.',',
    \ s:notslash.'\zs[,:]*,[,:]*', ',', 'g')
  let patBR = substitute(patBR, s:notslash.'\zs:\{2,}', ':', 'g')
  " Now, set group and groupBR to the matching group: 'if:endif' or
  " 'while:endwhile' or whatever.  A bit of a kluge:  s:Choose() returns
  " group . "," . groupBR, and we pick it apart.
  let group = s:Choose(s:pat, matchline, ",", ":", prefix, suffix, patBR)
  let i = matchend(group, s:notslash . ",")
  let groupBR = strpart(group, i)
  let group = strpart(group, 0, i-1)
  " Now, matchline =~ prefix . substitute(group,':','\|','g') . suffix
  if s:do_BR " Do the hard part:  resolve those backrefs!
    let group = s:InsertRefs(groupBR, prefix, group, suffix, matchline)
  endif
  if exists("b:match_debug")
    let b:match_wholeBR = groupBR
    let i = matchend(groupBR, s:notslash . ":")
    let b:match_iniBR = strpart(groupBR, 0, i-1)
  endif

  " Fourth step:  Set the arguments for searchpair().
  let i = matchend(group, s:notslash . ":")
  let j = matchend(group, '.*' . s:notslash . ":")
  let ini = strpart(group, 0, i-1)
  let mid = substitute(strpart(group, i,j-i-1), s:notslash.'\zs:', '\\|', 'g')
  let fin = strpart(group, j)
  "Un-escape the remaining , and : characters.
  let ini = substitute(ini, s:notslash . '\zs\\\(:\|,\)', '\1', 'g')
  let mid = substitute(mid, s:notslash . '\zs\\\(:\|,\)', '\1', 'g')
  let fin = substitute(fin, s:notslash . '\zs\\\(:\|,\)', '\1', 'g')
  " searchpair() requires that these patterns avoid \(\) groups.
  let ini = substitute(ini, s:notslash . '\zs\\(', '\\%(', 'g')
  let mid = substitute(mid, s:notslash . '\zs\\(', '\\%(', 'g')
  let fin = substitute(fin, s:notslash . '\zs\\(', '\\%(', 'g')
  " Set mid.  This is optimized for readability, not micro-efficiency!
  if a:forward && matchline =~ prefix . fin . suffix
    \ || !a:forward && matchline =~ prefix . ini . suffix
    let mid = ""
  endif
  " Set flag.  This is optimized for readability, not micro-efficiency!
  if a:forward && matchline =~ prefix . fin . suffix
    \ || !a:forward && matchline !~ prefix . ini . suffix
    let flag = "bW"
  else
    let flag = "W"
  endif
  " Set skip.
  if exists("b:match_skip")
    let skip = b:match_skip
  elseif exists("b:match_comment") " backwards compatibility and testing!
    let skip = "r:" . b:match_comment
  else
    let skip = 's:comment\|string'
  endif
  let skip = s:ParseSkip(skip)
  if exists("b:match_debug")
    let b:match_ini = ini
    let b:match_tail = (strlen(mid) ? mid.'\|' : '') . fin
  endif

  " Fifth step:  actually start moving the cursor and call searchpair().
  " Later, :execute restore_cursor to get to the original screen.
  let restore_cursor = virtcol(".") . "|"
  normal! g0
  let restore_cursor = line(".") . "G" .  virtcol(".") . "|zs" . restore_cursor
  normal! H
  let restore_cursor = "normal!" . line(".") . "Gzt" . restore_cursor
  execute restore_cursor
  call cursor(0, curcol + 1)
  " normal! 0
  " if curcol
  "   execute "normal!" . curcol . "l"
  " endif
  if skip =~ 'synID' && !(has("syntax") && exists("g:syntax_on"))
    let skip = "0"
  else
    execute "if " . skip . "| let skip = '0' | endif"
  endif
  let sp_return = searchpair(ini, mid, fin, flag, skip)
  let final_position = "call cursor(" . line(".") . "," . col(".") . ")"
  " Restore cursor position and original screen.
  execute restore_cursor
  normal! m'
  if sp_return > 0
    execute final_position
  endif
  return s:CleanUp(restore_options, a:mode, startline, startcol, mid.'\|'.fin)
endfun

" Restore options and do some special handling for Operator-pending mode.
" The optional argument is the tail of the matching group.
fun! s:CleanUp(options, mode, startline, startcol, ...)
  execute "set" a:options
  " Open folds, if appropriate.
  if a:mode != "o"
    if &foldopen =~ "percent"
      normal! zv
    endif
    " In Operator-pending mode, we want to include the whole match
    " (for example, d%).
    " This is only a problem if we end up moving in the forward direction.
  elseif (a:startline < line(".")) ||
	\ (a:startline == line(".") && a:startcol < col("."))
    if a:0
      " Check whether the match is a single character.  If not, move to the
      " end of the match.
      let matchline = getline(".")
      let currcol = col(".")
      let regexp = s:Wholematch(matchline, a:1, currcol-1)
      let endcol = matchend(matchline, regexp)
      if endcol > currcol  " This is NOT off by one!
	execute "normal!" . (endcol - currcol) . "l"
      endif
    endif " a:0
  endif " a:mode != "o" && etc.
  return 0
endfun

" Example (simplified HTML patterns):  if
"   a:groupBR	= '<\(\k\+\)>:</\1>'
"   a:prefix	= '^.\{3}\('
"   a:group	= '<\(\k\+\)>:</\(\k\+\)>'
"   a:suffix	= '\).\{2}$'
"   a:matchline	=  "123<tag>12" or "123</tag>12"
" then extract "tag" from a:matchline and return "<tag>:</tag>" .
fun! s:InsertRefs(groupBR, prefix, group, suffix, matchline)
  if a:matchline !~ a:prefix .
    \ substitute(a:group, s:notslash . '\zs:', '\\|', 'g') . a:suffix
    return a:group
  endif
  let i = matchend(a:groupBR, s:notslash . ':')
  let ini = strpart(a:groupBR, 0, i-1)
  let tailBR = strpart(a:groupBR, i)
  let word = s:Choose(a:group, a:matchline, ":", "", a:prefix, a:suffix,
    \ a:groupBR)
  let i = matchend(word, s:notslash . ":")
  let wordBR = strpart(word, i)
  let word = strpart(word, 0, i-1)
  " Now, a:matchline =~ a:prefix . word . a:suffix
  if wordBR != ini
    let table = s:Resolve(ini, wordBR, "table")
  else
    " let table = "----------"
    let table = ""
    let d = 0
    while d < 10
      if tailBR =~ s:notslash . '\\' . d
	" let table[d] = d
	let table = table . d
      else
	let table = table . "-"
      endif
      let d = d + 1
    endwhile
  endif
  let d = 9
  while d
    if table[d] != "-"
      let backref = substitute(a:matchline, a:prefix.word.a:suffix,
	\ '\'.table[d], "")
	" Are there any other characters that should be escaped?
      let backref = escape(backref, '*,:')
      execute s:Ref(ini, d, "start", "len")
      let ini = strpart(ini, 0, start) . backref . strpart(ini, start+len)
      let tailBR = substitute(tailBR, s:notslash . '\zs\\' . d,
	\ escape(backref, '\\'), 'g')
    endif
    let d = d-1
  endwhile
  if exists("b:match_debug")
    if s:do_BR
      let b:match_table = table
      let b:match_word = word
    else
      let b:match_table = ""
      let b:match_word = ""
    endif
  endif
  return ini . ":" . tailBR
endfun

" Input a comma-separated list of groups with backrefs, such as
"   a:groups = '\(foo\):end\1,\(bar\):end\1'
" and return a comma-separated list of groups with backrefs replaced:
"   return '\(foo\):end\(foo\),\(bar\):end\(bar\)'
fun! s:ParseWords(groups)
  let groups = substitute(a:groups.",", s:notslash.'\zs[,:]*,[,:]*', ',', 'g')
  let groups = substitute(groups, s:notslash . '\zs:\{2,}', ':', 'g')
  let parsed = ""
  while groups =~ '[^,:]'
    let i = matchend(groups, s:notslash . ':')
    let j = matchend(groups, s:notslash . ',')
    let ini = strpart(groups, 0, i-1)
    let tail = strpart(groups, i, j-i-1) . ":"
    let groups = strpart(groups, j)
    let parsed = parsed . ini
    let i = matchend(tail, s:notslash . ':')
    while i != -1
      " In 'if:else:endif', ini='if' and word='else' and then word='endif'.
      let word = strpart(tail, 0, i-1)
      let tail = strpart(tail, i)
      let i = matchend(tail, s:notslash . ':')
      let parsed = parsed . ":" . s:Resolve(ini, word, "word")
    endwhile " Now, tail has been used up.
    let parsed = parsed . ","
  endwhile " groups =~ '[^,:]'
  let parsed = substitute(parsed, ',$', '', '')
  return parsed
endfun

" TODO I think this can be simplified and/or made more efficient.
" TODO What should I do if a:start is out of range?
" Return a regexp that matches all of a:string, such that
" matchstr(a:string, regexp) represents the match for a:pat that starts
" as close to a:start as possible, before being preferred to after, and
" ends after a:start .
" Usage:
" let regexp = s:Wholematch(getline("."), 'foo\|bar', col(".")-1)
" let i      = match(getline("."), regexp)
" let j      = matchend(getline("."), regexp)
" let match  = matchstr(getline("."), regexp)
fun! s:Wholematch(string, pat, start)
  let group = '\%(' . a:pat . '\)'
  let prefix = (a:start ? '\(^.*\%<' . (a:start + 2) . 'c\)\zs' : '^')
  let len = strlen(a:string)
  let suffix = (a:start+1 < len ? '\(\%>'.(a:start+1).'c.*$\)\@=' : '$')
  if a:string !~ prefix . group . suffix
    let prefix = ''
  endif
  return prefix . group . suffix
endfun

" No extra arguments:  s:Ref(string, d) will
" find the d'th occurrence of '\(' and return it, along with everything up
" to and including the matching '\)'.
" One argument:  s:Ref(string, d, "start") returns the index of the start
" of the d'th '\(' and any other argument returns the length of the group.
" Two arguments:  s:Ref(string, d, "foo", "bar") returns a string to be
" executed, having the effect of
"   :let foo = s:Ref(string, d, "start")
"   :let bar = s:Ref(string, d, "len")
fun! s:Ref(string, d, ...)
  let len = strlen(a:string)
  if a:d == 0
    let start = 0
  else
    let cnt = a:d
    let match = a:string
    while cnt
      let cnt = cnt - 1
      let index = matchend(match, s:notslash . '\\(')
      if index == -1
	return ""
      endif
      let match = strpart(match, index)
    endwhile
    let start = len - strlen(match)
    if a:0 == 1 && a:1 == "start"
      return start - 2
    endif
    let cnt = 1
    while cnt
      let index = matchend(match, s:notslash . '\\(\|\\)') - 1
      if index == -2
	return ""
      endif
      " Increment if an open, decrement if a ')':
      let cnt = cnt + (match[index]=="(" ? 1 : -1)  " ')'
      " let cnt = stridx('0(', match[index]) + cnt
      let match = strpart(match, index+1)
    endwhile
    let start = start - 2
    let len = len - start - strlen(match)
  endif
  if a:0 == 1
    return len
  elseif a:0 == 2
    return "let " . a:1 . "=" . start . "| let " . a:2 . "=" . len
  else
    return strpart(a:string, start, len)
  endif
endfun

" Count the number of disjoint copies of pattern in string.
" If the pattern is a literal string and contains no '0' or '1' characters
" then s:Count(string, pattern, '0', '1') should be faster than
" s:Count(string, pattern).
fun! s:Count(string, pattern, ...)
  let pat = escape(a:pattern, '\\')
  if a:0 > 1
    let foo = substitute(a:string, '[^'.a:pattern.']', "a:1", "g")
    let foo = substitute(a:string, pat, a:2, "g")
    let foo = substitute(foo, '[^' . a:2 . ']', "", "g")
    return strlen(foo)
  endif
  let result = 0
  let foo = a:string
  let index = matchend(foo, pat)
  while index != -1
    let result = result + 1
    let foo = strpart(foo, index)
    let index = matchend(foo, pat)
  endwhile
  return result
endfun

" s:Resolve('\(a\)\(b\)', '\(c\)\2\1\1\2') should return table.word, where
" word = '\(c\)\(b\)\(a\)\3\2' and table = '-32-------'.  That is, the first
" '\1' in target is replaced by '\(a\)' in word, table[1] = 3, and this
" indicates that all other instances of '\1' in target are to be replaced
" by '\3'.  The hard part is dealing with nesting...
" Note that ":" is an illegal character for source and target,
" unless it is preceded by "\".
fun! s:Resolve(source, target, output)
  let word = a:target
  let i = matchend(word, s:notslash . '\\\d') - 1
  let table = "----------"
  while i != -2 " There are back references to be replaced.
    let d = word[i]
    let backref = s:Ref(a:source, d)
    " The idea is to replace '\d' with backref.  Before we do this,
    " replace any \(\) groups in backref with :1, :2, ... if they
    " correspond to the first, second, ... group already inserted
    " into backref.  Later, replace :1 with \1 and so on.  The group
    " number w+b within backref corresponds to the group number
    " s within a:source.
    " w = number of '\(' in word before the current one
    let w = s:Count(
    \ substitute(strpart(word, 0, i-1), '\\\\', '', 'g'), '\(', '1')
    let b = 1 " number of the current '\(' in backref
    let s = d " number of the current '\(' in a:source
    while b <= s:Count(substitute(backref, '\\\\', '', 'g'), '\(', '1')
    \ && s < 10
      if table[s] == "-"
	if w + b < 10
	  " let table[s] = w + b
	  let table = strpart(table, 0, s) . (w+b) . strpart(table, s+1)
	endif
	let b = b + 1
	let s = s + 1
      else
	execute s:Ref(backref, b, "start", "len")
	let ref = strpart(backref, start, len)
	let backref = strpart(backref, 0, start) . ":". table[s]
	\ . strpart(backref, start+len)
	let s = s + s:Count(substitute(ref, '\\\\', '', 'g'), '\(', '1')
      endif
    endwhile
    let word = strpart(word, 0, i-1) . backref . strpart(word, i+1)
    let i = matchend(word, s:notslash . '\\\d') - 1
  endwhile
  let word = substitute(word, s:notslash . '\zs:', '\\', 'g')
  if a:output == "table"
    return table
  elseif a:output == "word"
    return word
  else
    return table . word
  endif
endfun

" Assume a:comma = ",".  Then the format for a:patterns and a:1 is
"   a:patterns = "<pat1>,<pat2>,..."
"   a:1 = "<alt1>,<alt2>,..."
" If <patn> is the first pattern that matches a:string then return <patn>
" if no optional arguments are given; return <patn>,<altn> if a:1 is given.
fun! s:Choose(patterns, string, comma, branch, prefix, suffix, ...)
  let tail = (a:patterns =~ a:comma."$" ? a:patterns : a:patterns . a:comma)
  let i = matchend(tail, s:notslash . a:comma)
  if a:0
    let alttail = (a:1 =~ a:comma."$" ? a:1 : a:1 . a:comma)
    let j = matchend(alttail, s:notslash . a:comma)
  endif
  let current = strpart(tail, 0, i-1)
  if a:branch == ""
    let currpat = current
  else
    let currpat = substitute(current, s:notslash . a:branch, '\\|', 'g')
  endif
  while a:string !~ a:prefix . currpat . a:suffix
    let tail = strpart(tail, i)
    let i = matchend(tail, s:notslash . a:comma)
    if i == -1
      return -1
    endif
    let current = strpart(tail, 0, i-1)
    if a:branch == ""
      let currpat = current
    else
      let currpat = substitute(current, s:notslash . a:branch, '\\|', 'g')
    endif
    if a:0
      let alttail = strpart(alttail, j)
      let j = matchend(alttail, s:notslash . a:comma)
    endif
  endwhile
  if a:0
    let current = current . a:comma . strpart(alttail, 0, j-1)
  endif
  return current
endfun

" Call this function to turn on debugging information.  Every time the main
" script is run, buffer variables will be saved.  These can be used directly
" or viewed using the menu items below.
if !exists(":MatchDebug")
  command! -nargs=0 MatchDebug call s:Match_debug()
endif

fun! s:Match_debug()
  let b:match_debug = 1	" Save debugging information.
  " pat = all of b:match_words with backrefs parsed
  amenu &Matchit.&pat	:echo b:match_pat<CR>
  " match = bit of text that is recognized as a match
  amenu &Matchit.&match	:echo b:match_match<CR>
  " curcol = cursor column of the start of the matching text
  amenu &Matchit.&curcol	:echo b:match_col<CR>
  " wholeBR = matching group, original version
  amenu &Matchit.wh&oleBR	:echo b:match_wholeBR<CR>
  " iniBR = 'if' piece, original version
  amenu &Matchit.ini&BR	:echo b:match_iniBR<CR>
  " ini = 'if' piece, with all backrefs resolved from match
  amenu &Matchit.&ini	:echo b:match_ini<CR>
  " tail = 'else\|endif' piece, with all backrefs resolved from match
  amenu &Matchit.&tail	:echo b:match_tail<CR>
  " fin = 'endif' piece, with all backrefs resolved from match
  amenu &Matchit.&word	:echo b:match_word<CR>
  " '\'.d in ini refers to the same thing as '\'.table[d] in word.
  amenu &Matchit.t&able	:echo '0:' . b:match_table . ':9'<CR>
endfun

" Jump to the nearest unmatched "(" or "if" or "<tag>" if a:spflag == "bW"
" or the nearest unmatched "</tag>" or "endif" or ")" if a:spflag == "W".
" Return a "mark" for the original position, so that
"   let m = MultiMatch("bW", "n") ... execute m
" will return to the original position.  If there is a problem, do not
" move the cursor and return "", unless a count is given, in which case
" go up or down as many levels as possible and again return "".
" TODO This relies on the same patterns as % matching.  It might be a good
" idea to give it its own matching patterns.
fun! s:MultiMatch(spflag, mode)
  if !exists("b:match_words") || b:match_words == ""
    return ""
  end
  let restore_options = (&ic ? "" : "no") . "ignorecase"
  if exists("b:match_ignorecase")
    let &ignorecase = b:match_ignorecase
  endif
  let startline = line(".")
  let startcol = col(".")

  " First step:  if not already done, set the script variables
  "   s:do_BR	flag for whether there are backrefs
  "   s:pat	parsed version of b:match_words
  "   s:all	regexp based on s:pat and the default groups
  " This part is copied and slightly modified from s:Match_wrapper().
  let default = escape(&mps, '[$^.*~\\/?]') . (strlen(&mps) ? "," : "") .
    \ '\/\*:\*\/,#if\%(def\)\=:#else\>:#elif\>:#endif\>'
  " Allow b:match_words = "GetVimMatchWords()" .
  if b:match_words =~ ":"
    let match_words = b:match_words
  else
    execute "let match_words =" b:match_words
  endif
  let match_words = match_words . (strlen(match_words) ? "," : "") . default
  if (match_words != s:last_words) || (&mps != s:last_mps) ||
    \ exists("b:match_debug")
    let s:last_words = match_words
    let s:last_mps = &mps
    if match_words !~ s:notslash . '\\\d'
      let s:do_BR = 0
      let s:pat = match_words
    else
      let s:do_BR = 1
      let s:pat = s:ParseWords(match_words)
    endif
    let s:all = '\%(' . substitute(s:pat . (strlen(s:pat)?",":"") . default,
      \	'[,:]\+','\\|','g') . '\)'
    if exists("b:match_debug")
      let b:match_pat = s:pat
    endif
  endif

  " Second step:  figure out the patterns for searchpair()
  " and save the screen, cursor position, and 'ignorecase'.
  " - TODO:  A lot of this is copied from s:Match_wrapper().
  " - maybe even more functionality should be split off
  " - into separate functions!
  let cdefault = (s:pat =~ '[^,]$' ? "," : "") . default
  let open =  substitute(s:pat . cdefault,
	\ s:notslash . '\zs:.\{-}' . s:notslash . ',', '\\),\\(', 'g')
  let open =  '\(' . substitute(open, s:notslash . '\zs:.*$', '\\)', '')
  let close = substitute(s:pat . cdefault,
	\ s:notslash . '\zs,.\{-}' . s:notslash . ':', '\\),\\(', 'g')
  let close = substitute(close, '^.\{-}' . s:notslash . ':', '\\(', '') . '\)'
  if exists("b:match_skip")
    let skip = b:match_skip
  elseif exists("b:match_comment") " backwards compatibility and testing!
    let skip = "r:" . b:match_comment
  else
    let skip = 's:comment\|string'
  endif
  let skip = s:ParseSkip(skip)
  " let restore_cursor = line(".") . "G" . virtcol(".") . "|"
  " normal! H
  " let restore_cursor = "normal!" . line(".") . "Gzt" . restore_cursor
  let restore_cursor = virtcol(".") . "|"
  normal! g0
  let restore_cursor = line(".") . "G" .  virtcol(".") . "|zs" . restore_cursor
  normal! H
  let restore_cursor = "normal!" . line(".") . "Gzt" . restore_cursor
  execute restore_cursor

  " Third step: call searchpair().
  " Replace '\('--but not '\\('--with '\%(' and ',' with '\|'.
  let openpat =  substitute(open, '\(\\\@<!\(\\\\\)*\)\@<=\\(', '\\%(', 'g')
  let openpat = substitute(openpat, ',', '\\|', 'g')
  let closepat = substitute(close, '\(\\\@<!\(\\\\\)*\)\@<=\\(', '\\%(', 'g')
  let closepat = substitute(closepat, ',', '\\|', 'g')
  if skip =~ 'synID' && !(has("syntax") && exists("g:syntax_on"))
    let skip = '0'
  else
    execute "if " . skip . "| let skip = '0' | endif"
  endif
  mark '
  let level = v:count1
  while level
    if searchpair(openpat, '', closepat, a:spflag, skip) < 1
      call s:CleanUp(restore_options, a:mode, startline, startcol)
      return ""
    endif
    let level = level - 1
  endwhile

  " Restore options and return a string to restore the original position.
  call s:CleanUp(restore_options, a:mode, startline, startcol)
  return restore_cursor
endfun

" Search backwards for "if" or "while" or "<tag>" or ...
" and return "endif" or "endwhile" or "</tag>" or ... .
" For now, this uses b:match_words and the same script variables
" as s:Match_wrapper() .  Later, it may get its own patterns,
" either from a buffer variable or passed as arguments.
" fun! s:Autocomplete()
"   echo "autocomplete not yet implemented :-("
"   if !exists("b:match_words") || b:match_words == ""
"     return ""
"   end
"   let startpos = s:MultiMatch("bW")
"
"   if startpos == ""
"     return ""
"   endif
"   " - TODO:  figure out whether 'if' or '<tag>' matched, and construct
"   " - the appropriate closing.
"   let matchline = getline(".")
"   let curcol = col(".") - 1
"   " - TODO:  Change the s:all argument if there is a new set of match pats.
"   let regexp = s:Wholematch(matchline, s:all, curcol)
"   let suf = strlen(matchline) - matchend(matchline, regexp)
"   let prefix = (curcol ? '^.\{'  . curcol . '}\%(' : '^\%(')
"   let suffix = (suf ? '\).\{' . suf . '}$'  : '\)$')
"   " Reconstruct the version with unresolved backrefs.
"   let patBR = substitute(b:match_words.',', '[,:]*,[,:]*', ',', 'g')
"   let patBR = substitute(patBR, ':\{2,}', ':', "g")
"   " Now, set group and groupBR to the matching group: 'if:endif' or
"   " 'while:endwhile' or whatever.
"   let group = s:Choose(s:pat, matchline, ",", ":", prefix, suffix, patBR)
"   let i = matchend(group, s:notslash . ",")
"   let groupBR = strpart(group, i)
"   let group = strpart(group, 0, i-1)
"   " Now, matchline =~ prefix . substitute(group,':','\|','g') . suffix
"   if s:do_BR
"     let group = s:InsertRefs(groupBR, prefix, group, suffix, matchline)
"   endif
" " let g:group = group
"
"   " - TODO:  Construct the closing from group.
"   let fake = "end" . expand("<cword>")
"   execute startpos
"   return fake
" endfun

" Close all open structures.  "Get the heck out of here!"
" fun! s:Gthhoh()
"   let close = s:Autocomplete()
"   while strlen(close)
"     put=close
"     let close = s:Autocomplete()
"   endwhile
" endfun

" Parse special strings as typical skip arguments for searchpair():
"   s:foo becomes (current syntax item) =~ foo
"   S:foo becomes (current syntax item) !~ foo
"   r:foo becomes (line before cursor) =~ foo
"   R:foo becomes (line before cursor) !~ foo
fun! s:ParseSkip(str)
  let skip = a:str
  if skip[1] == ":"
    if skip[0] == "s"
      let skip = "synIDattr(synID(line('.'),col('.'),1),'name') =~? '" .
	\ strpart(skip,2) . "'"
    elseif skip[0] == "S"
      let skip = "synIDattr(synID(line('.'),col('.'),1),'name') !~? '" .
	\ strpart(skip,2) . "'"
    elseif skip[0] == "r"
      let skip = "strpart(getline('.'),0,col('.'))=~'" . strpart(skip,2). "'"
    elseif skip[0] == "R"
      let skip = "strpart(getline('.'),0,col('.'))!~'" . strpart(skip,2). "'"
    endif
  endif
  return skip
endfun

let &cpo = s:save_cpo
autocmd BufEnter * :syntax sync fromstart

" vim:sts=2:sw=2:
