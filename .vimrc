" We start by installing Vim plugin manager to manage plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/mg979/vim-visual-multi.git'
Plug 'https://github.com/enricobacis/vim-airline-clock.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'valloric/youcompleteme'
" Plug 'vim-scripts/AutoComplPop'

" React https://getaround.tech/setting-up-vim-for-react/
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'w0rp/ale'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'mattn/emmet-vim'
"
" highlights matching tags
" Plug 'leafOfTree/vim-matchtag'
" Jumps around html tags using %
" Plug 'https://github.com/adelarsq/vim-matchit'

call plug#end()
" packloadall
set number         " Show current line number
let g:one_allow_italics = 1 " I love italic for comments

let g:ale_python_flake8_options = '--max-line-length=120'

syntax on
colorscheme onedark
nmap <C-Bslash> :NERDTreeToggle <cr>
set splitbelow
let g:minimap_highlight='Visual'
" Highlight characters at line break.
set colorcolumn=120

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set encoding=utf-8
set hlsearch

" ctrl+c to toggle highlight.
let hlstate=0
nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>


" remap gcc to ctrl-k
xmap <c-k> <Plug>Commentary

" Remove whitespace in .py files.
autocmd BufWritePre *.py :%s/\s\+$//e


" Clipboard support
vnoremap <C-y> :!xclip -selection clipboard<Cr><Cr>

" " React 
" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}

" let g:ale_linters = {
" \   'javascript': ['prettier', 'eslint'],
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}
let b:ale_linters = ['cs', 'flow-language-server']
let g:ale_sign_error = '•' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none --html-whitespace-sensitivity --single-attribute-per-line --embedded-language-formatting=off'

" TODO - https://dev.to/dlains/create-your-own-vim-commands-415b - Learn to
" create custom vim commands. -- Create Python scripts to automate workflow
"
" Skipping defaults in attempt to stop auto-indenting
let skip_defaults_vim=1
autocmd filetype indent off
:set nowrap
 

" You Complete Me config
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Turn on spell checking 
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell


" Disable auto line breaking
autocmd VimEnter * setlocal textwidth=0 wrapmargin=0

" Tab spacing for file types
autocmd Filetype js setlocal tabstop=2
autocmd Filetype js setlocal shiftwidth=2
autocmd Filetype js setlocal softtabstop=2

autocmd Filetype gd setlocal tabstop=4
autocmd Filetype gd setlocal shiftwidth=4
autocmd Filetype gd setlocal softtabstop=4

autocmd Filetype cs setlocal tabstop=4
autocmd Filetype cs setlocal shiftwidth=4
autocmd Filetype cs setlocal softtabstop=4

autocmd Filetype json setlocal tabstop=4
autocmd Filetype py setlocal tabstop=4
autocmd Filetype cpp setlocal tabstop=4

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

set list lcs=tab:\|\ 
