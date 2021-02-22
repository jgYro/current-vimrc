if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

nnoremap <SPACE> <Nop>
" :imap ii <Esc>
let mapleader=" "
set encoding=utf-8
set rnu
set nu
set cursorline
set cursorcolumn
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noswapfile
set noerrorbells
set showcmd
set updatetime=300
set noshowcmd
set noruler
set nowrap

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"python stuff
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'davidhalter/jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'rhysd/vim-grammarous'
Plug 'SirVer/Ultisnips'
"dart stff
Plug 'natebosch/dartlang-snippets'
Plug 'dart-lang/dart-vim-plugin'
let dart_format_on_save = 1
let dart_style_guide = 2

let g:coc_force_debug = 1

autocmd vimenter * ++nested colorscheme gruvbox


let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-x>'
let g:UltiSnipsJumpBackwardTrigger = '<C-z>'

" codeaction 
"Example: <leader>aap for current paragraph, <leader>aw for the current word
" Wrap with widget, center, etc
xmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)
call plug#end()
