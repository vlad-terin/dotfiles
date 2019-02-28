let mapleader =" "

call plug#begin('~/.config/nvim/bundle')
Plug 'shougo/deoplete.nvim'
Plug 'shougo/neosnippet-snippets'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'yuttie/comfortable-motion.vim'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'tpope/vim-commentary'
Plug 'bogado/file-line'
" Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

" fzf preferences

nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>


nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>/ :History/<CR>
nmap <Leader>M :Maps<CR>

" preferences

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
map <C-h> <C-w>
inoremap jj <ESC>
set number relativenumber
set encoding=utf-8
syntax on
set background=dark
filetype plugin on
set nocompatible
" Enable autocompletion
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Goyo plugin makes text more readable when writing prose:
        map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
        map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
        set splitbelow splitright
" Shortcutting split navigation, saving a keypress:
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
" Ensure files are read as what I want:
        let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
        autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
        autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
        autocmd BufRead,BufNewFile *.tex set filetype=tex

" Replace all is aliased to S.
        nnoremap S :%s//g<Left><Left>
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
        vnoremap <C-c> "+y
        map <C-p> "+P
" Automatically deletes all trailing whitespace on save.
        autocmd BufWritePre * %s/\s\+$//e

" git fugitive

nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>

" misc

map <A-;> :Files<CR>
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=4 sts=4 sw=4

" provide hjkl movements in Insert mode via the <Alt> modifier key

inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <C-b> <C-w>

cnoreabbrev ag Ag

" Limelight

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" set background=dark
" let g:solarized_termcolors=256 "this is what fixed it for me
" colorscheme solarized
