return {
  {
    --- tmux和vim中tab之间的跳转
    --- tmux.conf也要做相应配置，具体参考插件说明
    --- 更详细的tmux配置需要根据github仓库 gpakosz/.tmux
    --- <ctrl-h> => Left
    --- <ctrl-j> => Down
    --- <ctrl-k> => Up
    --- <ctrl-l> => Right
    --- <ctrl-\> => Previous split
    "christoomey/vim-tmux-navigator",
    opt = {},
    event = "VeryLazy",
  },
  {
    "HustLion/q-quit",
    opt = {},
    config = function(_, opts)
      vim.cmd("let g:q_quit_close_when_only_one_window = 1")
    end,
  },
  {
    "kshenoy/vim-signature",
    ---  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
    ---  m<Space>     Delete all marks from the current buffer
    ---  m<BS>        Remove all markers
    ---  m/           Open location list and display marks from current buffer（也可以借助fzf的 :Marks 命令，但弹窗不好用）
    opt = {},
    event = "VeryLazy",
  },
  {
    "brglng/vim-im-select",
    --- 中英文输入法自动切换
    --- 需要安装 im-select（安装方法参看其github仓库 https://github.com/daipeihust/im-select）
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      let g:im_select_default = 'com.apple.keylayout.ABC'   " The default value on macOS
      let g:im_select_enable_cmd_line = 0
      ]])
    end,
  },
  {
    "mbbill/undotree",
    --- 修改undo，和git互补使用
    --- 为lazyvim的 <leader>su 搜索 undo 提供持久化支持，否则一关就没有undo
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      --- 简化 undo 命令输入
      vim.cmd("command Undo UndotreeToggle")
    end,
  },
  {
    "junegunn/vim-peekaboo",
    --- vim寄存器管理
    --- Peekaboo will show you the contents of the registers on the sidebar when you
    --- hit " or @ in normal mode or <CTRL-R> in insert mode. The sidebar is
    --- automatically closed on subsequent key strokes."
    opt = {},
    event = "VeryLazy",
  },
  {
    "t9md/vim-quickhl",
    --- 着重显示当前 word，和高亮感兴趣的 word
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      let g:quickhl_cword_enable_at_startup = 1
      autocmd VimEnter * hi QuickhlCword gui=underline cterm=underline term=underline
      nmap <localleader>k <Plug>(quickhl-manual-this-whole-word)
      xmap <localleader>k <Plug>(quickhl-manual-this-whole-word)
      nmap <localleader>K <Plug>(quickhl-manual-reset)
      vmap <localleader>K <Plug>(quickhl-manual-reset)
      ]])
    end,
  },
}
