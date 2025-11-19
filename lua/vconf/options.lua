---@diagnostic disable: undefined-global

vim.opt.mouse = ""              --禁止鼠标,"a"在所有下启动

vim.opt.clipboard = "unnamedplus" --剪切板

if vim.opt.guifont then
	vim.opt.guifont = "Hack, Noto Sans CJK SC:h13"
end

vim.opt.number = true           -- 行号
vim.opt.relativenumber = false  -- 相对行号
vim.opt.cursorline = true       -- 高亮当前行
vim.opt.wrap = true             -- 自动换行
vim.opt.scrolloff = 0           -- 开始滚动当光标上下距离为
vim.opt.sidescrolloff = 0       -- 开始滚动当光标左右距离为

vim.opt.modeline = false        -- 不要读模式行
vim.opt.expandtab = false       -- Tab替代为空格
vim.opt.tabstop = 4             -- Tab宽度
vim.opt.shiftwidth = 4          -- tab转变宽度
vim.opt.softtabstop = 4         -- Tab插入删除的列长

-- `indentexpr`通常为缩进源
-- {visual}=在`indentexpr`无设置时使用内部函数
vim.cmd([[filetype on]])         -- filetype
vim.cmd([[filetype plugin off]]) -- filetype插件
vim.cmd([[filetype indent off]]) -- filetype缩进

vim.opt.cindent     = false     -- 智能c缩进
vim.opt.smartindent = false     -- 智能缩进
vim.opt.autoindent  = true      -- 使用上个非空白符的缩进换行
vim.opt.formatoptions = ""      -- filetype关闭下,不让`autoindent`格式化,


vim.opt.ignorecase = true       -- 匹配忽略大小写
vim.opt.smartcase = false       -- 大写无视`ignorecase`,小写匹配大小写
vim.opt.hlsearch =  true        -- 高亮搜索
vim.opt.incsearch = true        -- 实时预览搜索结果

vim.opt.signcolumn = "yes"      --行号左边多一列信息

vim.opt.autoread = false        -- 自动读取修改
vim.opt.autowrite = false       -- 自动写入

vim.opt.swapfile = true
vim.opt.directory = vim.fn.stdpath('data') .. '/swap//'

vim.opt.writebackup = true      -- 备份文件
vim.opt.backup      = true      -- 备份文件
vim.opt.backupdir   = vim.fn.stdpath("data") .. '/backup//'

vim.opt.undofile = true         -- 退出后仍有撤销历史


vim.opt.termguicolors = true    -- 24bit真彩

vim.opt.list = true             -- 可视化空白符
vim.opt.listchars = {
  tab      = "| ",
  trail    = "•",   -- 小圆点
  extends  = "⟩",
  precedes = "⟨",
  nbsp     = "⍽",
}


vim.opt.wildmenu = true         -- 命令模式补全
vim.opt.wildmode    = { "longest", "list", "full" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }


vim.opt.autochdir = true        -- 自动改变到文件目录
vim.opt.wildignore = {}         -- 不要匹配的文件


vim.opt.laststatus = 2          -- (状态栏 0:关闭,1:多窗口时开启 2总是 3:只有一个)
vim.opt.showmode   = true       -- 显示当前模式

vim.opt.splitbelow = false      -- 分隔时向下
vim.opt.splitright = false      -- 分隔时向右









