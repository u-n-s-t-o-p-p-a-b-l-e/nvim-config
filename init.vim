" :set backspace=indent,eol,start
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

set encoding=UTF-8
call plug#end()

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

" Set up Rust analyzer

" " Example settings for coc.nvim
" augroup my_coc_config
"   autocmd!
"   autocmd FileType rust let b:coc_suggest_disable = 0
" augroup END

" " Example key mappings for coc.nvim
" nmap <silent> <leader>rn <Plug>(coc-rename)
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gr <Plug>(coc-references)

" Ensure coc-settings.json is in the right place
" let g:coc_user_config = '~/.config/nvim/coc-settings.json'


" " coc jump definition
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
" " Bind <leader>h to show hover documentation
" nnoremap <silent> <leader>ho :call CocAction('doHover')<CR>


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



" Coc color setting
" hi! CocErrorSign guifg=#9e9e9e
" hi! CocInfoSign guibg=#353b45
" hi! CocWarningSign guifg=#d1cd66

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
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>
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

" Disable ESLint for HTML files
" let g:ale_linters = {ý,ý,
"     \ 'javascript': ['eslint'],
"     \ 'typescript': ['eslint'],
"     \ 'html': [],
"     \}

:let g:deoplete#enable_at_startup = 1
"let g:NERDTreeDirArrowExpandable="+"
"let g:NERDTreeDirArrowCollapsible="~"

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
      \ 'r': 'R',
      \ 'v': 'V',
      \ 'V': 'VB',
      \ '^V': 'VB'
      \ }

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
" let g:ale_sign_error = 'â'
" let g:ale_sign_warning = 'â '
let g:ale_sign_error = '>'
let g:ale_sign_warning = '--'
" Rust Analyzer setup
let g:ale_rust_rustc_exe = 'clippy'
let g:ale_rust_clippy_args = ''
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Enable ALE for Rust
autocmd FileType rust let b:ale_linters = ['rust']

" airline symbols
" let g:airline_left_sep = 'î°'
" let g:airline_left_alt_sep = 'î±'
" let g:airline_right_sep = 'î²'
" let g:airline_right_alt_sep = 'î³'
" let g:airline_symbols.branch = 'î '
" let g:airline_symbols.readonly = 'î¢'

" let g:airline_symbols.linenr = 'î¡'

" let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" let g:WebDevIconsOS = 'Darwin'
" let g:webdevicons_enable_nerdtree = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:NERDTreeDirArrows = 1

lua << EOF
require('nvim-web-devicons').setup {
  -- your personal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "¿",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
EOF



let g:perl_host_prog = '/usr/bin/perl'
let g:eslint_host_prog = '/usr/local/bin/eslint'
let g:user_emmet_mode='i'

" " discord presence
" "" General options
" let g:presence_auto_update         = 1
" let g:presence_neovim_image_text   = "The One True Text Editor"
" let g:presence_main_image          = "neovim"
" let g:presence_client_id           = "793271441293967371"
" let g:presence_log_level           = "debug"
" let g:presence_debounce_timeout    = 10
" let g:presence_enable_line_number  = 0
" let g:presence_blacklist           = []
" let g:presence_buttons             = 1
" let g:presence_file_assets         = {}
" let g:presence_show_time           = 1

" " Rich Presence text options
" let g:presence_editing_text        = "Editing %s"
" let g:presence_file_explorer_text  = "Browsing %s"
" let g:presence_git_commit_text     = "Committing changes"
" let g:presence_plugin_manager_text = "Managing plugins"
" let g:presence_reading_text        = "Reading %s"
" let g:presence_workspace_text      = "Working on %s"
" let g:presence_line_number_text    = "Line %s out of %s"

" Emmet tab setting
let g:user_emmet_expandabbr_key='<tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup EmmetSettings
	autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
augroup END

" coc select confirm
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Map leader+h to toggle inlay hints
" nnoremap <silent> <leader>h :CocCommand document.toggleInlayHint<CR>
"rust-analyzer.completion.autoimport.enable
" Rust Analyzer and Clippy Configuration
" augroup RustSettings
" 	autocmd!
" 	autocmd FileType rust nmap <buffer> gd <Plug>(rust-def)
" 	autocmd FileType rust nmap <buffer> <leader>l <Plug>(ale_lint)
" 	autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" augroup END



" Netrw configuration
let g:netrw_banner = 0             " Disable netrw banner
let g:netrw_liststyle = 3          " Tree-style listing
let g:netrw_browse_split = 4       " Open in previous window
let g:netrw_altv = 1               " Open with :vsplit
let g:netrw_winsize = 25           " Set window size



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

" " setting ale linters for assembly
" let g:ale_linters = {
" \   'asm': ['nasmlint'],
" \}

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


" " Example keybinding for LSP code actions using telescope
" nnoremap <leader>ca <cmd>Telescope lsp_code_actions<CR>


" Disable AutoPairs in netrw
autocmd FileType netrw let b:AutoPairs = 0


lua << EOF
local nvim_lsp = require('lspconfig')
local cmp = require('cmp')
local saga = require('lspsaga')

-- nvim-cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- lspsaga setup
saga.setup {
	symbol_in_winbar = {
enable = false,
		},
	ui =	{
		code_action = '',
	},
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
}

-- LSP servers setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)  -- Adjusted from <C-k>
    buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)  -- Adjusted from <leader>wa
    buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)  -- Adjusted from <leader>wr
    buf_set_keymap('n', '<leader>l', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)  -- Adjusted from <leader>wl
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- Adjusted from <leader>rn
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)  -- Adjusted from <leader>ca
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)  -- Adjusted from <leader>e
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)  -- Adjusted from <leader>q
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
}

