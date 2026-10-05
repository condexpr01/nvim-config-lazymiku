---@diagnostic disable: undefined-global


-- message显示消息
-- `重定向到"寄存器`
-- `redir @"`设置
-- `redir end`取消
-- `vim.cmd("redir @\"")`

-- #warning#: no exception handling, handle when require

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.indentkeys=""
		vim.opt.expandtab = false
		vim.opt.softtabstop = 0
	end,
})

