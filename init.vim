

"  __  __     __     ___                    
" |  \/  |_   \ \   / (_)_ __ ___  _ __ ___ 
" | |\/| | | | \ \ / /| | '_ ` _ \| '__/ __|
" | |  | | |_| |\ V / | | | | | | | | | (__ 
" |_|  |_|\__, | \_/  |_|_| |_| |_|_|  \___|
"         |___/                             

" Todo List
" 1 Snippets Plug
" 2 [DONE]Check Color
" 3 [DONE]set signature
" 4 [DONE]set coc.nvim
" 5 Set LaTeX;
" 6 Set Tmux;
" 7 Set leaderF


" ===
" === Auto load for first time uses
" ===
"

"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

if has('nvim')
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" === 
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a " activate mouse
set encoding=utf-8
let &t_ut='' " correct your color

set clipboard=unnamed


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

  "augroup TermHandling
    "autocmd!
     ""Turn off line numbers, listchars, auto enter insert mode and map esc to
     ""exit insert mode
    "autocmd TermOpen * setlocal listchars= nonumber norelativenumber
      "\ | startinsert
      "\ | tnoremap <Esc> <c-c>
    "autocmd FileType fzf call LayoutTerm(0.6, 'horizontal')
  "augroup END

  "function! LayoutTerm(size, orientation) abort
    "let timeout = 16.0
    "let animation_total = 120.0
    "let timer = {
      "\ 'size': a:size,
      "\ 'step': 1,
      "\ 'steps': animation_total / timeout
    "\}

    "if a:orientation == 'horizontal'
      "resize 1
      "function! timer.f(timer)
        "execute 'resize ' . string(&lines * self.size * (self.step / self.steps))
        "let self.step += 1
      "endfunction
    "else
      "vertical resize 1
      "function! timer.f(timer)
        "execute 'vertical resize ' . string(&columns * self.size * (self.step / self.steps))
        "let self.step += 1
      "endfunction
    "endif
    "call timer_start(float2nr(timeout), timer.f, {'repeat': float2nr(timer.steps)})
  "endfunction

   ""Open autoclosing terminal, with optional size and orientation
  "function! OpenTerm(cmd, ...) abort
    "let orientation = get(a:, 2, 'horizontal')
    "if orientation == 'horizontal'
      "new | wincmd J
    "else
      "vnew | wincmd L
    "endif
    "call LayoutTerm(get(a:, 1, 0.5), orientation)
    "call termopen(a:cmd, {'on_exit': {j,c,e -> execute('if c == 0 | close | endif')}})
  "endfunction


" ===
" === Main code dispaly
" ===

set number
set relativenumber
set ruler
set cursorline
syntax enable
syntax on

"set autoindent


" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
" scroll
set scrolloff=5

" Prevent auto Line Split
set wrap

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

"let &t_SI = "\<esc>]50;cursorshape=1\x7"
"let &t_SR = "\<esc>]50;cursorshape=2\x7"
"let &t_EI = "\<esc>]50;cursorshape=0\x7"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir " the shell command will apply in the current directory. 
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

" Searching 
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===

" cursor move
inoremap <C-f> <Esc>la
inoremap <C-b> <Esc>i
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
inoremap <C-k> <Esc>d$a


" Set <LEADER> as <SPACE>
let mapleader=" "

" Save & quit
nnoremap W :w<CR>
nnoremap Q :q<CR>

inoremap jk <ESC>l
inoremap jj <ESC>l

" Open the vimrc file anytime
"map <LEADER>rc :e ~/.vimrc<CR>

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Search
nnoremap <LEADER><CR> :nohlsearch<CR>

nnoremap <LEADER>rc : vsplit ~/.config/nvim/init.vim<CR>

" Some map
" map s <nop>
nnoremap R :source $MYVIMRC<CR>

" Faster in-line navigation
nnoremap J 5j
nnoremap K 5k


" ===
" === Window management
" ===
" Use <space> + arrow keys for moving the cursor around windows
nnoremap <LEADER>w <C-w>w
" map <LEADER>wh <C-w>h
" map <LEADER>wj <C-w>j
" map <LEADER>wk <C-w>k
" map <LEADER>wl <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <LEADER>r :set splitright<CR>:vsplit<CR>
noremap <LEADER>l :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>u :set nosplitbelow<CR>:split<CR>
noremap <LEADER>d :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screen up and down
" noremap sh <C-w>t<C-w>K
" Place the two screens side by side
" noremap sv <C-w>t<C-w>H

" Rotate screen
" noremap srh <C-w>b<C-w>K
" noremap srv <C-w>b<C-w>H

