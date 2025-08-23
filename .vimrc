" ===========================================
" vim常见高效操作
" ===========================================
" NOTE :terminal 打开终端，适合长时间使用。
" 进入normal模式，编译光标移动和内容拷贝搜索等
" tnoremap <Esc> <C-\><C-n>
" <C-\><C-N> to return to normal mode.
" <C-\><C-O> to execute one normal mode command and then return to terminal
" NOTE :edit term://make lint 或者 :vsp term://make lint 等适合一次性运行看结果
" NOTE terminal 如何改变窗口大小？实际上，其依赖buff，默认在当前buf打开，因此
" 只要事先准备好指定大小的buf之后，在打开terminal，相当于就指定了终端窗口大小。
" 另外，该终端窗口相当于一个buf，可以像其他buf一样进行操作(事先把terminal置于
" normal mode状态)
" NOTE 长时间使用的terminal一般最好只有一个，因为其buf命令不友好，很难区分。
" 一次性的可以有多个，可以通过 term:// 后面的命令来区分
" NOTE terminal 虽然好用，但还是不能替代 make 或 Make 之类的能借助 quickfix
" 来定位跳转功能的命令
" NOTE terminal 进入 normal mode 之后可以使用 gf 命令跳转到文件;;也可以使用以
" 下命令定位到光标下文件指定行
" :e +行号 <C-R><C-F><CR>

" NOTE 快速移动光标
" k,j,h,l 上下左右
" 在当前行里面有效的移动光标: w,b,0,^,$,),(
" 函数间移动：[[, ]]
" 在整个文件里面有效移动光标: 
" ctrl+f：向下移动一屏。
" ctrl+b：向上移动一屏。
" Ctrl + d: 向下滚动半屏。
" Ctrl + u: 向上滚动半屏。
" zt或者z<CR>: 将当前行滚动到屏幕顶部。
" zz或者z.: 将当前行滚动到屏幕中部。
" zb或者z-: 将当前行滚动到屏幕底部。
" zH: 向左滚动窗口半屏
" zL: 向右滚动窗口半屏
" %: 移动到文件% 所在位置
" x%: 移动到文件x%的位置，比如 50%
" G：到文件尾
" numG：移动光标到指定的行（num）。（比如10G就是到第10行）
" gg：到文件首
" H：移动光标到屏幕上面
" M：移动光标到屏幕中间
" L：移动光标到屏幕下面
" *：读取光标处的字符串，并且移动光标到它再次出现的地方。
" #：和上面的类似，但是是往反方向寻找。
" /text：从当前光标处开始搜索字符串text，并且到达text出现的地方。必须使用回车来开始这个搜索命令。如果想重复上次的搜索的话，按n。
" ？text：和上面类似，但是是反方向。
" ma：在当前光标的位置标记一个书签，名字为a。书签名只能是小写字母。你看不见书签的存在，但它确实已经在那里了。
" `a：到书签a处。注意这个不是单引号，它一般位于大部分键盘的1的左边。
" `.：到你上次编辑文件的地方。这个命令很有用，而且你不用自己去标记它。

" NOTE 快速切换窗格
" Ctrl + w + p：移动到前一个访问的窗口（在代码CR时非常好用）
" Ctrl + w + w：这个命令会在所有窗口中循环移动

" NOTE 移动窗格
" ctrl-W 将当前窗口放到新的标签页
" ctrl-Wr	向右或向下循环移动窗口
" ctrl-WR	向左或向上循环移动窗口
" ctrl-Wx	将当前窗口与下一窗口位置对换

" NOTE 窗格大小调整
" ctrl+w + 纵向扩大（行数增加）
" Ctrl+W_ 最大化窗口高度	
" Ctrl+W| 最大化窗口宽度	
" ctrl+w - 纵向缩小 （行数减少）
" Ctrl + W + < ：将当前窗口的宽度减少
" Ctrl + W + > ：将当前窗口的宽度增加
" ctrl+W= 将几个窗口的大小变为相等
" :resize +3将增大窗口高度3行；:resize -3将减少窗口高度3行；:resize 3则将精确指定窗口高度为3行
" :vertical resize +3将增大窗口宽度3列；:vertical resize -3将减少窗口宽度3列；:vertical resize 3则将精确指定窗口宽度为3列

" NOTE 分割窗口
" :sp 或 :split [filename] 在当前窗口上方创建一个新窗口，并可以选择打开指定文件。
" :vsp 或 :vsplit [filename] 在当前窗口左侧创建一个新窗口，并可以选择打开指定文件。
" ctrl+w ctrl-] 上下分割跳转

