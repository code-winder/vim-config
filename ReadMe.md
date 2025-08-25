该配置 vim-config 是本人编程与日常使用的高效操作配置。
+ 插件少，启动快，但够用且主题漂亮
+ 操作简单快捷
+ 注释清晰，常用操作都有说明
+ 便于迁移到新机器，配置在手，走遍天下。
+ 建议使用 neovim 和 neovim 配置，因为更容易配置，且性能更高，特性更多更符合现代人审美

# vim 配置
+ 安装尽量新版包含各种接口的 vim 版本。这些接口有 python、lua 等
+ 使用vim配置的可以把 .vimrc 追加到已有的 .vimrc 后面

# neovim 配置
+ 先初始化本地的 .config/nvim 目录可以参考项目 https://github.com/LazyVim/LazyVim 提供的详细文档说明。
+ 把 config/nvim/config 和 config/nvim/plugins 下的文件覆盖本地目录 .config 对应路径下的已有的文件即可。
+ 去掉 .config/plugins 中多余的文件。
+ 能用lazyVim自带的插件的，尽量用它的。因为好管理也好更新，一般没有兼容问题。额外的插件用命令 :LazyExtras，或者在启动页选择相应的入口。
