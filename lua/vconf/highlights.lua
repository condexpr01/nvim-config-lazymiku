---@diagnostic disable: undefined-global


-- 需在packs/core_config中启用

-- 参数0:当前namespace
-- `fg/bg/ctermfg/ctermbg/bold/italic/underline`

-- 光标
vim.api.nvim_set_hl(0,"Cursor", {fg="#000000",bg="#ffa500"}) --Rin color

vim.opt.guicursor = {
	--format:
	--mode:shape-size-hightlightgroup

	--mode: n v c i r o t
	--shape: block horxx verxx (xx:percentage)

	"n:block-Cursor",       -- normal
	"v:block-Cursor",       -- visual
	"c:ver39-Cursor",       -- command
	"i:ver39-Cursor",       -- insert
	"r:hor13-Cursor",       -- replace
	"o:hor13-Cursor",       -- operator-pending
	"t:ver39-Cursor",       -- terminal
}

-- 行号
vim.api.nvim_set_hl(0, "LineNr",      { fg="#39c5bb" }) -- Miku color
vim.api.nvim_set_hl(0, "CursorLineNr",{ fg="#ffa500" }) -- Rin color

-- 匹配
vim.api.nvim_set_hl(0, "MatchParen",{ fg="#ffa500",bg="#222222" })


-- 搜索
--vim.api.nvim_set_hl(0, "Search",   { fg="",bg="" })
--vim.api.nvim_set_hl(0, "CurSearch",{ fg="",bg="" })
--vim.api.nvim_set_hl(0, "IncSearch",{ fg="",bg="" })

-- 高亮行
--vim.api.nvim_set_hl(0, "CursorLine",  { bg="" })
--vim.api.nvim_set_hl(0, "CursorColumn",{ bg="" })
--vim.api.nvim_set_hl(0, "CursorLineSign",{ fg="" })
--vim.api.nvim_set_hl(0, "CursorLineFold",{ fg="" })


-- 可视化
--vim.api.nvim_set_hl(0, "Visual",    { bg="" })

-- 函数
--vim.api.nvim_set_hl(0, "Function",  { fg="" })

-- 注释
--vim.api.nvim_set_hl(0, "Comment",   { fg="", italic=true })

-- 候选
--vim.api.nvim_set_hl(0, "Pmenu",    { fg="", bg="" })
--vim.api.nvim_set_hl(0, "PmenuSel", { fg="", bg="" })

-- `空白符"nbsp", "space", "tab", "multispace", "lead" and "trail"`
--vim.api.nvim_set_hl(0, "Whitespace",  { fg="" })
--vim.api.nvim_set_hl(0, "Conceal",     { fg="" })

-- 目录
--vim.api.nvim_set_hl(0, "Directory",  { fg="" })

-- 消息
--vim.api.nvim_set_hl(0, "ModeMsg",     { fg="" })
--vim.api.nvim_set_hl(0, "MsgArea",     { fg="" })
--vim.api.nvim_set_hl(0, "MoreMsg",     { fg="" })
--vim.api.nvim_set_hl(0, "MsgSeparator",{ fg="" })
--vim.api.nvim_set_hl(0, "WarningMsg",  { fg="" })
--vim.api.nvim_set_hl(0, "ErrorMsg",    { fg="" })

-- text
--vim.api.nvim_set_hl(0, "EndOfBuffer"  ,     { fg="" })


-- 定义 Neovim 终端的 16 种 ANSI 颜色
vim.opt.termguicolors = true
vim.g.terminal_color_0  = "#111111"
vim.g.terminal_color_1  = "#ff00a5"
vim.g.terminal_color_2  = "#a5ff00"
vim.g.terminal_color_3  = "#ffa500"
vim.g.terminal_color_4  = "#00a5ff"
vim.g.terminal_color_5  = "#a500ff"
vim.g.terminal_color_6  = "#39c5bb"
vim.g.terminal_color_7  = "#ffffff"
vim.g.terminal_color_8  = "#393939"
vim.g.terminal_color_9  = "#a50000"
vim.g.terminal_color_10 = "#00ffa5"
vim.g.terminal_color_11 = "#ffe211"
vim.g.terminal_color_12 = "#11ffa5"
vim.g.terminal_color_13 = "#ff11a5"
vim.g.terminal_color_14 = "#00ffff"
vim.g.terminal_color_15 = "#000000"

