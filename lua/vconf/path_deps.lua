---@diagnostic disable: undefined-global

-- #warning#: no exception handling, handle when require

local state = {};

-- 在 PATH 里查找
local function find_executable(name)
    local path = os.getenv("PATH")
    if not path then return nil end

	local sep
	if jit.os == "Windows" then
		sep = ';'
	elseif jit.os == "Linux" then
		sep = ':'
	else
		sep = ':'
	end

    for p in string.gmatch(path, "[^" .. sep .."]+") do
        local full = p .. "/" .. name
        local f = io.open(full, "r")
        if f then
            f:close()
            return full
        end
    end
    table.insert(state, "not found " .. name);
    return nil
end

if jit.os == "Windows" then

	-- windows需要外部用`winapi`改变透明度,依赖`setalpha`(自定义的)
	if find_executable("setalpha.exe") or find_executable("setalpha") then
		os.execute("setalpha 211")
	end

	-- 令`msys2`上有好的shell体验
	local shell = find_executable("zsh.exe")
	if not shell then shell = find_executable("zsh") end
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

-- Linux上KDE plasma可以在设置中加入透明度
-- `elseif jit.os == "Linux" then`
end


-- 快速入手一个项目
-- 当前目录(%:h)下调用`ctags`生成tags
if find_executable("ctags.exe") or find_executable("ctags") then
	vim.api.nvim_create_user_command("CtagsGen", function()
	  vim.cmd([[!ctags -R --c-kinds=+p --fields=+iaS --extras=+q --exclude=\* --exclude-exception=\*.h %:h]])
	  vim.cmd("pwd")
	end, { desc = "Generate tags by using ctags" })

end


return state

