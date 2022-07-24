"
"   NVIM - Config - Silenus
"   2021
"

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

filetype indent on
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set relativenumber
set number
set undofile
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

set wildmenu
set wildmode=full
set wildoptions=tagfile
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
source ~/.config/nvim/plugins/cmp.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/vundle.vim
source ~/.config/nvim/plugins/black.vim
source ~/.config/nvim/plugins/kos.vim
source ~/.config/nvim/plugins/vim-rainbow.vim
source ~/.config/nvim/plugins/pievim.vim
source ~/.config/nvim/plugins/unicode.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/vimtex.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/skeletons.vim
source ~/.config/nvim/plugins/vim-snippets.vim
source ~/.config/nvim/plugins/tpope.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/Nvim-R.vim
source ~/.config/nvim/plugins/rust.vim
" source ~/.config/nvim/plugins/deoplete.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/plenary.vim
source ~/.config/nvim/plugins/syntastic.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/pandoc.vim
source ~/.config/nvim/plugins/markdown.vim
source ~/.config/nvim/plugins/colors.vim
source ~/.config/nvim/plugins/javascript.vim
source ~/.config/nvim/plugins/csv.vim
source ~/.config/nvim/plugins/javascript.vim
source ~/.config/nvim/plugins/neomake.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/rust.vim
source ~/.config/nvim/plugins/stan.vim
call plug#end()
doautocmd User PlugLoaded


"--------------------------------------------------------------------------
" Mappings
"--------------------------------------------------------------------------

map gf :edit <cfile><cr>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
vmap < <gv
vmap > >gv

inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
nnoremap <silent> <esc> :noh<return><esc>



"--------------------------------------------------------------------------
" Others
"--------------------------------------------------------------------------

source ~/.config/nvim/visuals.vim
source ~/.config/nvim/filetype.vim

"--------------------------------------------------------------------------
" Lua
"--------------------------------------------------------------------------

source ~/.config/nvim/lua/telescope.vim
source ~/.config/nvim/lua/treesitter.vim
source ~/.config/nvim/lua/lsp.vim
source ~/.config/nvim/lua/cmp.vim
source ~/.config/nvim/lua/orgmode.vim
"--------------------------------------------------------------------------
" Misc
"--------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.tex set spell spelllang=pt,en,de,fr

" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
      " \ 'tex': g:vimtex#re#deoplete
      " \})

let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/home/silenus/.pyenv/versions/nvim3/bin/python3'
let g:python_host_prog = '/home/silenus/.pyenv/versions/nvim2/bin/python'

