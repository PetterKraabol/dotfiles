" ~/.config/nvim/init.vim

"set mouse=a			" Mouse clicks
set tabstop=4		" Tab visual size
set softtabstop=4	" Number of spaces in tab when editing
set encoding=UTF-8

set t_Co=256


set number			" Line number
"set showcmd			" Show last command
set wildmenu		" Autocomplete menu for commands
set lazyredraw		" Redraw when necessary
set showmatch		" Highlight matching [{()}]
set incsearch		" Search as characters are entered
set hlsearch		" Highlight search matches
map <Leader><Space> :noh<CR>
set ignorecase		" Ignore case when searching
set magic			" Registrar expressions
set nofoldenable	" No folding


let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method='mupdf'

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : 'out/',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
\}

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Keybinds
nnoremap <C-S-Up> :m-2<CR>
nnoremap <C-S-Down> :m+<CR>
inoremap <C-S-Up> <Esc>:m-2<CR>
inoremap <C-S-Down> <Esc>:m+<CR>

" Language-specific settings
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


" Plugins
call plug#begin()

Plug 'ayu-theme/ayu-vim'		" https://github.com/ayu-theme/ayu-vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " https://github.com/fatih/vim-go
Plug 'tpope/vim-fugitive'		" https://github.com/tpope/vim-fugitive
Plug 'scrooloose/nerdtree'		" https://github.com/scrooloose/nerdtree
Plug 'tpope/vim-surround'		" https://github.com/tpope/vim-surround
Plug 'pangloss/vim-javascript'	" https://github.com/pangloss/vim-javascript
Plug 'plasticboy/vim-markdown'	" https://github.com/plasticboy/vim-markdown
Plug 'ryanoasis/vim-devicons'	" https://github.com/ryanoasis/vim-devicons
Plug 'lervag/vimtex'			" https://github.com/lervag/vimtex
Plug 'ervandew/supertab'		" https://github.com/ervandew/supertab
Plug 'Valloric/YouCompleteMe'	" https://github.com/Valloric/YouCompleteMe
Plug 'SirVer/ultisnips'			" https://github.com/SirVer/ultisnips
Plug 'christoomey/vim-tmux-navigator' " https://github.com/christoomey/vim-tmux-navigator
Plug 'sjl/gundo.vim'	   		" https://github.com/sjl/gundo.vim

call plug#end()

" Ayu theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''

" YCM and Ultisnips compatability using supertab
" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" tmux
let g:tmux_navigator_save_on_switch = 2

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Python3
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif
