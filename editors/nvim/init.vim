set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=4
set ts=4
set relativenumber
set laststatus=2
set colorcolumn=81,121

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif



call plug#begin('~/.vim/plugged')

" Themes
Plug 'Rigellute/shades-of-purple.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" better search using fuzzy finding FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" makes vim autocomplete (), [], {}, '', "", etc
Plug 'jiangmiao/auto-pairs'

"see the git status of the current line in
" the gutter
Plug 'airblade/vim-gitgutter'

" better way to comment lines inside vim
Plug 'preservim/nerdcommenter'

" matches pairs of things (if-else, tags, etc)
Plug 'andymass/vim-matchup'

" necessary to follow styles of a project
Plug 'editorconfig/editorconfig-vim'

" previews markdown using local server
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" interesting file navigator in modal window
Plug 'liuchengxu/vim-clap'

" nice way to dispatch work in the background
Plug 'tpope/vim-dispatch'

" PHP specific plugins
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'jwalton512/vim-blade'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'} " php refactoring options"
Plug '2072/php-indenting-for-vim', {'for': 'php'}
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'} " php doc autocompletion"
Plug 'neftaio/vim-php-cs-fixer-v2', { 'for': 'php' }

" Status bar
Plug 'itchyny/lightline.vim'

" TagBar
Plug 'majutsushi/tagbar'

" Rainbow for parenthesis
Plug 'luochen1990/rainbow'

" Multiple Cursos
Plug 'terryma/vim-multiple-cursors'

" Use PHP namespaces
Plug 'arnaud-lb/vim-php-namespace'
Plug 'craigemery/vim-autotag'

" Easy align
Plug 'junegunn/vim-easy-align'

" surrounding text objects with whatever you want (paranthesis, quotes, html
" tags...)
Plug 'tpope/vim-surround'

"JS and Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
Plug 'jparise/vim-graphql'

" Snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'algotech/ultisnips-php'
Plug 'mlaursen/vim-react-snippets'
Plug 'neftaio/my-snips'

"AutoComplete
"Plug 'ycm-core/YouCompleteMe'
"
"Ack to serch like as grep
Plug 'mileszs/ack.vim'

"Latex
Plug 'lervag/vimtex'

"Python IDE
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jupyter-vim/jupyter-vim'
Plug 'anosillus/vim-ipynb'

call plug#end()

" PDV phpdoc configuration
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
"nmap <C-m> :call pdv#DocumentWithSnip()<CR>
"let g:UltiSnipsExpandTrigger = "<nop>"
"let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsExpandTrigger = "<C-k>"
"let g:UltiSnipsExpandTrier="<nop>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/my-snips']



if (has("termguicolors"))
 set termguicolors
endif

colorscheme shades_of_purple
"hi Normal guibg=darkblue
hi Normal guibg=NONE ctermbg=NONE

let g:shades_of_purple_lightline = 1
let g:lightline = { 'colorscheme': 'shades_of_purple' }
let NERDTreeQuitOnOpen=1

filetype plugin indent on
" FZF modal window layout and extra info
" uses <CTRL>+P to fuzzy search in normal mode
"nmap <silent> <C-P> :Files<CR>"
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" FZF window will take almost full screen
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9  }  }

" Rainbow parenthesis
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle"

"PhpCsFixer
let g:php_cs_fixer_path = "~/.composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


" Php namespaces configuration
function! IPhpInsertUse()
            call PhpInsertUse()
                call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>uu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>uu :call PhpInsertUse()<CR>


function! IPhpExpandClass()
            call PhpExpandClass()
                call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>ee <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>ee :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1
autocmd FileType php inoremap <Leader>sj <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>sj :call PhpSortUse()<CR>

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Auto pairsno
"let g:AutoPairsShortcutToggle = '<C-j>'
let g:AutoPairsShortcutFastWrap = '<C-j>'
"let g:AutoPairsShortcutJump = '<M-n>'
"let g:AutoPairsShortcutBackInsert = '<M-b>'


"
"
"Configuration for PHP
"
"
if executable('intelephense')
      augroup LspPHPIntelephense
              au!
                  au User lsp_setup call lsp#register_server({
                          \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language
" server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-phpls']

"
"
" JS Development configuration
"
"
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
        let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
        let g:coc_global_extensions += ['coc-eslint']
endif

" Automatic behavior cursor over word
function! ShowDocIfNoDiagnostic(timer_id)
        if (coc#util#has_float() == 0)
                silent call CocActionAsync('doHover')
        endif
endfunction

function! s:show_hover_doc()
        call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

"Latex configuration packages
let g:tex_flavor = 'latex'

" Always use the same virtualenv for vim, regardless of what Python
" environment is loaded in the shell from which vim is launched
let g:vim_virtualenv_path = './venv/'

if isdirectory(eval('g:vim_virtualenv_path'))
if exists('g:vim_virtualenv_path')
    pythonx import os; import vim
    pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
    pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
endif
endif

"
"
"Mapp of keys
"
"
let mapleader=" "
let maplocalleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bd :bd<CR>
nmap <Leader>vv <C-w>v
nmap <Leader>hh <C-w>S
" TagbarToggle
nmap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>a :Ack!<Space>
noremap <C-m> :make<BAR>copen<CR>

"nmap <Leader>r :echo "hello.."<CR>
"
" 
