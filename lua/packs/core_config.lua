---@diagnostic disable: undefined-global

return {
	name = "core_config",
	dir = vim.fn.stdpath("config"),

	lazy = false,

	config = function()

		--判断防止真终端中颜色问题
		if (vim.fn.has("gui_running") == 1) then
			-- cappuccino
			vim.cmd("colorscheme catppuccin")
			require("vconf.highlights")
		else
			vim.cmd("colorscheme default")
		end

		vim.api.nvim_create_autocmd({"BufEnter"}, {
			callback = function()
				require("vconf.keymaps")
				require("vconf.options")
			end,
			desc = "keymaps,options"})

		vim.api.nvim_create_autocmd("UIEnter", {
			callback = function()
				--`setalpha` `zsh` `ctags`
				require("vconf.path_deps")

				require("vconf.autocmds")
			end,
			desc = "setalpha,zsh,ctags"})

	end

}
