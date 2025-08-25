-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.rtp:append("$HOME/.fzf")

--------------------
--- 基础配置
-------------------

--- 突出显示当前行
vim.o.cursorline = true
vim.o.wildmode = "list:longest,full"

--- 设置 tab
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

--- 更新延时时间，默认是 4000 毫秒， 会感觉到延时，所以设置短一点
vim.o.updatetime = 300
--- Always show the signcolumn, otherwise it would shift the text each time
--- diagnostics appear/become resolved.
vim.o.signcolumn = "yes"

--- 设置 Backspace 键模式
vim.o.backspace = "indent,eol,start"
--- 自动缩进
vim.o.autoindent = true
--- 打开 C/C++ 语言缩进优化
vim.o.cindent = true
--- 关闭自动换行
vim.o.wrap = false
--- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
vim.o.ttimeout = true
--- 功能键超时检测 50 毫秒
vim.o.ttimeoutlen = 50
--- 显示光标位置
vim.o.ruler = true
--- 语法高亮
vim.o.syntax = "ON"
--- 显示行号
vim.o.number = true

--------------------
--- 搜索设置
-------------------

--- 搜索时忽略大小写
vim.o.ignorecase = true
--- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.o.smartcase = true
--- 不高亮搜索内容
vim.o.hlsearch = false
--- 查找输入时动态增量显示查找结果
vim.o.incsearch = true

--------------------
--- 编码设置
-------------------

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"

--------------------
--- 其他设置
-------------------

--- 关闭按键命令显示闪烁
vim.o.showcmd = false
--- 显示匹配的括号
vim.o.showmatch = true
--- 显示括号匹配的时间
vim.o.matchtime = 2
--- 显示最后一行
vim.o.display = "lastline"
--- 允许下方显示目录
vim.o.wildmenu = true
--- 延迟绘制（提升性能）
vim.o.lazyredraw = false
--- 错误格式
-- vim.o.errorformat = vim.o.errorformat + "[%f:%l] -> %m,[%f:%l]:%m"
--- 设置分隔符可视
vim.o.listchars = "tab:| ,trail:.,extends:>,precedes:<"
--- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
--- 或者 Vim 当前目录包含 .tags 文件
vim.o.tags = "./.tags;,.tags"
--- 如遇Unicode值大于255的文本，不必等到空格再折行
-- vim.o.formatoptions = vim.o.formatoptions + "m"
--- 合并两行中文时，不在中间加空格
-- vim.o.formatoptions = vim.o.formatoptions + "B"
--- 文件换行符，默认使用 unix 换行符
vim.o.ffs = "unix,dos,mac"

--------------------
--- 代码折叠设置
-------------------

vim.o.foldenable = true
--- 代码折叠默认使用缩进
vim.o.fdm = "indent"
--- 默认打开所有缩进
vim.o.foldlevel = 99

--------------------
--- 备份设置
-------------------

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = false
