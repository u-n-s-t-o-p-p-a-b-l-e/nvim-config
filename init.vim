:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard+=unnamedplus
:set linebreak
:set colorcolumn=64
:set breakindent
:set showbreak=ͱ
:set termguicolors

" default updatetime 4000ms is not good for async update
:set updatetime=100

:hi NonText guifg=bg

" Set the leader key
let mapleader = " "
let maplocalleader = " "

call plug#begin()

if has('nvim')
	Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'https://github.com/Shougo/deoplete.nvim'
	Plug 'https://github.com/roxma/nvim-yarp'
	Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/navarasu/onedark.nvim'
"Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'} " Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/nvim-lua/popup.nvim'  " popup
Plug 'https://github.com/nvim-telescope/telescope-media-files.nvim'
Plug 'https://github.com/BurntSushi/ripgrep'   
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim'   
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/wagnerf42/vim-clippy'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/mattn/vim-lsp-settings'
Plug 'https://github.com/prabirshrestha/async.vim'
" Specify LSP plugin
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/czheo/mojo.vim'
Plug 'https://github.com/rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'https://github.com/andweeb/presence.nvim'

" Required for vim 8
Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
" Install this plugin
Plug 'https://github.com/roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

set encoding=UTF-8

call plug#end()

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

" My custom remapping
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>q :wq!<CR>
nnoremap <Leader>d :%d<CR>
nnoremap nt :tabe<Space>
nnoremap ; :
inoremap <A-w> <C-w>

" Map Esc to clear search highlighting
nnoremap <Esc> :noh<CR>

" Mapping to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:let g:deoplete#enable_at_startup = 1
"let g:NERDTreeDirArrowExpandable="+"
"let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" Vim
"
let $PATH .= ':' . '/usr/bin/perl'

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" LSP Settings
let g:rustfmt_autosave = 1
let g:ale_linters = {
			\ 'rust': ['clippy'],
			\ }

" Enable async processing for ALE
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Rust Analyzer setup
let g:ale_rust_rustc_exe = 'clippy'
let g:ale_rust_clippy_args = ''

" Enable ALE for Rust
autocmd FileType rust let b:ale_linters = ['rust']

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeDirArrows = 1
let g:perl_host_prog = '/usr/bin/perl'
let g:eslint_host_prog = '/usr/local/bin/eslint'
let g:user_emmet_mode='i'

" discord presence
"" General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_log_level           = "debug"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}
let g:presence_show_time           = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"




"let g:user_emmet_leader_key=','
let g:user_emmet_expandabbr_key='<tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup EmmetSettings
	autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
augroup END
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Rust Analyzer and Clippy Configuration
augroup RustSettings
	autocmd!
	autocmd FileType rust nmap <buffer> gd <Plug>(rust-def)
	autocmd FileType rust nmap <buffer> <leader>l <Plug>(ale_lint)
	autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

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
