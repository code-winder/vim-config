return {
  {
    "dewyze/vim-tada",
    --- TODO-任务管理
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      let g:tada_todo_style = 'ascii'
      let g:tada_todo_pane_file = $HOME . '/Tadafile'
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
      ]])
    end,
  },
  {
    "skywind3000/asyncrun.vim",
    opt = {},
    event = "VeryLazy",
  },
  {
    "skywind3000/asynctasks.vim",
    --- asynctasks.vim uses a .tasks file in your project folders for local tasks and uses ~/.vim/tasks.ini to define global tasks for generic projects
    --- we can use :AsyncTaskEdit command to edit the .tasks configuration file in your current project root directory
    dependencies = { "skywind3000/asyncrun.vim" },
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      " 使用 Make 命令即可实现 Makefile 中指定的操作
      " 建议使用 :AsyncTask 更简单灵活
      command -nargs=* Make AsyncRun make <q-args>
      " 打开输出窗口
      let g:asyncrun_open = 8 " 打开的窗口行数，即窗口高度
      ]])
    end,
  },
}
