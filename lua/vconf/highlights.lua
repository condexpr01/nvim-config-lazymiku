---@diagnostic disable: undefined-global


-- 需在packs/core_config中启用

-- 参数0:当前namespace
-- `fg/bg/ctermfg/ctermbg/bold/italic/underline`

-- 光标
vim.api.nvim_set_hl(0,"Cursor", {fg="#39c5bb",bg="#ffffff"}) --miku color

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
vim.api.nvim_set_hl(0, "MatchParen",{ fg="#000000",bg="#ffa500" })


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


-- 终端 16 色调色板
vim.opt.termguicolors = true

vim.g.terminal_color_0  = "#000000" -- black
vim.g.terminal_color_1  = "#a50000" -- red
vim.g.terminal_color_2  = "#a5ff00" -- green
vim.g.terminal_color_3  = "#ffa500" -- yellow
vim.g.terminal_color_4  = "#00a5ff" -- blue
vim.g.terminal_color_5  = "#a500ff" -- magenta
vim.g.terminal_color_6  = "#39c5bb" -- cyan
vim.g.terminal_color_7  = "#aaaaaa" -- white
vim.g.terminal_color_8  = "#393939" -- bright black
vim.g.terminal_color_9  = "#ff0044" -- bright red
vim.g.terminal_color_10 = "#00ffa5" -- bright green
vim.g.terminal_color_11 = "#ffe211" -- bright yellow
vim.g.terminal_color_12 = "#00bbff" -- bright blue
vim.g.terminal_color_13 = "#ff11a5" -- bright magenta
vim.g.terminal_color_14 = "#11ffff" -- bright cyan
vim.g.terminal_color_15 = "#ffffff" -- bright white