" NOTE 新建窗口
" control + w + v：在当前窗口的左边或右边新建窗口
" control + w + s：在当前窗口的上边或下边新建窗口

" NOTE 关闭窗口
" control + w + c：关闭当前窗口
" control + w + q：关闭当前窗口
" control + w + o：保留当前窗口，关闭其他所有窗口

" NOTE vim 底部命令行快捷操作
" ctrl-u 删除光标前的所有字符
" ctrl-w 清除一个word
" ctrl-c 中断命令执行
" ctrl-e 移动到命令行末尾
" ctrl-shift-a 移动到命令行首
" ctrl-r ctrl-w 复制buff中的word到命令行
" :make 参数   可以执行make命令，然后 :cw 打开 quickfix list 窗口显示错误
" :lmake 参数   可以执行make命令，然后 :lopen 打开 location list 窗口显示错误

" ===========================================
" 插件集合
" NOTE 插件够用就行，不可求多，因为会影响启动速度，不同插件之间可能相互干扰，
" 出现莫名奇妙的问题
" ===========================================
call plug#begin()
" NOTE 插件所依赖的组件是否正常，可以通过neovim的 :checkhealth 命令检查
" NOTE 对于neovim，需要将 .config/nvim/init.vim 软链到 ~/.vimrc
" ~/.vim/site/autoload 软链到 .vim/autoload ，以便vim和neovim 共用 vim-plug
" 简明的文档搜索，比 Man 更容易懂，但可能不全面
" 终端可以安装 tldr，对于vim，只需要安装本插件就行
Plug 'wlemuel/vim-tldr'
" Run :Tldr [command] to find the tldr of command.
" Run :TldrUpdateDocs to get or update tldr docs.
" 如果查不到，可以先尝试用 Man 命令，如果不好理解，可以用 :TldrUpdateDocs 更新，
" 再用 Tldr 命令
" Tldr 命令不好记，用 Ask 作为别名
command -nargs=* Ask Tldr <args>

" tmux和vim中tab之间的跳转
" tmux.conf也要做相应配置，具体参考插件说明
" 更详细的tmux配置需要根据github仓库 gpakosz/.tmux
Plug 'christoomey/vim-tmux-navigator'
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split

" 用 q 快速关闭窗口或buff
Plug 'HustLion/q-quit'
let g:q_quit_close_when_only_one_window = 1

" marks 的可视化
Plug 'kshenoy/vim-signature'
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m<Space>     Delete all marks from the current buffer
"  m<BS>        Remove all markers
"  m/           Open location list and display marks from current buffer（也可以借助fzf的 :Marks 命令，但弹窗不好用）

" 中英文输入法自动切换
" 需要安装 im-select（安装方法参看其github仓库 https://github.com/daipeihust/im-select）
Plug 'brglng/vim-im-select'
let g:im_select_default = 'com.apple.keylayout.ABC'   " The default value on macOS
let g:im_select_enable_cmd_line = 0

" TODO-任务管理
Plug 'dewyze/vim-tada'
let g:tada_todo_style = 'ascii'
let g:tada_todo_pane_file = '$HOME/Tadafile'
"- Topics:
"  > 本插件的使用说明
"  > \td 打开或关闭todo窗口（也可以用命令 :TadaTodo）
"  > 命令 :TadaBox 可以添加或取消括号 []
"  > <space> 变更事项的进度状态
"  > <Enter> 折叠或展开 Topics
"  - [-] 进行中
"   - [ ] 子项
"  - [ ] 未开始
"  - [x] 已完成
"  - [o] 延期，有风险
"- Topics:
"  > 新的todo组

" -------------------
" 界面或主题
" -------------------
" 启动页
Plug 'mhinz/vim-startify'

" 设置主题
" Plug 'lifepillar/vim-solarized8'
" autocmd vimenter * ++nested colorscheme solarized8_high
" let g:solarized_termcolors=256
" let g:solarized_statusline = "flat"
" let g:solarized_visibility = "high"
" let g:solarized_diffmode = "high"

" neovim 用到的vscode主题
Plug 'Mofiqul/vscode.nvim'
" vim 用到的vscode主题
Plug 'tomasiser/vim-code-dark'
" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
set background=dark

if has("nvim")
  autocmd vimenter * ++nested colorscheme vscode
else
  " If you don't like many colors and prefer the conservative style of the
  " standard Visual Studio
  " let g:codedark_conservative=1
  " If you like the new dark modern colors (Needs feedback!)
  let g:codedark_modern=1
  " Activates italicized comments (make sure your terminal supports italics)
  let g:codedark_italics=1
  " Make the background transparent
  " let g:codedark_transparent=1
  autocmd vimenter * ++nested colorscheme codedark
