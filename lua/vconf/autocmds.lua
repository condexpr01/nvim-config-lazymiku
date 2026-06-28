---@diagnostic disable: undefined-global


-- message显示消息
-- `重定向到"寄存器`
-- `redir @"`设置
-- `redir end`取消
-- `vim.cmd("redir @\"")`

-- #warning#: no exception handling, handle when require

-- force no indentkeys
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.indentkeys = ""
    end,
})
