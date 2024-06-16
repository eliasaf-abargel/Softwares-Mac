" Specify the location where vim-plug will install the plugins
call plug#begin('~/.local/share/nvim/plugged')

" Plugins for file exploration and fuzzy finding
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Auto-completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Enhanced status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File icons
Plug 'ryanoasis/vim-devicons'

" Color scheme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'joshdick/onedark.vim' " Uncomment this line if you want to try onedark theme

" GitHub Copilot plugin
Plug 'github/copilot.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Code commenting
Plug 'tpope/vim-commentary'

" Surround operations
Plug 'tpope/vim-surround'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Syntax checking
Plug 'dense-analysis/ale'

call plug#end()

" Set the color scheme
colorscheme onehalfdark
" colorscheme onedark " Uncomment this line if you want to use the onedark theme

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'
" let g:airline_theme='onedark' " Uncomment this line if you want to use the onedark theme

" Enable line numbers and relative numbers
set number
set relativenumber

" Use UTF-8 encoding
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Custom settings for visual mode
highlight Visual term=reverse cterm=reverse guibg=Grey guifg=Black

" NERDTree keybinding to toggle the file explorer
map <C-n> :NERDTreeToggle<CR>

" Custom configurations for markdown editing
autocmd FileType markdown setlocal formatoptions+=n
autocmd FileType markdown setlocal comments=b:*,b:-,b:+,n:😀,n:👍,n:💡

" FZF keybindings
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

" Coc configurations
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-python', 'coc-clangd']

" ALE configurations
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'cpp': ['clang'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1

" Additional settings can be added below
" ...
