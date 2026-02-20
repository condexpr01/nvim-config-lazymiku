---@diagnostic disable: undefined-global

--alpha启动界面快速加载工作

local function load_mode()
	--vim.cmd("e " .. "$MYVIMRC")
	--vim.cmd("e " .. "")
	vim.cmd("e " .. "~/Desktop/wubi86dir/dict.txt")

end



local function edit_mode()
	vim.cmd("e " .. vim.fn.stdpath("config") .. "/lua/tasks/taskscmd.lua")
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

