set nocompatible              " be iMproved, required
filetype off                  " required
set exrc

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== PLUGINS ====
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'townk/vim-autoclose'
Plugin 'lokaltog/vim-powerline'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'stanangeloff/php.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'mattn/emmet-vim'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-projectionist'
"Plugin 'roxma/nvim-completion-manager'
"Plugin 'noahfrederick/vim-composer'
"Plugin 'noahfrederick/vim-laravel'

" ===== CtrlP =====
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ==== End CtrlP =====

" ==== PLUGIN THEMES ====
"Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
" ==== END PLUGIN THEMES ====

" ==== PLUGIN SYNTAXES ====
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'mitsuhiko/vim-jinja'
" === END PLUGIN SYNTAXES ====

" ==== END PLUGINS ====

call vundle#end()
filetype plugin indent on

" ==== BASIC ====
"colorscheme gruvbox
"colorscheme dracula
colorscheme molokai
"set guifont=Monospace\ 10
set fillchars+=vert:\$
syntax enable
set background=dark
set ruler
set hidden
set number
set title
set relativenumber
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999
autocmd FileType * set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab

" ==== NERDTREE ====
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let mapleader = " "
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic ====
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>
" === flake8 ====
let g:flake8_show_in_file=1

" === NERDTree ===
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>e :buffer NERD_tree_1<CR>

" === molokai ===
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let Powerline_symbols = 'fancy'

" ==== Snips ====
let g:UltiSnipsExpandTrigger="<A-ENTER>"
let g:UltiSnipsJumpForwardTrigger="<A-ENTER>"
let g:UltiSnipsJumpBackwardTrigger="<A-BACKSPACE>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ====  YCM
" Start autocompletion after 3 chars
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"autocmd CursorMovedI

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" ==== Easymotion ====
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== TypeScrypt ====
let g:typescript_indent_disable = 1
setlocal indentkeys+=0.
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" ==== Tsuquyomi ====
:let g:tsuquyomi_single_quote_import=1

" ==== Auto close brackets ====
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

command JsonPretty execute ":%!python -m json.tool"
set secure
