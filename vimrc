set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim"
call vundle#rc()

" --- github plugins
" let Vundle manage Vundle ( https://github.com/gmarik/vundle/ )
Bundle 'gmarik/vundle'
Bundle 'Raimondi/delimitMate'
Bundle 'majutsushi/tagbar'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-scratch'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-fugitive'  " good but to difficult to remember command if you don't use it regulary
Bundle 'bernh/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'junegunn/vim-easy-align'
Bundle 'justinmk/vim-sneak'
Bundle 'dag/vim2hs'
Bundle 'mbbill/undotree'
Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'

"colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'therubymug/vim-pyte'
Bundle 'noahfrederick/vim-hemisu'

" from github vim-scripts
"Bundle 'a.vim'   " FIXME problems with insert map mappings starting with space
                   " see ":map!" for the mappings, remove with iunmap
Bundle 'Mark--Karkat'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief Help
" :PluginInstall  - install bundles (won't update installed)
" :PluginInstall! - update if installed
" :PluginClean    - uninstall bundles


syntax on


" backup
set backup
set backupdir=$HOME/.vim/backup
" all swapfiles in a global dir
set directory=$HOME/.vim/swap
" clipboard handling
set clipboard=unnamed
" to get rid of ^M
set fileformats=unix,dos
" use the directory of the current buffer for the file browser
set browsedir=buffer
" behaviour of the backspace-key
set backspace=indent,eol,start
" save before calling make
set autowrite
" always allows rectangles in visual block mode
set virtualedit=block
" nicer view on binary files
set display=uhex
" allow hidden buffers without saving
set hidden
" statusline
set laststatus=2
" don't move cursor to first char in line
set noeol
" everything in English please
language en_US.utf8
" enable spell checking by default, 10 suggestions are enough
set spell
set spellsuggest=10
" current position with line+column and the percentage within the buffer.
set ruler
" 80 is the texwidth god intended
set textwidth=80
set formatoptions=qrn1
" wrapped lines are annoying and nothing else
set nowrap
" relativenumber... the best thing since sliced bread!
set relativenumber
set number
" set default encoding
set encoding=utf-8
" show mode (INSERT, VISUAL, etc.)
set showmode
set showcmd
" better completion for command line
set wildmenu
" smother redraw
set ttyfast
" no beep
set noeb
" I will never care about these files
set wildignore+=*.pyc,*.pyo,*.swp,*.o,tags
" display the current working  directory in the window title
set title
set titlestring=%{getcwd()}
" faster macro execution
set lazyredraw

" --- GUI specific settings----------------------------------------------------

if has("gui_running")
    " away with the toolbar and the menu
    set guioptions-=T
    set guioptions-=m
    set guitablabel=%N
    colorscheme hemisu
    set background=light
    set columns=125
    set lines=50
    if has("win32")
        set guifont=Consolas
    endif
else
    set t_Co=256
endif


" --- settings for searching --------------------------------------------------
set ignorecase
set smartcase
set incsearch
set nohlsearch  " I use the Mark plugin for explicit highlighting
set showmatch

" --- indentation -------------------------------------------------------------
set expandtab
set smarttab
set shiftwidth=4
set autoindent
set shiftround

" --- mappings ----------------------------------------------------------------
" set the leader from \ to <Space>
let mapleader = "\<Space>"

" alternative to ESC
inoremap jk <ESC>

" set expected behaviour for Y
map Y y$

" run macro from register q (drop the useless Ex mode)
nnoremap Q @q

" reload and edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" delete a buffer without closing the window
nnoremap <leader>b :bp<CR>:bd #<CR>

" change directory to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>

" keep Ctrl pressed to move around between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Get rid of that stupid help key that you will invariably hit
" constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <F4> :Explore<CR>
nnoremap <F5> :nohlsearch<CR>:MarkClear<CR>
nnoremap <F6> :set invspell<CR>
"remove trailing whitespace
nnoremap <F8> :%s/\s\+$//e<CR>:w<CR>
"update ctags db
nnoremap <F12> :!ctags -R *<CR><CR>

" cycle through tabs
nnoremap <C-tab> :tabnext<CR>

" Automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" --- (auto)commands ----------------------------------------------------
command! Wa wa                       " map :Wa to :wa
autocmd FocusLost * silent! wall     " always save all files when editor looses focus

" --- abbreviations -----------------------------------------------------
iab pdb import pdb;pdb.set_trace()<ESC>
iab isodate <C-R>=strftime("%Y-%m-%d")<CR>

" --- configure Plugins -------------------------------------------------
" Ag
nnoremap <F2> :Ag! <CR>
nnoremap <leader>f :Ag!<Space>
let g:ag_mapping_message=0

" tagbar
nnoremap <F3> :TagbarToggle<CR>

" Scratch
let g:scratch_buffer_name = "Scratch"
nnoremap <leader><tab> :ScratchOpen<CR>

if has("gui_running")
    " ToggleBg (comes with solarized)
    call togglebg#map("<F7>")
endif

" some ctrlp settings
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 0  " do not search dotfiles or within dot directories
let g:ctrlp_clear_cache_on_exit = 0  " keep cache files around, press F5 for refresh
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'
let g:ctrlp_extensions = ['tag', 'bookmarkdir']
nnoremap <c-p>p :CtrlP<CR>
nnoremap <c-p>t :CtrlPTag<CR>
nnoremap <c-p>r :CtrlPMRUFiles<CR>
nnoremap <c-p>m :CtrlPMixed<CR>
nnoremap <c-p>d :CtrlPBookmarkDir<CR>

" some jedi-vim settings
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_function_definition = "0"

" airline settings
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tagbar#enabled = 0  " performance!

" syntastic settings
let g:syntastic_enable_signs    = 0  " no signs, we use airline syntastic anyway
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list   = 1
let g:syntastic_mode_map = { "mode": "passive",
                            \ "active_filetypes": ["python"],
                            \ "passive_filetypes": [] }

" easy-align settings
 vnoremap <leader>a :EasyAlign<CR>
