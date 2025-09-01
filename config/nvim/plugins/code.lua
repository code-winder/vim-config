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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>,",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>n",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      -- find
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_files()
        end,
        desc = "Find Git Files",
      },
      {
        "<leader>fp",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent",
      },
      -- git
      {
        "<leader>gb",
        function()
          Snacks.picker.git_branches()
        end,
        desc = "Git Branches",
      },
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git Log",
      },
      {
        "<leader>gL",
        function()
          Snacks.picker.git_log_line()
        end,
        desc = "Git Log Line",
      },
      {
        "<leader>gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>gS",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
      },
      {
        "<leader>gd",
        function()
          Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
      },
      {
        "<leader>gf",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
      },
      -- Grep
      {
        "<leader>sb",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>sB",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>s/",
        function()
          Snacks.picker.search_history()
        end,
        desc = "Search History",
      },
      {
        "<leader>sa",
        function()
          Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
      },
      {
        "<leader>sb",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>sc",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>sC",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>sD",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics",
      },
      {
        "<leader>sh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help Pages",
      },
      {
        "<leader>sH",
        function()
          Snacks.picker.highlights()
        end,
        desc = "Highlights",
      },
      {
        "<leader>si",
        function()
          Snacks.picker.icons()
        end,
        desc = "Icons",
      },
      {
        "<leader>sj",
        function()
          Snacks.picker.jumps()
        end,
        desc = "Jumps",
      },
      {
        "<leader>sk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sl",
        function()
          Snacks.picker.loclist()
        end,
        desc = "Location List",
      },
      {
        "<leader>sm",
        function()
          Snacks.picker.marks()
        end,
        desc = "Marks",
      },
      {
        "<leader>sM",
        function()
          Snacks.picker.man()
        end,
        desc = "Man Pages",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
      },
      {
        "<leader>sq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
      },
      {
        "<leader>sR",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>su",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undo History",
      },
      {
        "<leader>uC",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      -- LSP
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },
      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gI",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>sS",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
      -- Other
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>Z",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
        mode = { "n", "v" },
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<c-/>",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
      {
        "<c-_>",
        function()
          Snacks.terminal()
        end,
        desc = "which_key_ignore",
      },
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = "Next Reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = "Prev Reference",
        mode = { "n", "t" },
      },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
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
    --- 代码折叠
    --- za 折叠或展开一个fold
    --- zM 折叠所有
    --- zR 展开所有
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

      -- Lua
      local actions = require("diffview.actions")

      require("diffview").setup({
        diff_binaries = false, -- Show diffs for binaries
        enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
        git_cmd = { "git" }, -- The git executable followed by default args.
        hg_cmd = { "hg" }, -- The hg executable followed by default args.
        use_icons = true, -- Requires nvim-web-devicons
        show_help_hints = true, -- Show hints for how to open the help panel
        watch_index = true, -- Update views and index buffers when the git index changes.
        icons = { -- Only applies when use_icons is true.
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
          done = "✓",
        },
        view = {
          -- Configure the layout and behavior of different types of views.
          -- Available layouts:
          --  'diff1_plain'
          --    |'diff2_horizontal'
          --    |'diff2_vertical'
          --    |'diff3_horizontal'
          --    |'diff3_vertical'
          --    |'diff3_mixed'
          --    |'diff4_mixed'
          -- For more info, see |diffview-config-view.x.layout|.
          default = {
            -- Config for changed files, and staged files in diff views.
            layout = "diff2_horizontal",
            disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
            winbar_info = false, -- See |diffview-config-view.x.winbar_info|
          },
          merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = "diff3_horizontal",
            disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
            winbar_info = true, -- See |diffview-config-view.x.winbar_info|
          },
          file_history = {
            -- Config for changed files in file history views.
            layout = "diff2_horizontal",
            disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
            winbar_info = false, -- See |diffview-config-view.x.winbar_info|
          },
        },
        file_panel = {
          listing_style = "tree", -- One of 'list' or 'tree'
          tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
          },
          win_config = { -- See |diffview-config-win_config|
            position = "left",
            width = 35,
            win_opts = {},
          },
        },
        file_history_panel = {
          log_options = { -- See |diffview-config-log_options|
            git = {
              single_file = {
                diff_merges = "combined",
              },
              multi_file = {
                diff_merges = "first-parent",
              },
            },
            hg = {
              single_file = {},
              multi_file = {},
            },
          },
          win_config = { -- See |diffview-config-win_config|
            position = "bottom",
            height = 10,
            win_opts = {},
          },
        },
        commit_log_panel = {
          win_config = {}, -- See |diffview-config-win_config|
        },
        default_args = { -- Default args prepended to the arg-list for the listed commands
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {}, -- See |diffview-config-hooks|
        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            {
              "n",
              "<tab>",
              actions.select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            {
              "n",
              "<s-tab>",
              actions.select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            {
              "n",
              "[F",
              actions.select_first_entry,
              { desc = "Open the diff for the first file" },
            },
            {
              "n",
              "]F",
              actions.select_last_entry,
              { desc = "Open the diff for the last file" },
            },
            {
              "n",
              "gf",
              actions.goto_file_edit,
              { desc = "Open the file in the previous tabpage" },
            },
            { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
            { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
            { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel." } },
            {
              "n",
              "g<C-x>",
              actions.cycle_layout,
              { desc = "Cycle through available layouts." },
            },
            {
              "n",
              "[x",
              actions.prev_conflict,
              { desc = "In the merge-tool: jump to the previous conflict" },
            },
            {
              "n",
              "]x",
              actions.next_conflict,
              { desc = "In the merge-tool: jump to the next conflict" },
            },
            {
              "n",
              "<leader>co",
              actions.conflict_choose("ours"),
              { desc = "Choose the OURS version of a conflict" },
            },
            {
              "n",
              "<leader>ct",
              actions.conflict_choose("theirs"),
              { desc = "Choose the THEIRS version of a conflict" },
            },
            {
              "n",
              "<leader>cb",
              actions.conflict_choose("base"),
              { desc = "Choose the BASE version of a conflict" },
            },
            {
              "n",
              "<leader>ca",
              actions.conflict_choose("all"),
              { desc = "Choose all the versions of a conflict" },
            },
            { "n", "dx", actions.conflict_choose("none"), { desc = "Delete the conflict region" } },
            {
              "n",
              "<leader>cO",
              actions.conflict_choose_all("ours"),
              { desc = "Choose the OURS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cT",
              actions.conflict_choose_all("theirs"),
              { desc = "Choose the THEIRS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cB",
              actions.conflict_choose_all("base"),
              { desc = "Choose the BASE version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cA",
              actions.conflict_choose_all("all"),
              { desc = "Choose all the versions of a conflict for the whole file" },
            },
            {
              "n",
              "dX",
              actions.conflict_choose_all("none"),
              { desc = "Delete the conflict region for the whole file" },
            },
          },
          diff1 = {
            -- Mappings in single window diff layouts
            { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
          },
          diff2 = {
            -- Mappings in 2-way diff layouts
            { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
          },
          diff3 = {
            -- Mappings in 3-way diff layouts
            {
              { "n", "x" },
              "2do",
              actions.diffget("ours"),
              { desc = "Obtain the diff hunk from the OURS version of the file" },
            },
            {
              { "n", "x" },
              "3do",
              actions.diffget("theirs"),
              { desc = "Obtain the diff hunk from the THEIRS version of the file" },
            },
            { "n", "g?", actions.help({ "view", "diff3" }), { desc = "Open the help panel" } },
          },
          diff4 = {
            -- Mappings in 4-way diff layouts
            {
              { "n", "x" },
              "1do",
              actions.diffget("base"),
              { desc = "Obtain the diff hunk from the BASE version of the file" },
            },
            {
              { "n", "x" },
              "2do",
              actions.diffget("ours"),
              { desc = "Obtain the diff hunk from the OURS version of the file" },
            },
            {
              { "n", "x" },
              "3do",
              actions.diffget("theirs"),
              { desc = "Obtain the diff hunk from the THEIRS version of the file" },
            },
            { "n", "g?", actions.help({ "view", "diff4" }), { desc = "Open the help panel" } },
          },
          file_panel = {
            {
              "n",
              "j",
              actions.next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "<down>",
              actions.next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "k",
              actions.prev_entry,
              { desc = "Bring the cursor to the previous file entry" },
            },
            {
              "n",
              "<up>",
              actions.prev_entry,
              { desc = "Bring the cursor to the previous file entry" },
            },
            {
              "n",
              "<cr>",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "o",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "l",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "<2-LeftMouse>",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "-",
              actions.toggle_stage_entry,
              { desc = "Stage / unstage the selected entry" },
            },
            {
              "n",
              "s",
              actions.toggle_stage_entry,
              { desc = "Stage / unstage the selected entry" },
            },
            { "n", "S", actions.stage_all, { desc = "Stage all entries" } },
            { "n", "U", actions.unstage_all, { desc = "Unstage all entries" } },
            {
              "n",
              "X",
              actions.restore_entry,
              { desc = "Restore entry to the state on the left side" },
            },
            { "n", "L", actions.open_commit_log, { desc = "Open the commit log panel" } },
            { "n", "zo", actions.open_fold, { desc = "Expand fold" } },
            { "n", "h", actions.close_fold, { desc = "Collapse fold" } },
            { "n", "zc", actions.close_fold, { desc = "Collapse fold" } },
            { "n", "za", actions.toggle_fold, { desc = "Toggle fold" } },
            { "n", "zR", actions.open_all_folds, { desc = "Expand all folds" } },
            { "n", "zM", actions.close_all_folds, { desc = "Collapse all folds" } },
            { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
            { "n", "<c-f>", actions.scroll_view(0.25), { desc = "Scroll the view down" } },
            {
              "n",
              "<tab>",
              actions.select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            {
              "n",
              "<s-tab>",
              actions.select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            {
              "n",
              "[F",
              actions.select_first_entry,
              { desc = "Open the diff for the first file" },
            },
            {
              "n",
              "]F",
              actions.select_last_entry,
              { desc = "Open the diff for the last file" },
            },
            {
              "n",
              "gf",
              actions.goto_file_edit,
              { desc = "Open the file in the previous tabpage" },
            },
            {
              "n",
              "<C-w><C-f>",
              actions.goto_file_split,
              { desc = "Open the file in a new split" },
            },
            {
              "n",
              "<C-w>gf",
              actions.goto_file_tab,
              { desc = "Open the file in a new tabpage" },
            },
            {
              "n",
              "i",
              actions.listing_style,
              { desc = "Toggle between 'list' and 'tree' views" },
            },
            {
              "n",
              "f",
              actions.toggle_flatten_dirs,
              { desc = "Flatten empty subdirectories in tree listing style" },
            },
            {
              "n",
              "R",
              actions.refresh_files,
              { desc = "Update stats and entries in the file list" },
            },
            {
              "n",
              "<leader>e",
              actions.focus_files,
              { desc = "Bring focus to the file panel" },
            },
            { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
            { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle available layouts" } },
            { "n", "[x", actions.prev_conflict, { desc = "Go to the previous conflict" } },
            { "n", "]x", actions.next_conflict, { desc = "Go to the next conflict" } },
            { "n", "g?", actions.help("file_panel"), { desc = "Open the help panel" } },
            {
              "n",
              "<leader>cO",
              actions.conflict_choose_all("ours"),
              { desc = "Choose the OURS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cT",
              actions.conflict_choose_all("theirs"),
              { desc = "Choose the THEIRS version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cB",
              actions.conflict_choose_all("base"),
              { desc = "Choose the BASE version of a conflict for the whole file" },
            },
            {
              "n",
              "<leader>cA",
              actions.conflict_choose_all("all"),
              { desc = "Choose all the versions of a conflict for the whole file" },
            },
            {
              "n",
              "dX",
              actions.conflict_choose_all("none"),
              { desc = "Delete the conflict region for the whole file" },
            },
          },
          file_history_panel = {
            { "n", "g!", actions.options, { desc = "Open the option panel" } },
            {
              "n",
              "<C-A-d>",
              actions.open_in_diffview,
              { desc = "Open the entry under the cursor in a diffview" },
            },
            {
              "n",
              "y",
              actions.copy_hash,
              { desc = "Copy the commit hash of the entry under the cursor" },
            },
            { "n", "L", actions.open_commit_log, { desc = "Show commit details" } },
            {
              "n",
              "X",
              actions.restore_entry,
              { desc = "Restore file to the state from the selected entry" },
            },
            { "n", "zo", actions.open_fold, { desc = "Expand fold" } },
            { "n", "zc", actions.close_fold, { desc = "Collapse fold" } },
            { "n", "h", actions.close_fold, { desc = "Collapse fold" } },
            { "n", "za", actions.toggle_fold, { desc = "Toggle fold" } },
            { "n", "zR", actions.open_all_folds, { desc = "Expand all folds" } },
            { "n", "zM", actions.close_all_folds, { desc = "Collapse all folds" } },
            {
              "n",
              "j",
              actions.next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "<down>",
              actions.next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "k",
              actions.prev_entry,
              { desc = "Bring the cursor to the previous file entry" },
            },
            {
              "n",
              "<up>",
              actions.prev_entry,
              { desc = "Bring the cursor to the previous file entry" },
            },
            {
              "n",
              "<cr>",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "o",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "l",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            {
              "n",
              "<2-LeftMouse>",
              actions.select_entry,
              { desc = "Open the diff for the selected entry" },
            },
            { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
            { "n", "<c-f>", actions.scroll_view(0.25), { desc = "Scroll the view down" } },
            { "n", "<tab>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
            {
              "n",
              "<s-tab>",
              actions.select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            {
              "n",
              "[F",
              actions.select_first_entry,
              { desc = "Open the diff for the first file" },
            },
            { "n", "]F", actions.select_last_entry, { desc = "Open the diff for the last file" } },
            {
              "n",
              "gf",
              actions.goto_file_edit,
              { desc = "Open the file in the previous tabpage" },
            },
            { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
            { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
            { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
            { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle available layouts" } },
            { "n", "g?", actions.help("file_history_panel"), { desc = "Open the help panel" } },
          },
          option_panel = {
            { "n", "<tab>", actions.select_entry, { desc = "Change the current option" } },
            { "n", "q", actions.close, { desc = "Close the panel" } },
            { "n", "g?", actions.help("option_panel"), { desc = "Open the help panel" } },
          },
          help_panel = {
            { "n", "q", actions.close, { desc = "Close help menu" } },
            { "n", "<esc>", actions.close, { desc = "Close help menu" } },
          },
        },
      })
    end,
    cmd = { "GitDiff", "GitLog", "GitClose" },
  },
  {
    "arp242/switchy.vim",
    --- :A will open the current file's tests or the current test's implementation based on what is currently opened.
    --- :AS will act the same as :A but will move the current file to a new buffer in a split.
    --- :AV will act the same as :AS but with a vertical split.
    opt = {},
    -- event = "VeryLazy",
    config = function(_, opts)
      vim.cmd([[
      command! A call switchy#switch('vsp', 'wincmd p | :e')
      ]])
    end,
    cmd = { "A" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    --- 上下对齐线，为了覆盖lazyvim的某个未知插件的对齐线
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = { scope = { enabled = false } },
    event = {
      "BufEnter",
      "BufWinEnter",
    },
  },
  {
    "wellle/context.vim",
    --- 向上移动时，显示长函数的函数头
    --- 用途不大，对于文件比较大的，很卡顿
    enabled = false,
  },
}
