# .zshrc 个人定制部分的配置，即追加这些配置，而不是替换原来的配置

ZSH_THEME="sunaku"

plugins=(
  zsh-autosuggestions  # 用右方向键选择建议的字符串
  zsh-syntax-highlighting
  z #z 是一个文件夹快捷跳转插件，对于曾经跳转过的目录，只需要输入最终目标文件夹名称，就可以快速跳转。配合 fzf-tab 更高效，可以减少fzf的模糊度
  web-search # 例如 web_search google oh-my-zsh
  fzf-tab # fzf风格的tab补全，各种命令及其参数的补充，比如 git，对于 cd 或者打开文件之类的不建议用，因为更高效的有fzf提供的<c-t>，比如 cd <c-t>，又比如 vi $(fzf)
)

alias flog='git log --graph --oneline --all --decorate'
alias ll='ls -lha'
alias vim='nvim'
alias vi='nvim'
alias ask='tldr'

tmux has -t dev &> /dev/null

if [ $? != 0 ]; then
  tmux -2 new-session -s dev -D -d
fi

if [ -z "$TMUX" ]; then
  tmux attach -t dev -d
fi
