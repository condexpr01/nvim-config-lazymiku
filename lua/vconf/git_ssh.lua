---@diagnostic disable: undefined-global

--git替代`http`为ssh
--true时设置,否则尝试清除

-- #warning#: no exception handling, handle when require

return function(is_used)
	if is_used then
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
