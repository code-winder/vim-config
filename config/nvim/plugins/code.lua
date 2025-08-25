return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      local opt = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<leader>fp", "<Cmd>lua Snacks.picker.projects()<CR>", opt)

      -- LazyVim.on_load("snacks.nvim", function()
      --   local sn = require("snacks")
      --   sn.picker("projects")
      -- end)
    end,
  },
  {
    "folke/snacks.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.dashboard.preset.keys, 3, {
        action = "<Cmd>lua Snacks.picker.projects()<CR>",
        desc = "Projects",
        icon = " ",
        key = "p",
      })
    end,
  },
  {
    "airblade/vim-rooter",
    opts = {},
    -- event = "VeryLazy",
    --- 设置vim的工作目录，便于fzf搜索
    config = function(_, opts)
      vim.cmd([[
      let g:rooter_patterns = ['.git', 'Makefile']
      let g:rooter_silent_chdir = 1
      ]])
    end,
  },
  {
    "wlemuel/vim-tldr",
    --- 简明的文档搜索，比 Man 更容易懂，但可能不全面
    --- 终端可以安装 tldr，对于vim，只需要安装本插件就行
    --- Run :Tldr [command] to find the tldr of command.
    --- Run :TldrUpdateDocs to get or update tldr docs.
    --- 如果查不到，可以先尝试用 Man 命令，如果不好理解，可以用 :TldrUpdateDocs 更新，
    --- 再用 Tldr 命令
    --- Tldr 命令不好记，用 Ask 作为别名
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd("command -nargs=* Ask Tldr <args>")
    end,
  },
  {
    "pseewald/vim-anyfold",
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      set foldmethod=manual
      autocmd Filetype * AnyFoldActivate
      set foldlevel=999  " 0-close all folds; 1-close one fold
      ]])
    end,
  },
  {
    "tpope/vim-commentary",
    --- Comment stuff out.
    --- Use gcc to comment out a line (takes a count),
    --- gc to comment out the target of a motion (for example, gcap to comment out a paragraph),
    --- gc in visual mode to comment out the selection,
    --- and gc in operator pending mode to target a comment.
    --- You can also use it as a command, either with a range like :7,17Commentary,
    --- or as part of a :global invocation like with :g/TODO/Commentary. That's it.
    opt = {},
    event = "VeryLazy",
  },
  {
    "SirVer/ultisnips",
    opt = {},
    event = "VeryLazy",
  },
  {
    "honza/vim-snippets",
    dependencies = { "SirVer/ultisnips" },
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      let g:UltiSnipsExpandTrigger = "<tab>"
      let g:UltiSnipsJumpForwardTrigger = "<tab>"
      let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
      ]])
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opt = {},
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    --- 类似 git log -p
    --- The current branch: :DiffviewFileHistory
    --- 只取部分提交实例：:DiffviewFileHistory --range=分支1..分支2
    --- The current file: :DiffviewFileHistory %
    --- 类似 git diff
    --- :DiffviewOpen diff参数(如分支名)
    --- 其他
    --- :DiffviewClose: Close the current diffview. You can also use :tabclose.
    --- :DiffviewToggleFiles: Toggle the file panel.
    --- :DiffviewFocusFiles: Bring focus to the file panel.
    --- :DiffviewRefresh: Update stats and entries in the file list of the current Diffview.
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      command -nargs=* GitLog DiffviewFileHistory <q-args>
      command -nargs=* GitDiff DiffviewOpen <q-args>
      command GitClose DiffviewClose
      ]])
    end,
  },
}
