---@diagnostic disable: undefined-global

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

return {
	name = "core_config",
	dir = vim.fn.stdpath("config"),

	lazy = false,

	config = function()

		--判断防止真终端中颜色问题
		if (vim.fn.has("gui_running") == 1) then
			-- cappuccino
			ep("[core_config] catppuccin",vim.cmd,"colorscheme catppuccin")

			ep("[core_config] highlights",require,"vconf.highlights")
		else
			ep("[core_config] colorscheme default",vim.cmd,"colorscheme default")
		end

		vim.api.nvim_create_autocmd({"BufEnter"}, {
			callback = function()
				ep("[core_config] keymaps",require,"vconf.keymaps")
				ep("[core_config] options",require,"vconf.options")

				ep("[core_config] bigfile",require,"vconf.bigfile")
			end,
			desc = "keymaps,options"})

		vim.api.nvim_create_autocmd("UIEnter", {
			callback = function()
				--`setalpha` `zsh` `ctags`
				ep("[core_config] keymaps",require,"vconf.path_deps")

				ep("[core_config] keymaps",require,"vconf.autocmds")
			end,
			desc = "call setalpha,zsh,ctags"})

	end

}