" ===
" === Tab management
" ===
noremap <LEADER>tt :tabe<CR>
noremap <LEADER>tb :-tabnext<CR>
noremap <LEADER>tn :+tabnext<CR>

" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
  map <LEADER>fi :r !figlet

  "  Compile function 
  map r :call CompileRunGcc()<CR>
  func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'cpp'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'java'
      exec "!javac %"
      exec "!time java %<"
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      silent! exec "!clear"
      exec "!time python3 %"
    elseif &filetype == 'html'
      exec "!firefox % &"
    elseif &filetype == 'markdown'
      exec "MarkdownPreview"
      exec "echo"
    elseif &filetype == 'vimwiki'
      exec "MarkdownPreview"
    endif
  endfunc

  " map R :call CompileBuildrrr()<CR>
  " func! CompileBuildrrr()
  "   exec "w"
  "   if &filetype == 'vim'
  "     exec "source $MYVIMRC"
  "   elseif &filetype == 'markdown'
  "     exec "echo"
  "   endif
  " endfunc

  " ===
  " === Install Plugins with Vim-Plug
  " ===

  "call plug#begin('~/.vim/plugged')
  if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
  else
    call plug#begin('~/.vim/plugged')
  endif

  " Pretty Dress
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'arcticicestudio/nord-vim'
  Plug 'morhetz/gruvbox'
  Plug 'connorholyday/vim-snazzy'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'ayu-theme/ayu-vim'
  Plug 'bling/vim-bufferline'

  " File navigation
  Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

  " Taglist
  Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

  " Auto Complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Undo Tree
  Plug 'mbbill/undotree/'

  " Snippets
  "Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " LeaderF
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  "Tex
  Plug 'lervag/vimtex'
  "g:vimtex_compiler_progname = 'nvr'

  " Other visual enhancement
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'itchyny/vim-cursorword'
  Plug 'tmhedberg/SimpylFold' "The most basic commands are zc to close a fold and zo to open one. 
  Plug 'luochen1990/rainbow'

  " python
  Plug 'vim-scripts/indentpython.vim'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

  " Markdown
  Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
  "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for' :['markdown', 'vim-plug'] }
  Plug 'vimwiki/vimwiki'

  " Startify 
  Plug 'mhinz/vim-startify' " The fancy start screen for Vim


  " Bookmarks
  "Plug 'kshenoy/vim-signature'
  Plug 'MattesGroeger/vim-bookmarks' "mm to add/remove bookmark at current line
  " mn jump to next bookmark
  " mp jump to previous bookmark

  " Other useful utilities
  Plug 'gcmt/wildfire.vim' " type <Enter> to select the closest text object
  Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word` or in visual mode use S' to wrap the selected range with '' or use ySS to modify a line.
  Plug 'godlygeek/tabular' " type :Tabularize /=(:Tab/=) to align the =
  Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line;
  " <space>ci toggles the comment state of the selected line(s) individually.

  Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
  "Plug 'terryma/vim-multiple-cursors'
  Plug 'mg979/vim-visual-multi'
  Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
  Plug 'easymotion/vim-easymotion' 
  Plug 'AndrewRadev/switch.vim' "gs to switch

  call plug#end()

  "color snazzy
  "let g:SnazzyTransparent = 1
  colorscheme PaperColor

  " ===
  " === Airline
  " ===
  let g:airline_section_b = '%{strftime("%H:%M")}'
  "let g:airline_theme = 'badwolf'

  " ===
  " === Tabular
  " ===
  let g:tabular_loaded = 1
  vmap <SPACE>= :Tabularize /

  " ===
  " === Vim-visual-multi
  " ===
  "let g: VM_maps = {}
  "let g: VM_maps['Find Under'] = '<C-d>'
  "let g: VM_maps['Find Subword Under'] = '<C-d>'

  " ===
  " === Startify
  " ===
   noremap <LEADER>s :Startify<CR>

  " ===
  " === Switch
  " ===
  let g:switch_mapping = "gs" "switch 'False' and 'True'

  " ===
  " === Vim-Rainbow
  " ===
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


  " ===
  " === NERDTree
  " ===

  map <LEADER>n :NERDTreeToggle<CR>
  "let NERDTreeShowHidden=1
  "let NERDTreeMapOpenExpl = ""
  "let NERDTreeMapUpdir = ""
  "let NERDTreeMapUpdirKeepOpen = "l"
  let NERDTreeMapOpenSplit = "ss"
  let NERDTreeOpenVSplit = "sv"
  "let NERDTreeMapActivateNode = "i"
  "let NERDTreeMapOpenInTab = "t"
  "let NERDTreeMapPreview = ""
  "let NERDTreeMapCloseDir = ""
  "let NERDTreeMapChangeRoot = "R"
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " NVim will close if the only windows left open is NERDTree."


  "===
  "=== NERDTree-git
  "===
  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

  " ===
  " === CtrlP
  " ===
  map <C-p> :CtrlP<CR>

  " ===
  " === SimpylFold
  " ===
  let g:SimpylFold_docstring_preview = 1

  " ===
  " === Taglist
  " ===
  map <silent> <leader>tg :TagbarOpenAutoClose<CR>

  " ===
  " === vim-indent-guide
  " ===
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_color_change_percent = 1
  silent! unmap <LEADER>ig
  autocmd WinEnter * silent! unmap <LEADER>ig

  " ===
  " === Undotree
  " ===
  let g:undotree_DiffAutoOpen = 0
  map L :UndotreeToggle<CR>

  " ===
  " === multiple-cursors
  " ===
  "let g:multi_cursor_use_default_mapping=0

  " Default mapping
  "let g:multi_cursor_start_word_key      = '<C-n>'
  "let g:multi_cursor_select_all_word_key = '<A-n>'
  "let g:multi_cursor_start_key           = 'g<C-n>'
  "let g:multi_cursor_select_all_key      = 'g<A-n>'
  "let g:multi_cursor_next_key            = '<C-n>'
  "let g:multi_cursor_prev_key            = '<C-p>'
  "let g:multi_cursor_skip_key            = '<C-x>'
  "let g:multi_cursor_quit_key            = '<Esc>'

  " ===
  " === vim-table-mode
  " ===
  map <LEADER>tm :TableModeToggle<CR>
  let g:table_mode_corner='|'

  " ===
  " === MarkdownPreview
  " ===
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 1
  let g:mkdp_refresh_slow = 0
  let g:mkdp_command_for_global = 0
  let g:mkdp_open_to_the_world = 0
  let g:mkdp_open_ip = ''
  let g:mkdp_browser = ''
  let g:mkdp_echo_preview_url = 0
  let g:mkdp_browserfunc = ''
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1
      \ }
  let g:mkdp_markdown_css = ''
  let g:mkdp_highlight_css = ''
  let g:mkdp_port = ''
  let g:mkdp_page_title = '「${name}」'


  " ===
  " === vimwiki
  " ===
  let g:vimwiki_list = [{
    \ 'automatic_nested_syntaxes':1,
    \ 'path_html': '~/wiki_html',
    \ 'path': '~/wiki',
    \ 'template_path': '~/.vim/vimwiki/template/',
    \ 'syntax': 'markdown',
    \ 'ext':'.md',
    \ 'template_default':'markdown',
    \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
    \ 'template_ext':'.html'
  \}]

  au BufRead,BufNewFile *.md set filetype=vimwiki

  let g:taskwiki_sort_orders={"C": "pri-"}
  let g:taskwiki_syntax = 'markdown'
  let g:taskwiki_markdown_syntax='markdown'
  let g:taskwiki_markup_syntax='markdown'
  source ~/.config/nvim/snippits.vim


  " ===
  " === LeaderF
  " ===
  " don't show the help in normal mode
  let g:Lf_HideHelp = 1
  let g:Lf_UseCache = 0
  let g:Lf_UseVersionControlTool = 0
  let g:Lf_IgnoreCurrentBufferName = 1
  " popup mode
  let g:Lf_WindowPosition = 'popup'
  let g:Lf_PreviewInPopup = 1
  let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
  let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

  let g:Lf_ShortcutF = "<leader>ff"
  noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
  noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
  noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
  noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" ===
" === Coc-nvim
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if

" install
let g:coc_global_extensions = [
  \'coc-json', 
  \'coc-vimlsp',
  \'coc-python',
  \'coc-clangd',
  \'coc-highlight',
  \'coc-snippets']


"let g:coc_global_extensions = ['coc-ccls', 'coc-css', 'coc-java', 'coc-python', 'coc-r-lsp', 'coc-emmet', 'coc-yank', 'coc-texlab', 'coc-lsp-wl', 'coc-markdownlint', 'coc-spell-checker', 'coc-highlight', 'coc-snippets']

" if hidden is not set, TextEdit might fail.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif


" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]	=~# '\s'
endfunction

" Use <C-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :"\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>h to show documentation in preview window
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <LEADER>rn <Plug>(coc-rename)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-n> for select text for visual placeholder of snippet.
vmap <C-n> <Plug>(coc-snippets-select)

" Use <C-n> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'

" Use <C-p> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-p>'

" Use <C-n> for both expand and jump (make expand higher priority.)
imap <C-n> <Plug>(coc-snippets-expand-jump)



" ===
" === Ultisnips
" ===
"let g:tex_flavor = "latex"
"inoremap <c-n> <nop>
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsSnippetDirectories = ['Ultisnips/']
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif
