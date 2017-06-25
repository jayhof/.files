call plug#begin('~/.local/share/nvim/plugged')

Plug 'kristijanhusak/vim-hybrid-material'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'

Plug 'jelera/vim-javascript-syntax'
Plug 'posva/vim-vue'
Plug 'sekel/vim-vue-syntastic'

call plug#end()


" UI
"
syntax on
set relativenumber
set number
set encoding=utf8

" colorscheme
set background=dark
colorscheme hybrid_material

" nerdtree
nmap <leader>t :NERDTreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic js/vue
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '$(npm bin)/eslint'
let g:syntastic_vue_eslint_exec = '$(npm bin)/eslint'

" better commits
autocmd Filetype gitcommit spell

" lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['fugitive', 'readonly', 'filename']
    \   ]
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'modified': 'LightlineModified',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

function! LightlineReadonly()
    return (&readonly ? '' : '')
endfunction

function! LightlineModified()
    return (&modified ? '' : '')
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        return (fugitive#head() != '' ? ' '.fugitive#head() : '')
    endif
endfunction

function! LightlineFilename()
    return (expand('%:t') != '' ? expand('%:t') : '[No Name]') .
        \ (LightlineModified() != '' ? ' '.LightlineModified() : '')
endfunction
