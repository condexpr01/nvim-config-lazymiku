---@diagnostic disable: undefined-global

-- 在lazy.lua中使用

--git替代`http`为ssh
--true时设置,否则尝试清除
return function(is_used)
	if is_used == true then
		vim.fn.system({
			"git","config","--global",
			[[url.git@github.com:.insteadof]],
			"https://github.com/"
		})
	else
		vim.fn.system({
			"git","config","--global","--unset",
			[[url.git@github.com:.insteadof]]
		})
	end
end
