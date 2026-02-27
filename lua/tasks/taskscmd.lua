---@diagnostic disable: undefined-global

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

--alpha启动界面快速加载工作

local function load_mode()
	--vim.cmd("e " .. "")
	ep("[taskscmd]open failed",vim.cmd,"e " .. "$MYVIMRC")

end


local function edit_mode()
	ep("[taskscmd]",vim.cmd,"e "
		.. vim.fn.stdpath("config")
		.. "/lua/tasks/taskscmd.lua")
end


-- 1:load mode, button `w`
-- 0:edit mode, button `e`
return function(mode)
	if mode == 1 then
		load_mode()
	else
		edit_mode()
	end
end