endif

" -------------------
" 搜索或快速移动
" -------------------
" 搜索加快速移动
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" 设置vim的工作目录，便于fzf搜索
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git', 'Makefile']
let g:rooter_silent_chdir = 1

" 强大的搜索插件
" 按照该项目的说明，安装好其依赖的组件，比如 delta
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" :cabbrev Rg Rg <C-R>=expand("<cword>")<CR><CR>
" :Files [PATH]    Files (runs $FZF_DEFAULT_COMMAND if defined)
" :GFiles [OPTS]    Git files (git ls-files)
" :Buffers    Open buffers
" :Jumps    Jumps
" :Snippets    Snippets (UltiSnips)
" :Commits [LOG_OPTS]    Git commits (requires fugitive.vim)
" :BCommits [LOG_OPTS]    Git commits for the current buffer; visual-select lines to track changes in the range
" :Commands    Commands
" :Maps    Normal mode mappings
" cd <Ctrl-T> 在终端可以直接进入选择的路径
" <Ctrl-R> 可以选择历史命令执行
" **<tab> 可以补充目录或文件，比如 cd **<tag>, vim **<tab>

" ctrl-p, ctrl-n 滚动右侧窗口，一般是文件内容预览
" Shift + 方向键 滚动预览窗口的文件内容
let $FZF_DEFAULT_OPTS="--bind 'ctrl-n:preview-down,ctrl-p:preview-up'"

" Build a quickfix list when multiple files are selected
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-x': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" TODO/NOTE/FIXME 等展示
command Todo Ag '// TODO|// FIXME|// NOTE|// TEST|// BUG|// HACK| // CHANGED| // OPTIMIZE| // REVIEW'
autocmd BufEnter * :syntax match myTodo /\v.<(TODO|FIXME|NOTE|BUG|TEST|BUG|HACK|CHANGED|OPTIMIZE|REVIEW)/hs=s+1 containedin=.*Comment
autocmd BufEnter * :hi link MyTodo Todo

command Ack :silent call ACK()
function! ACK() abort
  let word = trim(expand("<cword>"))
  execute 'Ag ' . word
endfunction

Plug 'mike-hearn/vim-combosearch'
" 也可以 Run it directly with :ComboSearch
" 没有预览功能，只有文件名和匹配内容所在行
" 想有预览功能还得使用 fzf 的 :Files 或者 :Ag 或者 :Ack 命令
let g:combosearch_trigger_key = "<c-p>"
" 本函数只适合有完整路径的文件打开
" 如果没有完整路径，则可以借助fzf的 :Files 命令，以及文件名复制拷贝然后搜索
" 对于有文件内容的，也可以用 :Ack 命令搜索定位到文件
" 对于单独窗口打开光标下的文件，可使用 <ctrl-w>f
" NOTE gx 打开链接
nmap gf :call Gf()<CR>

function! Gf() abort
  let line = getline('.')
  let file = expand('<cfile>')
  let lst = split(trim(line, strpart(line, 0, stridx(line, file))), ":")

  let row = 0
  if len(lst) > 1 
    let row = str2nr(lst[1])
  endif

  execute 'wincmd k'

  " 完整路径
  if filereadable(file)
    execute 'e +' .  row . ' ' . file
    return
  endif

  " 相对路径
  let result = split(execute('!find **/' . file . '*'), '\n')
  let count = 0
  for it in result
    if len(it) > 0 && it[0] != ":" && filereadable(it)
      let file = it
      let count += 1
    endif
  endfor

  " 查找的结果只有一个合法文件
  if count == 1
    execute 'e +' . row . ' ' . file
    " execute 'find +' . row . ' **/' . file . '*'
    return
  endif

  " 有多个文件或者不是文件
  " 依赖插件 mike-hearn/vim-combosearch 
  execute 'ComboSearch ' . file
endfunction


" -------------------
" code和Review 
" -------------------
" 异步执行make等命令
Plug 'skywind3000/asynctasks.vim'
" asynctasks.vim uses a .tasks file in your project folders for local tasks and uses ~/.vim/tasks.ini to define global tasks for generic projects 
" we can use :AsyncTaskEdit command to edit the .tasks configuration file in your current project root directory
Plug 'skywind3000/asyncrun.vim'
" 使用 Make 命令即可实现 Makefile 中指定的操作
" 建议使用 :AsyncTask 更简单灵活
command -nargs=* Make AsyncRun make <q-args>
" 打开输出窗口
let g:asyncrun_open = 8 " 打开的窗口行数，即窗口高度

