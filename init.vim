":set t_kb
:set backspace=indent,eol,start
:set noshowmode
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard+=unnamedplus
:set linebreak
:set breakindent
:set showbreak=Í±
:set termguicolors
:set updatetime=100
" rust run-ctags | ctags -R -L -
:set tags=./tags;/
" get back in indent after esc or :w
:set indentexpr=GetIndent()


" Set the cursor style for different modes
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline
:hi NonText guifg=bg

" Set the leader key
let mapleader = " "
let maplocalleader = " "

" Enable persistent undo
set undofile
set undodir=~/.config/nvim/undodir

" Create the undo directory if it doesn't exist
if !isdirectory(expand('~/.config/nvim/undodir'))
    call mkdir(expand('~/.config/nvim/undodir'), 'p')
endif

" Set the number of undo levels
set undolevels=100

call plug#begin('~/.vim/plugged')
"call plug#begin()
if has('nvim')
	Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'https://github.com/Shougo/deoplete.nvim'
	Plug 'https://github.com/roxma/nvim-yarp'
	Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif



Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/navarasu/onedark.nvim'
"Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
"Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/nvim-lua/popup.nvim'  " popup
Plug 'https://github.com/BurntSushi/ripgrep'   
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/ryanoasis/vim-devicons'

" snippets
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'https://github.com/wagnerf42/vim-clippy'
Plug 'https://github.com/prabirshrestha/async.vim'
" fuzzy finders
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-telescope/telescope-media-files.nvim'
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim'   
" Specify LSP plugin
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/prabirshrestha/vim-lsp'
"Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'} 
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/czheo/mojo.vim'
Plug 'https://github.com/rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" autocompletion
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-vsnip'
Plug 'https://github.com/hrsh7th/vim-vsnip'
" LSP UI enhancements
Plug 'https://github.com/nvimdev/lspsaga.nvim'

Plug 'https://github.com/andweeb/presence.nvim'
Plug 'https://github.com/mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
Plug 'https://github.com/roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
" terminal for nvim
Plug 'https://github.com/akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'https://github.com/elixir-editors/vim-elixir'

" codes error handling
Plug 'https://github.com/folke/trouble.nvim'


set encoding=UTF-8
call plug#end()


" get back in indent after :w or esc
function GetIndent()
   let lnum = prevnonblank(v:lnum - 1)
   let ind = indent(lnum)
   return ind
endfunction


" Configure HTML language server
lua << EOF
require'lspconfig'.html.setup{}
EOF


" Setup toggle-term
lua require("toggleterm").setup{}

" Configure ESLint language server
lua << EOF
require'lspconfig'.eslint.setup{
    filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
}
EOF

:colorscheme onedark
" augroup OnedarkSettings
"     autocmd! VimEnter * colorscheme onedark
" augroup END
let g:onedark_config = {
			\ 'style': 'deep',
			\ 'toggle_style_key': '<leader>ts',
			\ 'ending_tildes': v:true,
			\ 'diagnostics': {
			\ 'darker': v:true,
			\ 'background': v:true,
			\ },
			\ }

" " syntastic color setting
" hi SpellBad ctermfg=006 ctermbg=045 guifg=#0087d7 guibg=#875fd7
" hi SpellCap ctermfg=003 ctermbg=022 guifg=#87afd7 guibg=#5fafaf

function! OpenFullSizedTerminal()
  ToggleTerm
  " Calculate 50% of the total lines 
  let l:mid_height = float2nr(&lines / 2)
  execute l:mid_height . 'resize'
endfunction

nnoremap <silent> <C-m> :call OpenFullSizedTerminal()<CR>
" Toggleterm resize
nnoremap <Leader>m :resize 21<CR>
nnoremap <Leader>l :resize 10<CR>

