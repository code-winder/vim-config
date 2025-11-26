# lazyVim 的快捷键

## 滚动或当前buf内跳转

+ ctrl-Up Increase Window Height
+ ctrl-Down Decrease Window Height
+ ctrl-Left Decrease Window Width
+ ctrl-Right Increase Window Width
+ leader-- Split Window Below
+ leader-| Split Window Right
+ Shift-h 或者 [b Prev Buffer, 最上面的tab行
+ Shift-l 或者 ]b Prev Buffer, 最上面的tab行
+ [B Move buffer prev
+ ]B Move buffer next
+ leader-bd Delete Buffer
+ ctrl-s Save File
+ leader-xl Location List
+ leader-xq Quickfix List

+ ] 或 [ 打头，进行区块移动，比如 函数间移动、结构体间、函数参数间
  - [q Previous Quickfix
  - ]q Next Quickfix
  - ]d Next Diagnostic
  - [d Prev Diagnostic
  - ]e Next Error
  - [e Prev Error
  - ]w Next Warning
  - [w Prev Warning

+ ctrl-B Scroll Backward
+ ctrl-f Scroll Forward
+ leader-z 或者 leader-Z Toggle Zen Mode（需要snacks额外配置）

## code 有关

+ leader-g 打头，表示与git相关的一些操作，可以先按，右下角会有提示
  - leader-gb Git Blame Line
  - leader-gs Git Status
  - leader-gd Git Diff (Hunks)
  - leader-gB Git branch
  - leader-gl Git Log
  - leader-gL Git Log Line（当前文件当前行的变更历史）
  - leader-gf Git Log file
  - leader-gg lazygit 及其操作

+ ctrl-/ 打开或关闭底部终端（或者 leader-ft）  
+ leader-u 打头，表示与ui相关的一些显示操作，可以先按，右下角会有提示
  - leader-us Toggle Spelling
  - leader-ud Toggle Diagnostics
  - leader-ul Toggle Line Numbers
  - leader-uL Toggle Relative Number

+ g 打头，与代码跳转和移动相关的操作
  - gd Goto Definition
  - gr References
  - gI Goto Implementation
  - gy Goto T[y]pe Definition
  - gD Goto Declaration
  - gK 或者 ctrl-k Signature Help
  - K Hover

+ leader-c 打头，code 变更相关的操作
  - leader-ca 或者 -cA Code Action
  - leader-cr Rename 函数或变量名等
  - leader-cR Rename File
  - leader-cs 代码的大纲视图

## 搜索

+ leader-s 打头，表示查找内容操作（非文件名）
  - leader-su Undotree
  - leader-st Todo
  - leader-s" 或者 " Registers
  - leader-p 打开拷贝面板历史（要在lazyExtra中安装yank）
  - leader-sj Jumps
  - leader-sd Diagnostics
  - leader-sD Buffer Diagnostics
  - leader-s/ Search History
  - leader-sg Grep (Root Dir)
  - leader-/ Grep (Root Dir)
  - leader-sw find current word
  - leader-sr Search and Replace
  - leader-sq Quickfix List
  - leader-sl Location List
  - leader-sc Command History
  - leader-: Command History
  - leader-sa Autocmds
  - leader-sC Commands
  - leader-sk Keymaps
  - leader-? Buffer Keymaps (which-key)
  - leader-sp Search for Plugin Spec
  - leader-sH Highlights
  - leader-sh Help Pages
  - leader-sM Man Pages
  - leader-sm Marks

+ leader-f 打头，表示查找文件名操作
  - leader-fb Buffers 查找已打开的文件
  - leader-fe Explorer Snacks (root dir)
  - leader-e Explorer Snacks (root dir)
  - leader-ff Find Files (Root Dir)
  - leader-space Find Files (Root Dir)
  - leader-fg Find Files (git-files)
  - leader-fp Projects
  - leader-fr Recent
  - leader-fn 新建文件
 
+ leader-x 打头，错误提示
  - leader-xx Diagnostics (Trouble)
  - leader-xX Buffer Diagnostics (Trouble)
  - leader-sd Diagnostics
  - leader-sD Buffer Diagnostics
  - leader-xT或-xt TODO list
  - leader-st Todo
