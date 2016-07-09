set nocompatible               " be iMproved

call plug#begin('~/.vim/plugged')

" --- github plugins
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'kana/vim-scratch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'jrosiek/vim-mark'

"colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'therubymug/vim-pyte'
Plug 'noahfrederick/vim-hemisu'

" from github vim-scripts
"Plugin 'a.vim'   " FIXME problems with insert map mappings starting with space
                   " see ":map!" for the mappings, remove with iunmap

call plug#end() 

" Brief Help for vim-plug
" PlugInstall [name ...] [#threads] 	Install plugins
" PlugUpdate [name ...] [#threads] 	Install or update plugins
" PlugClean[!] 	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade 	Upgrade vim-plug itself
" PlugStatus 	Check the status of plugins
" PlugDiff 	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] 	Generate script for restoring the current snapshot of the plugins


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
" save before calling make
set autowrite
" always allows rectangles in visual block mode
set virtualedit=block
" nicer view on binary files
set display=uhex
" allow hidden buffers without saving
set hidden
" don't move cursor to first char in line
set noeol
" everything in English please
language en_US.utf8
" enable spell checking by default, 10 suggestions are enough
set spell
set spellsuggest=10
" 80 is the texwidth god intended
set textwidth=80
set formatoptions=qrn1
" wrapped lines are annoying and nothing else
set nowrap
" relativenumber... the best thing since sliced bread!
set relativenumber
set number
" show mode (INSERT, VISUAL, etc.)
set showmode
set showcmd
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
set nohlsearch  " I use the Mark plugin for explicit highlighting
set showmatch

" --- indentation -------------------------------------------------------------
set expandtab
set shiftwidth=4
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

nnoremap <F4> :Lexplore<CR>
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
"let g:syntastic_enable_signs    = 0  " no signs, we use airline syntastic anyway
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ["python", "rust"],
                           \ "passive_filetypes": [] }

" easy-align settings
 vnoremap <leader>a :EasyAlign<CR>

" Mark settings
let g:mwDefaultHighlightingPalette = 'extended'

" rust settings
let g:rustfmt_autosave = 1