"\q绑定将切换quickfix窗口，而\l绑定将切换位置列表窗口
Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>p'

" 修改undo，和git互补使用
Plug 'mbbill/undotree'
" 简化 undo 命令输入
command Undo UndotreeToggle

" 代码折叠
Plug 'pseewald/vim-anyfold'
set foldmethod=manual
autocmd Filetype * AnyFoldActivate
set foldlevel=1  " 0-close all folds; 1-close one fold
" set foldlevel=99 " Open all folds
" za    # 切换(alternative)折叠状态,只能用在已折叠/未折叠的行
" zR    # 展开所有折叠
" zM    # 收缩所有折叠

" 着重显示当前 word
Plug 't9md/vim-quickhl'
let g:quickhl_cword_enable_at_startup = 1
autocmd VimEnter * hi QuickhlCword gui=underline cterm=underline term=underline
nmap <leader>k <Plug>(quickhl-manual-this-whole-word)
xmap <leader>k <Plug>(quickhl-manual-this-whole-word)
nmap <leader>K <Plug>(quickhl-manual-reset)
vmap <leader>K <Plug>(quickhl-manual-reset)

Plug 'nvim-tree/nvim-web-devicons'
Plug 'sindrets/diffview.nvim'
command -nargs=* GitLog DiffviewFileHistory <q-args>
command -nargs=* GitDiff DiffviewOpen <q-args>
command GitClose DiffviewClose
" 类似 git log -p
" The current branch: :DiffviewFileHistory
" 只取部分提交实例：:DiffviewFileHistory --range=分支1..分支2
" The current file: :DiffviewFileHistory %
" 类似 git diff
" :DiffviewOpen diff参数(如分支名)
" 其他
" :DiffviewClose: Close the current diffview. You can also use :tabclose.
" :DiffviewToggleFiles: Toggle the file panel.
" :DiffviewFocusFiles: Bring focus to the file panel.
" :DiffviewRefresh: Update stats and entries in the file list of the current Diffview.

" vim寄存器管理
Plug 'junegunn/vim-peekaboo'
" Peekaboo will show you the contents of the registers on the sidebar when you
" hit " or @ in normal mode or <CTRL-R> in insert mode. The sidebar is
" automatically closed on subsequent key strokes."

" -------------------
" 代码编写或补全
" -------------------
" 代码注释插件
Plug 'tpope/vim-commentary'
" Comment stuff out. 
" Use gcc to comment out a line (takes a count), 
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, 
" and gc in operator pending mode to target a comment. 
" You can also use it as a command, either with a range like :7,17Commentary, 
" or as part of a :global invocation like with :g/TODO/Commentary. That's it.

" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" 成对的符号补全
Plug 'jiangmiao/auto-pairs'

" 括号快速成对跳转
Plug 'andymass/vim-matchup'
" % 最近括号
" z% 括号内部
" [% 或 ]% 跳转花括号

" Go 语言相关的插件
Plug 'buoto/gotests-vim'
" 模版一
" 该 templates 来自git仓库 dotLou/goteststemplates
" 用 testtify 的 require 包，某个test函数失败就立马停止 
" let g:gotests_template_dir = '$HOME/.vim/go-tests-template/goteststemplates/templates'
" 模版二
" 该 templates 来自git仓库 ras0q/gotests-template
" 用 https://github.com/google/go-cmp 包做断言
let g:gotests_template_dir = '$HOME/.vim/gotests-template/templates2'
" Call :GoTests to generate a test for the function at the current line or functions selected in visual mode.
" Call :GoTestsAll to generate tests for all functions in the current buffer.

Plug 'benmills/vim-golang-alternate'
" :A will open the current file's tests or the current test's implementation based on what is currently opened.
" :AS will act the same as :A but will move the current file to a new buffer in a split.
" :AV will act the same as :AS but with a vertical split.

" 命令以 Go 打头
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:godef_split=2
" gd "新的buf
" gv "左侧打开
autocmd FileType go nmap <buffer> gv <Plug>(go-def-vertical) 
" gs 上方打开
autocmd FileType go nmap <buffer> gs <Plug>(go-def-split)
" gt "新窗口打开
" autocmd FileType go nmap <buffer> gt <Plug>(go-def-tab)
" autocmd FileType go nmap <buffer> gd <Plug>(go-def)
" 替代方案：
" gr 会就近上下屏显示跳转，同时显示所有引用的文件，比较直观
" :GoRef 打开所有引用或定义所在文件，按 p 进行预览，然后 up/down one text line: Ctrl-k, Ctrl-j

