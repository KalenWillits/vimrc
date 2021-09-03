call plug#begin()
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/mg979/vim-visual-multi.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/enricobacis/vim-airline-clock.git'
Plug 'https://github.com/severin-lemaignan/vim-minimap.git'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'https://github.com/prettier/vim-prettier.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
" Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/vim-scripts/indentpython.vim.git'
Plug 'pangloss/vim-javascripti'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'

"Auto formats with prettier on js saves.
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


call plug#end()
" packloadall
set number         " Show current line number
let g:one_allow_italics = 1 " I love italic for comments

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

" Tab spacing for file types
autocmd Filetype graphql setlocal tabstop=4
autocmd Filetype js setlocal tabstop=2
autocmd Filetype py setlocal tabstop=4
autocmd Filetype cpp setlocal tabstop=4


" Remove whitespace in .py files.
autocmd BufWritePre *.py :%s/\s\+$//e

vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>

" Toggle 'default' terminal
nnoremap <C-t> :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nnoremap <C-~> :call ChooseTerm("term-pane", 0)<CR>
 
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "topleft split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "topleft split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction
