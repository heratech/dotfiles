call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	"Plug 'ctrlpvim/ctrlp.vim'
	Plug 'wellle/targets.vim'
	Plug 'tomtom/tcomment_vim'
	Plug 'tpope/vim-surround'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-unimpaired'
	Plug 'justinmk/vim-sneak'
	Plug 'scrooloose/nerdtree'
	Plug 'majutsushi/tagbar'
	Plug 'vim-syntastic/syntastic'
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	Plug 'Shougo/unite.vim'
	Plug 'Shougo/neocomplete.vim'
	Plug 'terryma/vim-multiple-cursors'
"	Plug 'easymotion/vim-easymotion' "removed because the letter differences
"	hurt my brain.. Using sneak instead
	Plug 'airblade/vim-gitgutter'
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'tomtom/tlib_vim'
	Plug 'garbas/vim-snipmate'
	Plug 'honza/vim-snippets'
	Plug 'sjl/gundo.vim'
	Plug 'mhinz/vim-startify'
	Plug 'flazz/vim-colorschemes'
	"Plug 'lucidstack/ctrlp-mpc.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	"Plug 'AndreaOrru/fzf-mopidy-spotify.vim'
	Plug 'heratech/fzf-mopidy-spotify.vim'
	Plug 'tpope/vim-dispatch'
	Plug 'blindFS/vim-taskwarrior'
	Plug 'gizmo385/spotify.vim'
call plug#end()
"Clever sneak for sneak plugin. Press s again to go to next match
let g:sneak#s_next = 1
"Set line number stuff
let mapleader="\<Space>"
set number
set relativenumber
" let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir', 'tmux', 'mpc']
" nnoremap <Leader>m :CtrlPMpc<CR>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<f3>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" fix for neocomplete multicursor conflicct
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction


"nnoremap <silent> <leader><space> :Files<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Leader>n :MpcNext<CR>
nnoremap <Leader><Leader>b :MpcPrev<CR>
nnoremap <Leader><Leader>p :MpcToggle<CR>
nmap <Leader><Leader> V

"hide buffers, dont close
set hidden
set nowrap
set tabstop=4
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

filetype plugin indent on

if has('autocmd')
	autocmd filetype python set expandtab
endif

if &t_Co >= 256 || has("gui_running")
	colorscheme solarized
endif

if &t_Co > 2 || has("gui_running")
	"switch syntax highlighting on, when the terminal has colors
	syntax on
endif

set pastetoggle=<F2>

map <F9> :SpotifyPreviousSong<CR>
map <F10> :SpotifyPauseUnpause<CR>
map <F12> :SpotifyNextSong<CR>

"set mouse=aAA
nnoremap ; :
" let g:ctrlp_show_hidden = 0
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
	  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
cmap w!! w !sudo tee % >/dev/null
"autocmd vimenter * NERDTree
map <C-e> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline#extensions#tabline#enabled = 1
let g:minimap_highlight='Visual'
set laststatus=2
let g:airline_theme='molokai'
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:neocomplete#enable_at_startup = 1
nmap <F8> :TagbarToggle<CR>
" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
