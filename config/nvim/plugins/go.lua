return {
  {
    "benmills/vim-golang-alternate",
    --- :A will open the current file's tests or the current test's implementation based on what is currently opened.
    --- :AS will act the same as :A but will move the current file to a new buffer in a split.
    --- :AV will act the same as :AS but with a vertical split.
    opt = {},
    event = "VeryLazy",
  },
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
  },
  {
    "charlespascoe/vim-go-syntax",
    --- 加强版 go 语法高亮
    --- 打开第一个文件会没有高亮，可以用命令 :e 生效
    --- 或者跳转也可以重新渲染高亮
    opt = {},
    event = "VeryLazy",
  },
}
