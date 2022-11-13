" We start by installing Vim plugin manager to manage plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
" System
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/mg979/vim-visual-multi.git'
Plug 'https://github.com/enricobacis/vim-airline-clock.git'
Plug 'https://github.com/tpope/vim-commentary.git'
" Plug 'editorconfig/editorconfig-vim'
Plug 'valloric/youcompleteme'
Plug 'vim-scripts/AutoComplPop'

" Python
Plug 'https://github.com/nvie/vim-flake8.git'

"Godot
Plug 'habamax/vim-godot'

" React
 "React https://getaround.tech/setting-up-vim-for-react/
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'w0rp/ale'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'mattn/emmet-vim'

 "highlights matching tags
 Plug 'leafOfTree/vim-matchtag'

 "Jumps around html tags using %
 Plug 'https://github.com/adelarsq/vim-matchit'

call plug#end()
" packloadall
set number         " Show current line number
let g:one_allow_italics = 1 " I love italic for comments

let g:ale_python_flake8_options = '--max-line-length=120'

syntax on
colorscheme onedark
set splitbelow
let g:minimap_highlight='Visual'

" Highlight characters at line break.
set colorcolumn=120

" Enable folding
set foldmethod=indent
set foldlevel=99

set encoding=utf-8
set hlsearch

" ctrl+h to toggle highlight.
let hlstate=0
nnoremap <c-h> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

nnoremap <space> za

" remap gcc to ctrl-/
nmap <c-_> <Plug>CommentaryLine

" remap nerd tree toggle to ctrl-\
nmap <C-Bslash> :NERDTreeToggle <cr>

" remap save to ctrl-s
nmap <c-s> :w <cr>

" remap exit to ctrl-q
nmap <c-q> :q <cr>

" Clipboard support remap
vnoremap <C-c> :w !xclip -selection clipboard<Cr><Cr>


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
" \o
"
" Ale
" You Complete Me config
if !has_key( g:, 'ycm_language_server' )
  let g:ycm_language_server = []
endif

let g:ycm_language_server += [
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'project_root_files': [ 'project.godot' ],
  \     'port': 6008
  \   }
  \ ]

let b:ale_linters = ['cs', 'flow-language-server']
let g:ale_sign_error = '•' " Less aggressive than the default '>>'
let g:ale_sign_warning = '◦'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none --html-whitespace-sensitivity --single-attribute-per-line --embedded-language-formatting=off'
" Allow ALE to autoimport completion entries from LSP servers
let g:ale_completion_autoimport = 1

" TODO - https://dev.to/dlains/create-your-own-vim-commands-415b - Learn to
" create custom vim commands. -- Create Python scripts to automate workflow
" Skipping defaults in attempt to stop auto-indenting
let skip_defaults_vim=1
autocmd filetype indent off
:set nowrap
 

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" Godot executable on path
let g:godot_executable = '~/Applications/Godot/Godot_v3.5.1-stable_x11.64'

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