" 加强版 go 语法高亮
" 打开第一个文件会没有高亮，可以用命令 :e 生效
" 或者跳转也可以重新渲染高亮
Plug 'charlespascoe/vim-go-syntax'

" coc 插件及其配置
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" 用 CocInstall 安装 coc-go, coc-json, coc-highlight, coc-clangd, coc-syntax,
" coc-snippets, coc-rust-analyzer, coc-tsserver, coc-git
" 选中，默认是回车，改成了 TAB
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" 显示git分支名称，借助lightline
Plug 'itchyny/vim-gitbranch'
" 状态栏显示函数名称, 借助lightline
Plug 'tyru/current-func-info.vim'
" 状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
" 该插件很容易定制
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitroot','gitbranchName', 'filename', 'funcname' ] ],
      \   'right': [[ 'lineinfo' ], ['percent'], ['filetype','fileformat', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'gitroot': 'LightlineGitRoot',
      \   'gitbranchName': 'gitbranch#name',
      \   'filename': 'LightlineFilename',
      \   'funcname': 'LightlineEchoFunc',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

if has("nvim")
  " 当用 colorscheme solarized-osaka 或者 lifepillar/vim-solarized8 主题时，需要下面的语句
  " let g:lightline.colorscheme = "PaperColor"
endif

function! LightlineGitRoot()
  " 插件 airblade/vim-rooter 提供了以下函数
  let plist = split(FindRootDirectory(), "/")
  if len(plist) > 0
  return plist[len(plist)-1]
  endif
  return ""
endfunction

function! LightlineEchoFunc()
  return cfi#format("%s()", "")
endfunction

function! LightlineModified()
  return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%F')
  return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
        \ &ft ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft ==# 'unite' ? unite#get_status_string() :
        \ &ft ==# 'vimshell' ? vimshell#get_status_string() :
        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
        \ (fname !=# '' ? fname : '[No Name]') .
        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '^__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" 设置python3命令的路径，用which python3查看
" 供 ycm 使用
" NOTE 这里一般都需要修改，可以通过命令 :checkhealth 得到提示
let g:python3_host_prog = "/opt/homebrew/bin/python3.11"
let g:perl_host_prog = '/opt/homebrew/bin/perl'

set rtp+=~/.fzf
set rtp+=~/.vim
" 这里去掉或者替换成自己的
set rtp+=/opt/homebrew/bin


" quickfix预览文件
" 结合函数引用命令，可预览函数定义和引用
" neovim 使用该插件有问题
" Plug 'bfrg/vim-qf-preview'
" nmap <buffer> <leader>p <plug>(qf-preview-open)
" augroup qfpreview
"   autocmd!
"   autocmd FileType qf nmap <buffer> p <plug>(qf-preview-open)
" augroup END
" ----
" Scroll up/down one text line: Ctrl-k, Ctrl-j
" Scroll to first/last line of displayed buffer: Shift-Home, Shift-End
" Scroll back to error line ("reset"): r
" Close the popup window: q, Ctrl-c

call plug#end()

" ===========================================
" 基础配置
" ===========================================
" 命令行高度
set cmdheight=2

"突出显示当前行
set cursorline 
set wildmode=list:longest,full

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set guioptions-=r
set tabstop=2
set shiftwidth=2
set expandtab

" 显示行号
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set nornu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu && mode() != "i" | set rnu | endif
augroup END

" set foldmethod=syntax " 代码折叠
" 更新延时时间，默认是 4000 毫秒， 会感觉到延时，所以设置短一点
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" 保存文件时候自动去除行尾空格
autocmd BufWritePre *.md,*.go :%s/\s\+$//e

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set backspace=indent,eol,start

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler


"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 不高亮搜索内容
set nohlsearch
" set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
  " 记住上次文件打开位置
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------
"关闭按键命令显示闪烁
set noshowcmd

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif


"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif

"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')


"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 不允许备份
set nobackup
" set backup

" 保存时不备份
set nowritebackup
" set writebackup

" 备份文件地址，统一管理
" set backupdir=~/.vim/tmp

" 备份文件扩展名
" set backupext=.bak

" 创建目录，并且忽略可能出现的警告
" silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)

" 禁用交换文件
set noswapfile

" 禁用 undo文件
set noundofile

"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
	set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
  set t_Co=256
	let g:termcap_guicursor = &guicursor
	let g:termcap_t_RS = &t_RS
	let g:termcap_t_SH = &t_SH
	set guicursor=
	set t_RS=
	set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown 允许自动换行
	au FileType markdown setlocal wrap

	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	au FileType haskell setlocal et

	" quickfix 隐藏行号
	au FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END

"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>
