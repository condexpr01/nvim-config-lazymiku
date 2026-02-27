
local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

-- Lazy
ep("[init] lazy",require,"vconf.lazy")

-- 设置以下环境变量更方便管理
--`XDG_CONFIG_HOME==vim.fn.stdpath("config")`
--`XDG_DATA_HOME==vim.fn.stdpath("data")`
--`XDG_CACHE_HOME==vim.fn.stdpath("cache")`