-- Repeat above block for other language servers as needed

EOF



" -- Python
" nvim_lsp.pyright.setup{
"   capabilities = capabilities,
" }

" -- Go
" nvim_lsp.gopls.setup{
"   capabilities = capabilities,
" }

" -- Rust
" nvim_lsp.rust_analyzer.setup{
"   capabilities = capabilities,
" }

" -- HTML
" nvim_lsp.html.setup{
"   capabilities = capabilities,
" }

" -- CSS
" nvim_lsp.cssls.setup{
"   capabilities = capabilities,
" }

" -- JSON
" nvim_lsp.jsonls.setup{
"   capabilities = capabilities,
" }
" EOF




" -- C/C++
" nvim_lsp.clangd.setup{}

" -- COBOL
" nvim_lsp.cobol_ls.setup{}

" -- Haskell
" nvim_lsp.hls.setup{}

" -- Lua
" nvim_lsp.lua_ls.setup{
"   settings = {
"     Lua = {
"       runtime = {
"         version = 'LuaJIT',
"       },
"       diagnostics = {
"         globals = {'vim'},
"       },
"       workspace = {
"         library = vim.api.nvim_get_runtime_file("", true),
"       },
"       telemetry = {
"         enable = false,
"       },
"     },
"   },
" }

" -- Perl
" nvim_lsp.perlls.setup{}

" -- PHP
" nvim_lsp.intelephense.setup{}

" -- R
" nvim_lsp.r_language_server.setup{}

" -- Swift
" nvim_lsp.sourcekit.setup{}

" -- Zig
" nvim_lsp.zls.setup{}

" -- Erlang
" nvim_lsp.erlangls.setup{}
" EOF


" LSP configurations for various languages

lua << EOF
local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup{}            -- C/C++
nvim_lsp.cobol_ls.setup{}          -- COBOL
nvim_lsp.hls.setup{}               -- Haskell
nvim_lsp.lua_ls.setup{             -- Lua
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
nvim_lsp.perlls.setup{}            -- Perl
nvim_lsp.intelephense.setup{}      -- PHP
nvim_lsp.r_language_server.setup{} -- R
nvim_lsp.sourcekit.setup{}         -- Swift
nvim_lsp.zls.setup{}               -- Zig
nvim_lsp.erlangls.setup{}          -- Erlang

-- Rust
nvim_lsp.rust_analyzer.setup{}

-- Go
nvim_lsp.gopls.setup{}

-- Python
nvim_lsp.pyright.setup{}

-- HTML
nvim_lsp.html.setup{}

-- CSS
nvim_lsp.cssls.setup{}

-- JSON
nvim_lsp.jsonls.setup{}
EOF



lua << EOF
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.complete(),  -- Changed from <C-Space> to <C-y>
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})
EOF

