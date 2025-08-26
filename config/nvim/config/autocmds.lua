-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

--- 保存文件时候自动去除行尾空格
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.md", "*.go" },
  callback = function()
    vim.cmd(":%s/s+$//e")
  end,
})

-- 根据不同的场景显示行号
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  pattern = { "*" },
  callback = function()
    if vim.o.number and vim.fn.mode() ~= "i" then
      vim.o.relativenumber = true
    end
  end,
})

--- 记住上次文件打开位置
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  filetype plugin indent on

  " 定义一个 DiffOrig 命令用于查看文件改动
  if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
  endif
]])

--- 定义文件跳转函数
vim.cmd([[
  " 对于有文件内容的，也可以用 :Ack 命令搜索定位到文件
  " 对于单独窗口打开光标下的文件，可使用 <ctrl-w>f
  " NOTE gx 打开链接
  nmap gf :call Gf()<CR>

  function! Gf() abort
  let line = getline('.')
  let srcFile = expand('<cfile>')
  let lst = split(trim(line, strpart(line, 0, stridx(line, srcFile))), ":")

  let row = 0
  if len(lst) > 1 
  let row = str2nr(lst[1])
  endif

  execute 'wincmd k'

  " 完整路径
  if filereadable(srcFile)
  execute 'e +' .  row . ' ' . srcFile
  return
  endif

  " 相对路径
  let result = split(execute('!find **/' . srcFile), "\n")
  let count = 0

  let file = srcFile
  let files = "gf cmd find file:"

  for it in result
  if len(it) > 0 && it[0] != ":" && filereadable(it)
  let count += 1
  let file = it
  let files = files . "\n" . it . ':' . row . ':0'
  endif
  endfor

  " 只有一个文件
  if count == 1
  execute 'e +' . row . ' ' . file
  return
  endif

  if count == 0 
  echo("not file")
  return
  endif

  " 有多个文件
  execute 'AsyncRun! -strip echo "' . files . '"'
  endfunction
  ]])
