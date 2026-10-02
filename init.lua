---@diagnostic disable: undefined-global

if vim.g.neovide then
	vim.g.neovide_fullscreen=true
	vim.g.neovide_opacity=0.8
end

-- Decide which cmp engine to use, default is `nvim-cmp`
-- modify to true for `blink.cmp`, false for `nvim-cmp`
if false then
	vim.g.cmp_engine = "blink.cmp"
else
	vim.g.cmp_engine = "nvim-cmp"
end


local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		-- seperate with vim.notify, using print
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

-- Lazy
ep("[init] lazy",require,"vconf.lazy")

-- setting the follow env for management by yourself is recommended
--`XDG_CONFIG_HOME==vim.fn.stdpath("config")`
--`XDG_DATA_HOME==vim.fn.stdpath("data")`
--`XDG_CACHE_HOME==vim.fn.stdpath("cache")`



