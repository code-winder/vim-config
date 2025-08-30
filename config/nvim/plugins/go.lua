return {
  {
    "buoto/gotests-vim",
    --- 模版一
    --- 该 templates 来自git仓库 dotLou/goteststemplates
    --- 用 testtify 的 require 包，某个test函数失败就立马停止
    --- let g:gotests_template_dir = '$HOME/.vim/go-tests-template/goteststemplates/templates'
    --- 模版二
    --- 该 templates 来自git仓库 ras0q/gotests-template
    --- 用 https://github.com/google/go-cmp 包做断言
    --- 需要在 templates2 的header.tmpl 把 cmp 的包路径添加进去
    --- Call :GoTests to generate a test for the function at the current line or functions selected in visual mode.
    --- Call :GoTestsAll to generate tests for all functions in the current buffer.
    opt = {},
    event = "VeryLazy",
    config = function(_, opts)
      vim.cmd("let g:gotests_template_dir = $HOME . '/.vim/gotests-template/templates2'")
    end,
    cmd = { "GoTests", "GoTestsAll" },
  },
  {
    "charlespascoe/vim-go-syntax",
    --- 加强版 go 语法高亮
    --- 打开第一个文件会没有高亮，可以用命令 :e 生效
    --- 或者跳转也可以重新渲染高亮
    --- NOTE: 在lazyvim中没有任何效果，已经disable
    opt = {},
    event = "VeryLazy",
  },
  {
    "saghen/blink.cmp",
    --- 对没有import的包进行补全
    dependencies = {
      { "samiulsami/cmp-go-deep", dependencies = { "kkharji/sqlite.lua" } },
      { "saghen/blink.compat" },
    },
    opts = {
      sources = {
        default = {
          "go_deep",
        },
        providers = {
          go_deep = {
            name = "go_deep",
            module = "blink.compat.source",
            min_keyword_length = 3,
            max_items = 5,
            ---@module "cmp_go_deep"
            ---@type cmp_go_deep.Options
            opts = {
              -- See below for configuration options
            },
          },
        },
      },
    },
  },
  {
    "fang2hou/go-impl.nvim",
    --- 对所在结构体给出某个 interface 的空实现，比如json编解码
    cmd = { "GoImplOpen" },
    ft = "go",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {},
    keys = {
      {
        "<cmd>GoImpl",
        function()
          require("go-impl").open()
        end,
        mode = { "n" },
        desc = "Go Impl",
      },
    },
  },
  {
    "zgs225/gomodifytags.nvim",
    --- 对struct中可导出字段添加tag
    cmd = { "GoAddTags", "GoRemoveTags", "GoInstallModifyTagsBin" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    build = "go install github.com/fatih/gomodifytags@latest",
  },
  {
    "fredrikaverpil/godoc.nvim",
    --- 查找或显示 go doc
    version = "*",
    dependencies = {
      -- { "nvim-telescope/telescope.nvim" }, -- optional
      { "folke/snacks.nvim" }, -- optional
      -- { "echasnovski/mini.pick" }, -- optional
      { "ibhagwan/fzf-lua" }, -- optional
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          ensure_installed = { "go" },
        },
      },
    },

    build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
    cmd = { "GoDoc" }, -- optional
    opts = {}, -- see further down below for configuration
  },
  {
    "maxandron/goplements.nvim",
    --- 在 interface 名称后显示其所有实现者
    ft = "go",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "crusj/hierarchy-tree-go.nvim",
    --- 展示调用树，在查问题或阅读代码时很管用
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      icon = {
        fold = "", -- fold icon
        unfold = "", -- unfold icon
        func = "₣", -- symbol
        last = "☉", -- last level icon
      },
      hl = {
        -- current_module = "guifg=Green", -- highlight cwd module line
        -- others_module = "guifg=Black", -- highlight others module line
        -- cursorline = "guibg=Gray guifg=White", -- hl  window cursorline
      },
      keymap = {
        --global keymap
        incoming = "<localleader>fi", -- call incoming under cursorword
        outgoing = "<localleader>fo", -- call outgoing under cursorword
        open = "<localleader>ho", -- open hierarchy win
        close = "<localleader>hc", -- close hierarchy win
        -- focus: if hierarchy win is valid but is not current win, set to current win
        -- focus: if hierarchy win is valid and is current win, close
        -- focus  if hierarchy win not existing,open and focus
        focus = "<localleader>fu",

        -- bufkeymap
        expand = "o", -- expand or collapse hierarchy
        jump = "<CR>", -- jump
        move = "<space><space>", -- switch the hierarchy window position, must be current win
      },
    },
  },
  {
    "code-winder/go-fillstruct-vim",
    cmd = { "GoFillStruct" },
  },
  {
    "code-winder/go.nvim",
    --- go 工具集，很多以 Go 打头的命令
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require("go").setup(opts)
      --- 注释掉下面的语句，为了防止 import 两次（与lazyvim自带的冲突了）
      -- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.go",
      --   callback = function()
      --     require("go.format").goimports()
      --   end,
      --   group = format_sync_grp,
      -- })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
