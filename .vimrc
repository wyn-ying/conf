set nu
set relativenumber
set nocompatible              " required
set backspace=indent,eol,start
"set cursorcolumn
"set cursorline
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

filetype off                  " required

nmap <Tab> V>
nmap <S-Tab> V<
vmap <Tab> >gv
vmap <S-Tab> <gv
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"code folding
set foldmethod=indent
set foldlevel=99
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
"zc ->close, zo ->open

"PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=119
set expandtab
set autoindent
set fileformat=unix
set encoding=utf-8

let python_highlight_all=1
syntax enable
syntax on
set hlsearch

set background=dark
colorscheme solarized
"colorscheme zenburn
"colorscheme desert

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap mu z<CR>
nnoremap md z-
nnoremap mm zz
"nerdtree
nmap <F3> :NERDTree  <CR>
autocmd vimenter * NERDTree
wincmd w
autocmd vimenter * wincmd w
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

"nerdtree-git
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

"indent line
let g:indentLine_char='|'
let g:indentLine_enabled = 0

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"autopep8
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"quick run
map <F1> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunc

"nerdcommenter
let mapleader='\'
map <F4> <leader>ci <CR>
"\ci ->recomment

"tagbar
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_right=1
set tags=tags;
set autochdir
"ctrl+m开启文件tagbar（函数提示分屏）
map <C-m> :TagbarToggle<CR>

"YouCompleteMe Config
nnoremap <leader>gl :YcmCompleter GoToDeclaration <CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition <CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration <CR>
"\gg ->jump, ctrl+o ->return
"let g:ycm_python_binary_path = '/Users/wyn/anaconda3/python'
""0为关闭载入配置文件提示  
let g:ycm_confirm_extra_conf = 0  
" 语法关键字补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"补全之后自动关闭preview  
let g:ycm_autoclose_preview_window_after_completion = 1  
"自动补全快捷键  
let g:ycm_key_invoke_completion = '<S-Space>'  
"允许在字符串里补全（双引号）  
let g:ycm_complete_in_strings = 1  
" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1  
" 在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
set completeopt=longest,menu  
" 离开插入模式后自动关闭预览窗口  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  
" 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
"回车即选中当前项  
""inoremap <expr> <CR>       pumvisible() ? "\<C-n>" : "\<CR>"  
"YcmForceCompileAndDiagnostics"
"YcmDebugInfo  
nnoremap <leader>rr :YcmForceCompileAndDiagnostics<CR>  
"错误  
let g:ycm_error_symbol = '>>'  
"警告  
let g:ycm_warning_symbol = '>*'  