" My custom remapping
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>a :wqa!<CR>
nnoremap <Leader>d :%d<CR>
nnoremap <Leader>= m`gg=G``<CR>
nnoremap <Leader>O ggO
nnoremap <Leader>o Go<CR>
nnoremap nt :tabe<Space>
nnoremap ' :
nnoremap <Leader>vim :tabe $MYVIMRC<CR>
nnoremap <Leader>sn :UltiSnipsEdit<CR>
nnoremap <Leader>so :source $MYVIMRC<CR>
inoremap <A-w> <C-w>
" inoremap <C-Space> <C-o>$
inoremap <silent> <C-Space> <Esc>A

tnoremap <Esc> <C-\><C-n>
" Map Esc to clear search highlighting
nnoremap <Leader>[ :noh<CR>

"Mapping to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" vim surround
vmap <Leader>} S}
vmap <Leader>) S)
vmap <Leader>] S]

" nnoremap <Leader>fe :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>fe :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<cr>

nnoremap <Leader>fd :lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" using ctrl-s to save file
nnoremap <silent><c-s> :<c-u>w<cr>
vnoremap <silent><c-s> <c-c>:w<cr>gv
inoremap <silent><c-s> <Esc>:w<cr>


nmap <F8> :TagbarToggle<CR>ý,ý,

:set completeopt-=preview " For No Previews

" Toggle vertical cursor 
nnoremap <Leader>vc :set cursorcolumn<CR>
nnoremap <Leader>vo :set nocursorcolumn<CR>
" Toggle colorcolumn
nnoremap <Leader>cc :set colorcolumn=64<CR>
nnoremap <Leader>co :set colorcolumn=<CR>
" Change previous word first letter to uppercase
nnoremap <Leader>w b~ea
" Swap 2 words
nnoremap <Leader>ss bdiwbPa<Space><Esc>ea<space>

" multi line clean-code alignment
vmap <Leader>ca :'<,'>!column -t -o ' '<CR>gv>
" add a keybinding to toggle Trouble
nnoremap <leader>xx :Trouble diagnostics<CR>

:let g:deoplete#enable_at_startup = 1

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished' " airline theme
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Use rectangular separators in Vim Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" Set mode display mappings in Vim Airline
let g:airline_section_x = '%{toupper(mode())}'
let g:airline_mode_map = {
      \ 'n': 'N',
      \ 'i': 'I',
      \ 'ic': 'I',
      \ 'r': 'R',
      \ 'v': 'V',
      \ 'V': 'VB',
      \ '^V': 'VB',
      \ 'insert compl generic': 'I'
      \ }

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" Vim
"
let $PATH .= ':' . '/usr/bin/perl'

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" Enable async processing for ALE
let g:ale_completion_enabled = 1
" let g:ale_sign_error = 'â'
" let g:ale_sign_warning = 'â '
let g:ale_sign_error = '>'
let g:ale_sign_warning = '--'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:perl_host_prog = '/usr/bin/perl'
let g:eslint_host_prog = '/usr/local/bin/eslint'
let g:user_emmet_mode='i'

" Emmet tab setting
let g:user_emmet_expandabbr_key='<tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup EmmetSettings
	autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
augroup END


" enabling which plugin giving errors warnings in :messages
augroup PrintSigns
  autocmd!
  autocmd VimEnter * call PrintSigns()
augroup END

function! PrintSigns()
  redir => signs_output
  silent! execute 'echo string(sign_getdefined())'
  redir END
  echom signs_output
endfunction

" Disable Syntastic for asm files
autocmd FileType asm let b:syntastic_mode = 'passive'

" Disable ALE for asm files
autocmd FileType asm let b:ale_linters = []

let g:user_emmet_settings = {
			\  'variables': {'lang': 'en'},
			\  'html': {
			\    'default_attributes': {
			\      'option': {'value': v:null},
			\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
			\    },
			\    'snippets': {
			\      'html:5': "<!DOCTYPE html>\n"
			\              ."<html lang=\"${lang}\">\n"
			\              ."<head>\n"
			\              ."\t<meta charset=\"${charset}\">\n"
			\              ."\t<title></title>\n"
			\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
			\              ."</head>\n"
			\              ."<body>\n\t${child}|\n</body>\n"
			\              ."</html>",
			\    },
			\  },
			\}

" Disable AutoPairs in netrw
autocmd FileType netrw let b:AutoPairs = 0


" Additional configuration (optional)
lua << EOF
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  }
EOF
lua << EOF
local nvim_lsp = require('lspconfig')
local cmp = require('cmp')
local saga = require('lspsaga')


local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

EOF
