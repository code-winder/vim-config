# .zshrc 个人定制部分的配置，即追加这些配置，而不是替换原来的配置
# NOTE 网页浏览器可以安装 vim 扩展，支持类似 vim 的快速移动
# NOTE 安装 bat(命令行文件高亮)/delta(用于gitdiff高亮)/eza(用于fzf-tab的cd补全，可以不需要)/fd/ag/fzf 等，另外其他的命令行工具根据vim插件的依赖要求去安装就可
# zsh + oh-my-zsh + tmux
# 利用 oh-my-zsh 的插件：
# 需要在 .zshrc 中做以下配置(其他配置根据插件要求去github上查)：

ZSH_THEME="sunaku"

plugins=(
  zsh-autosuggestions  # 用右方向键选择建议的字符串
  zsh-syntax-highlighting
  z #z 是一个文件夹快捷跳转插件，对于曾经跳转过的目录，只需要输入最终目标文件夹名称，就可以快速跳转。配合 fzf-tab 更高效，可以减少fzf的模糊度
  web-search # 例如 web_search google oh-my-zsh
  fzf-tab # fzf风格的tab补全，各种命令及其参数的补充，比如 git，对于 cd 或者打开文件之类的不建议用，因为更高效的有fzf提供的<c-t>，比如 cd <c-t>，又比如 vi $(fzf)
)

# 设置 zsh 建议文字的颜色，特别是与iterm2等终端颜色主题混淆看不清时
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# 常用别名
alias flog='git log --graph --oneline --all --decorate'
alias ll='ls -lha'
alias vim='nvim'
alias vi='nvim'
alias ask='tldr'

# 只允许 tmux 开启一个会话，且启动zsh时就自动启动tmux
tmux has -t dev &> /dev/null

if [ $? != 0 ]; then
  tmux -2 new-session -s dev -D -d
fi

if [ -z "$TMUX" ]; then
  tmux attach -t dev -d
fi
