" We start by installing Vim plugin manager to manage plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
" System
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/mg979/vim-visual-multi.git'
Plug 'https://github.com/enricobacis/vim-airline-clock.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/preservim/tagbar.git'
" Plug 'editorconfig/editorconfig-vim'
Plug 'valloric/youcompleteme'
Plug 'vim-scripts/AutoComplPop'

" Rust
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Python
Plug 'https://github.com/nvie/vim-flake8.git'

"Godot
Plug 'https://github.com/habamax/vim-godot.git'

" React
 "React https://getaround.tech/setting-up-vim-for-react/
 " Plug 'pangloss/vim-javascript'
 " Plug 'mxw/vim-jsx'
 " Plug 'w0rp/ale'
 " Plug 'skywind3000/asyncrun.vim'
 " Plug 'mattn/emmet-vim'

 "highlights matching tags
 Plug 'leafOfTree/vim-matchtag'

 "Jumps around html tags using %
 Plug 'https://github.com/adelarsq/vim-matchit'

call plug#end()
syntax enable
filetype plugin indent on

" Enable ALE auto completion globally
" let g:ale_completion_enabled = 1

" Allow ALE to autoimport completion entries from LSP servers
" let g:ale_completion_autoimport = 1

let g:ale_pattern_options = { '\.h$': { 'ale_linters': { 'cpp' : ['gcc',] } } }
" Set flags for gcc/clang
let opts = '-std=c++20 -Wall -Wextra -I include/ -L lib/ -lraylib'
let g:ale_linters = { 'rust': ['analyzer'], 'cpp': ['cc', 'gcc', 'clang'] }

let g:ale_cpp_cc_options    = opts
let g:ale_cpp_gcc_options   = opts
let g:ale_cpp_clang_options = opts
let g:ale_rust_rls_toolchain = 'stable'

" packloadall
set number         " Show current line number
let g:one_allow_italics = 1 " I love italic for comments

let g:ale_python_flake8_options = '--max-line-length=120'
" Add to .vimrc to enable project-specific vimrc
" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

syntax on
colorscheme onedark
set splitbelow
let g:minimap_highlight='Visual'

" Highlight characters at line break.
set colorcolumn=80,120 

" Enable folding
" set foldmethod=indent
" set foldlevel=99

set encoding=utf-8
set hlsearch

" ctrl+h to toggle highlight.
let hlstate=0
nnoremap <c-h> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" cntrl+j/k to nav linter errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <space> za

" remap gcc to ctrl-/
xmap <c-_> gc 
nmap <c-_> gcc

" remap nerd tree toggle to ctrl-\
nmap <C-Bslash> :NERDTreeToggle <cr>

" remap save to ctrl-s
nmap <c-s> :w <cr>

" remap exit to ctrl-q
nmap <c-q> :q <cr>

" Clipboard support remap
""" Linux:
vnoremap <C-c> :w !xclip -selection clipboard<Cr><Cr>
""" Windows WSL:
" vnoremap <C-c> :w !clip.exe <Cr><Cr>


" Ale
" You Complete Me config
" if !has_key( g:, 'ycm_language_server' )
"   let g:ycm_language_server = []
" endif


" let b:ale_linters = ['cs', 'flow-language-server']
let g:ale_sign_error = '•' " Less aggressive than the default '>>'
let g:ale_sign_warning = '◦'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none --html-whitespace-sensitivity --single-attribute-per-line --embedded-language-formatting=off'
" Allow ALE to autoimport completion entries from LSP servers

" TODO - https://dev.to/dlains/create-your-own-vim-commands-415b - Learn to
" create custom vim commands. -- Create Python scripts to automate workflow
" Skipping defaults in attempt to stop auto-indenting
let skip_defaults_vim=1
autocmd filetype indent off
:set nowrap

" tags
nmap <c-l> :TagbarToggle<CR>


let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" Turn on spell checking 
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell


" Disable auto line breaking
autocmd VimEnter * setlocal textwidth=0 wrapmargin=0

" Tab spacing for file types
autocmd Filetype * setlocal tabstop=4
autocmd Filetype * setlocal shiftwidth=4
autocmd Filetype * setlocal softtabstop=4

autocmd Filetype js setlocal tabstop=2
autocmd Filetype js setlocal shiftwidth=2
autocmd Filetype js setlocal softtabstop=2


" Displays tabs as pipe
set list lcs=tab:\|\ 

" transparent bg
hi Normal guibg=NONE ctermbg=NONE

" Remove whitespace in .py files.
autocmd BufWritePre *.py :%s/\s\+$//e


"Godot
let g:godot_executable = '~/Applications/Godot4/Godot_v4.0.x86_64'

if !has_key( g:, 'ycm_language_server' )
  let g:ycm_language_server = []
endif

let g:ycm_language_server += [
\      {
\        'name': 'godot',
\        'filetypes': [ 'gdscript' ],
\        'project_root_files': [ 'project.godot' ],
\        'port': 6008
\      }
\    ]

" " Register LSP server for Godot:
" call ale#linter#Define('gdscript', {
" \    'name': 'godot',
" \    'lsp': 'socket',
" \    'address': '127.0.0.1:6008',
" \    'project_root': 'project.godot',
" \ })




set exrc
set secure
