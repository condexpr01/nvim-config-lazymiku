---@diagnostic disable: undefined-global

if jit.os == "Windows" then

	if vim.fn.exepath("setalpha") then
		-- windows用外部`winapi`改变透明度,依赖`setalpha`(自定义的)
		-- Linux上KDE plasma可以在系统设置中加入窗口透明度规则,
		os.execute("setalpha 211")
	end

	local shell = vim.fn.exepath("zsh")
	if shell then
		vim.opt.shell = shell
		vim.opt.shellcmdflag ="-c"

		vim.opt.shellquote=""
		vim.opt.shellxquote=""
		vim.opt.shellxescape =""

		vim.opt.shellpipe = [[2>&1|tee "%s"]]
		vim.opt.shellredir= [[>"%s" 2>&1]]

		vim.opt.shelltemp= false
		vim.opt.shellslash= true
	end

end


-- 快速入手一个项目
-- 当前目录(%:h)下调用`ctags`生成tags
if vim.fn.exepath("ctags") then
	vim.api.nvim_create_user_command("CtagsGen", function()
	  vim.cmd([[!ctags -R --c-kinds=+p --fields=+iaS --extras=+q --exclude=\* --exclude-exception=\*.h %:h]])
	end, { desc = "Generate tags by using ctags" })

end

