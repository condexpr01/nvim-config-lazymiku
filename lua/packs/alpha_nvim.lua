---@diagnostic disable: undefined-global

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

-- `miku`
return {
	"goolord/alpha-nvim",

	event = "VimEnter",

	opts = function()
		local dashboard = ep("[alpha_nvim] dashboard",require,"alpha.themes.dashboard")
		if not dashboard then return {} end

		local logo =
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢀⠀⡀⣠⣴⣾⣿⠿⠟⠛⠛⠛⠿⠿⠿⠽⠿⠿⠿⠿⠿⢶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⡵⣯⣾⣿⣿⠟⠉⢀⣤⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⢫⣮⢿⣿⡿⠛⠁⠠⠔⢋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠈⠻⣷⣦⠠⣃⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⢟⣵⡿⢻⡿⠋⠀⠀⣠⢴⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠈⢻⣷⣏⢫⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⢸⣿⣠⠋⠀⡠⣪⢞⡵⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣧⡻⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⡙⢾⣿⣸⡟⠁⠀⢠⠞⠁⠋⠀⠀⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣷⡹⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⡇⢸⣿⠋⠀⢀⡶⠃⠀⠀⢠⠃⠜⠁⠀⣀⠀⠀⠀⠀⢀⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣿⠏⣿⣇⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⡄⡼⠁⠀⢀⣾⠁⠀⠀⠀⡜⡸⠀⠀⣰⢻⠀⠀⠀⠀⢸⠉⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⢿⢸⣿⢻⢱⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠁⢀⡟⠀⢠⢃⣾⠇⠀⠀⠀⢰⠁⠀⠀⣰ ⢸⡄⡄⠀⠀⢸⡇⠘⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⢸⠀⠀⠀⢸⣾⠃⠈⠈⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⢠⠞⠀⡰⠃⣼⠏⠀⠀⠀⠀⡜⠀⠀⢰⠃  ⡇⣧⠀⠀⢸⡇ ⠘⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡀⠁⠀⠀⢸⡿⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣵⠃⠀⢰⠁⣼⠏⠀⠀⠀⠀⢀⠇⠀⢠⠟   ⣷⣿⡀⠀⢸⡇⠀  ⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠀⠈⠀⠀⠀⠀⠣⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⢋⠀⢀⠇⣸⠏⠀⠀⠀⠀⠀⡸⠄⢀⠎⠀⠀⠀⠀⠸⣇⢣⠀⢸⡇⠀⠀   ⣆⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⡾⢟⡇⡘⠃⡜⣼⣯⠀⠀⠀⠀⠀⠀⡇⢀⡞⠀⠀⠀⠀⠀⠀⢻⠈⢧⠸⡇⠀⠀⠀⠀⠀⠙⢆⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠐⠉⠀⡸⠀⠃⢰⣻⣯⠇⠀⠀⠀⠀⠀⢸⢁⣾⣤⣀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡇⠀⠀⠀⠀⠀⠀⠈⠧⡀⠀⢠⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢀⣷⢣⠎⠀⠀⠀⠀⠀⠀⢹⡞⠀⠉⠛⠿⣶⣬⡒⠄⠀⠀⠀  ⠀⠀⠀⣀⡀⠀⣀⣀⣼⣦⡀⢇⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⣼⣯⠏⢀⣀⡀⠀⠀⠀⠀⢸⡇⢰⠿⠿⠿⠟⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⣯⣴⣾⡿⠛⠛⠉⠉⠳⡞⡆⠀⢀⣀⢰⠻⣆⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⣿⠋⠀⡜⠀⡇⠀⠀⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠿⢷⣶⠀⡼⠀⠹⣀⣺⠈⡏⠇⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡏⠀⠜⠁⠀⢀⠃⢰⠃⠀⣰⡆⠀⢸⠉⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢧⣄⣴⠋⢿⡀⢹⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⡞⠀⢸⢀⡞⠁⣸⠀⢸⣄⠀⢣⡀⠀⠀⠀⠀⠀⡤⠤⠤⠤⠤⢄⠀⠀⠀⠀⠀⠀⢀⠞⡟⡎⡧⠨⡇⠀⡇⠈⡇⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢠⠇⢀⣿⠏⠀⡰⢹⠀⢸⠈⠳⣤⣥⣄⣀⣀⣀⡀⠣⡀⠀ ⢀⠔⠀⠀⠀⠀⣀⡴⠃⣼⡇⢠⠛⡄⢺⠀⢡⠀⢺⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠀⡼⠀⢸⠃⠀⢠⠃⠀⡆⢸⠀⠀⠈⠉⢻⣿⣿⣿⣿⡇ ⠉⠉⠁⠀⠀⣠⠶⠾⠧⠄⠐⣻⢠⠃⠀⠱⡀⠈⣆⡄⠈⣆⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣰⣣⠤⠎⠉⠽⠁⠀⠘⠀⡲⠏⠀⠀⢱⢸⠀⠀⠀⠀⠀⠘⠀⣷⢄⠑⠦⠤⠒⢂⣩⡮⡞⠀⠀⠀⠀⢠⣧⠃⠀⠀⠀⢣⠠⠀⠃⠀⠘⠍⠙⢦⠤⣕⠾⡄⠀⠀⠀⠀
⠀⠀⠀⠀⢰⢹⡀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠀⣄⡀⠈⢿⠀⠀⠀⣰⢞⠇⠀⠘⠀⠙⣢⣠⠖⠉⠈⠀⠀⠈⢢⣀⠀⠰⠃⠀⠀⢀⡴⡞⠉⠀⠀⠀⠀⠀⠀⠈⠀⢸⠎⡇⠀⠀⠀⠀
⠀⠀⠀⢀⣾⣄⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣝⠢⡌⠀⠀⢸⣿⡆⠀⠀⠀⠀⢀⡨⠶⢀⡀⠀⣠⢦⡀⣸⣿⠀⠀⠀⣠⢞⣩⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⡼⢱⠀⠀⠀⠀
⠀⠀⠀⣼⣿⣾⣷⣍⠲⢄⡀⠀⠀⠀⠀⠀⢀⣾⣿⡷⣌⢢⡀⣾⠛⣿⡀⠀⠀⣠⡏⠀⠀⠀⢱⣘⢧⣠⢿⡏⢻⡧⢠⠟⡵⢿⣿⣧⠀⠀⠀⠀⠀⠀⣀⡤⢞⣡⣾⣾⣌⣆⠀⠀⠀
⠀⠀⢰⣿⣿⣿⣿⣿⣿⣶⣬⡑⠲⢤⣀⣠⣾⣿⣿⠃⠈⢢⢻⡇⠀⠙⠷⠞⠋⠉⢷⠀⠀⢠⡋⠛⠻⠻⠟⠁⠈⣻⢇⠞⠁⣹⣿⣿⣷⣄⣀⠤⠖⣋⣥⣶⣿⣿⣿⣿⣿⣼⡄⠀⠀
⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣌⣉⠙⠛⠓⠒⠚⣠⠏⠀⠀⠀⠀⠀⠀⢸⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⢿⡘⠒⠒⠚⠛⠋⣉⣨⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀]]

		dashboard.section.header.val = vim.split(logo, "\n")

		-- `stylua: ignore`
		dashboard.section.buttons.val = {
			{
				type = "group",
				val = {
					dashboard.button("w", "⚡  "
					.. " Load tasks",[[<cmd>lua pcall(require("tasks.taskscmd"),1)<cr>]]),

					dashboard.button("e", "⚡  "
					.. " Edit tasks",[[<cmd>lua pcall(require("tasks.taskscmd"),0)<cr>"]]),
				},
				opts = {spacing = 0}
			},
			{
				type = "group",
				val = {

					dashboard.button("l", "⚡󰒲 " .. " Lazy","<cmd>Lazy<cr>"),

					dashboard.button("c", "⚡  " .. " CopilotChat","<cmd>CopilotChat<cr>"),

					dashboard.button("b", "⚡  "
					.. " Blinkcmp status","<cmd>lua pcall(require,\"blink.cmp\")<cr>"
					.. "<cmd>BlinkCmp status<cr>"),

					dashboard.button("h", "⚡  "
					.. " Checkhealth","<cmd>checkhealth<cr>"),

					dashboard.button("m", "⚡  "
					.. " Mason","<cmd>lua pcall(require,\"mason\")<cr>"
					.. "<cmd>Mason<cr>"),

					dashboard.button("n", "⚡  "
					.. " Nvim config","<cmd>lua pcall(require,\"nvim-tree\")<cr>"
					.. "<cmd>lua vim.cmd(\"NvimTreeToggle \".. vim.fn.stdpath(\"config\"))<cr>"),

					dashboard.button("p", "⚡  "
					.. " LspInfo","<cmd>lua pcall(require,\"mason-lspconfig\")<cr>"
					.. "<cmd>LspInfo<cr>"),

					dashboard.button("t", "⚡  "
					.. " TSModuleInfo","<cmd>lua pcall(require,\"nvim-treesitter\")<cr>"
					.. "<cmd>TSInstallInfo<cr>"),

				},
				opts = {spacing = 0}
			},
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		ep("[alpha_nvim] cmd",vim.cmd,"hi AlphaHeader guifg=#39C5BB")

		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"

		dashboard.section.buttons.opts.padding = 0
		dashboard.opts.layout[1].val = 0

		return dashboard
	end,

	config = function(_, dashboard)

		-- Close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					local epr = ep("[alpha_nvim] lazy",require,"lazy")
					if epr then epr.show() end

				end,
			})
		end

		local epr = ep("[alpha_nvim] alpha",require,"alpha")
		if epr then epr.setup(dashboard.opts) end

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()


				local stats

				epr = ep("[alpha_nvim] lazy",require,"lazy")
				if epr then stats = epr.stats() end

				dashboard.section.footer.val = "⚡ Neovim loaded "
				.. stats.loaded.. "/".. stats.count .. " plugins "
				.. "in "  .. stats.startuptime .. "ms\n"
				.. "⚡ Done: ".. stats.times.LazyDone .. "ms "
				.. "⚡ Start: ".. stats.times.LazyStart .. "ms"

				ep("[alpha_nvim] AlphaRedraw",vim.cmd.AlphaRedraw)
			end,
		})

	end,
}

--[[⢰⣿⣿⣿⣿⡿⠁⠠⢀⣿⡙⣎⠁⠀⢀⠀⣯⠰⠀⡀⠰⢹⡋⢍⢿⣿⡹⢿⣏⢷⢹⠨⣁⠋⡙⢻⣿⣏⣏⠳⠄⠀⢹⠰⡁⢏⡿⣧⠀⠀⠀⠀
⠀⠀⠀⠀⣹⣯⣿⣿⣿⠃⡈⡴⢹⣇⠳⠈⢀⠐⠀⢂⡇⢂⠁⢀⠂⡏⠌⢆⠘⣷⢯⡹⣿⠞⡆⠆⠀⠈⠀⠁⠹⣞⡦⡁⢊⠀⠌⡱⠀⡈⢽⣛⡆⠀⠀⠀
⠀⠀⠀⠀⣼⣷⣞⣿⠇⡚⣼⠁⣿⢨⡑⠈⡀⠄⠡⣘⡇⢀⠂⠠⢸⠌⠀⠈⡀⠈⢿⡱⢿⣿⡸⡄⠀⠀⠀⠀⠀⠘⣷⠡⢀⠂⢦⠑⠠⠐⢸⣻⡇⠀⠀⠀
⠀⠀⠀⠀⣿⣿⢾⡟⢬⣱⡏⣴⣏⠖⡠⠁⠄⡈⢰⡱⡇⢀⠂⠡⡍⠀⠀⠀⠴⢄⣈⢿⡜⡿⣕⠲⠀⡀⡠⠔⠒⠉⠸⣗⠄⠂⢱⡘⠠⠁⢂⠿⣽⠀⠀⠀
⠀⠀⠀⠀⣿⣿⣻⢍⣶⡻⢼⣽⣎⠳⣔⡣⡔⢦⣏⡷⡇⠠⠈⣴⠃⠀⠀⠀⠀⠀⠀⠉⢷⡹⢻⡄⢣⠀⠀⢀⠤⣀⣦⣹⣞⡄⠘⡆⠡⠐⢈⠺⣝⠀⠀⠀
⠀⠀⠀⠀⣿⣿⡏⡼⣞⡏⣿⣿⡜⣣⢿⣱⢛⡾⣽⣻⡇⠠⢁⣿⣶⣶⣤⣄⡉⠳⡄⠀⠀⠙⡄⠹⡄⡄⠀⣱⡿⠟⠛⠻⣿⡶⡀⣏⠐⡀⣢⠸⣝⡆⠀⠀
⠀⠀⠀⠀⣿⣿⣱⣻⣽⡇⣿⣷⣙⡞⣧⣏⢯⣿⢷⣻⣧⠐⣸⠛⠉⠉⠉⠛⢿⣦⡀⠀⠀⠀⠀⠀⠙⡴⣰⣿⣶⣷⣦⡀⠘⣿⡄⡧⠐⢠⠙⡖⣭⡇⠀⠀
⠀⠀⠀⢠⣿⢧⢷⣛⡽⡇⣿⡧⡇⢽⣳⣞⣻⣾⢿⣻⣿⠀⣿⣾⣿⣿⣷⡄⠀⠙⠃⠀⠀⠀⠀⠀⠀⠘⢆⣿⣿⣿⣿⠇⠀⣿⣷⡗⠠⠘⠀⠈⠳⣇⠀⠀
⠀⠀⠀⢸⣿⢺⣟⡧⡗⣇⣿⣽⡇⢚⣷⣞⣯⣿⣟⣿⢿⣷⡿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠉⠛⠠⠀⢰⣿⣿⡕⢀⠃⠀⠀⠀⠙⠀⠀
⠀⠀⠀⢸⣯⣟⣿⣳⠇⡇⣿⣿⡇⢘⣷⣿⣿⣿⣻⣯⢿⢿⡇⠁⠉⠋⠁⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠐⠂⠈⢠⣿⣿⣏⠀⠆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣾⣿⡽⣾⣭⡇⣏⣿⣿⣷⠀⣿⣿⣿⣿⣿⣳⢿⠘⡏⠀⠀⠀⠂⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⠸⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⣾⢯⣷⣻⢖⡇⣾⣽⣿⠙⣧⢜⣿⣿⣿⣿⣯⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡟⣯⣟⣆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣟⡾⣭⣟⡞⡇⣽⣿⣿⠀⠹⡜⣿⣿⣿⣿⣿⣾⠟⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢧⠀⠀⠀⠀⣀⢾⣟⠧⡏⣿⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣯⢷⣟⢾⡹⡇⣾⢹⣯⠀⠀⠘⣽⣿⣿⣿⣷⡿⢦⡀⠐⣂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠍ ⠘⠀ ⠠⢚⠀⢈⡾⣓⡇⢯⡚⡄⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣯⡿⣏⣾⡱⡇⣿⠠⣿⠀⠀⠀⠈⢾⣿⣿⣿⣿⠈⠻⠿⣿⣿⣑⣆⠠⣀⣤⣶⣶⣶⣶⣶⣄⡀⠔⠁⠀⠀⡆⠠⣟⢸⠄⢳⡁⡇⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣷⡿⣏⢶⣹⢣⣿⠀⢿⠀⠀⠀⠀⠀⢻⣿⣿⣿⠀⠀⠀⢀⡝⠙⠻⣟⠿⢿⣿⣯⣿⣷⣿⠏⠁⠄⡀⠀⠀⣇⠀⢻⣏⠂⢸⡁⣇⠀⠀⠀⠀⠀⠀
⠀⠀⣸⣯⢿⡜⣧⢻⠼⣿⠀⠀⠀⠀⠀⠀⠀⠀⣻⣿⣳⡄⠐⠂⢹⡑⢦⡀⡜⡢⣌⠉⠁⣠⢮⢡⢢⡜⢾⢸⠐⠂⠸⠤⠽⣎⡔⢠⢓⢸⠀⠀⠀⠀⠀⠀
⠀⠀⣿⣟⡿⡜⣧⢻⣜⡇⡖⠀⠀⠀⠀⠀⡠⠊⠈⠟⣯⠇⠀⠀⡔⢉⠶⡱⣭⢳⡝⣗⣾⡝⣮⢳⢧⡞⢹⢂⠀⠀⠀⠀⠀⠀⠑⢮⡣⠼⡆⠀⠀⠀⠀⠀
⠀⢠⣿⡞⣽⡝⣮⢹⢜⡆⠁⠀⠀⠀⢠⠊⠀⠀⠀⠀⠹⣇⠀⣰⣿⠻⡘⡵⣩⢷⣫⡽⢧⣻⣜⡯⢏⡔⢌⠎⡆⠀⠀⠀⠀⠀⠀⠀⠙⣆⢧⠀⠀⠀⠀⠀
⠀⠈⣿⡝⣾⡝⣮⢹⣎⢧⠀⠀⢀⠔⠃⠀⠀⠀⠀⠀⠀⠉⢀⣿⣽⣷⡏⢶⡹⣾⠁⠠⠀⠌⣅⠸⢘⡹⣸⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠘⠷⠀⠀⠀⠀⠀
⠀⢸⣷⢻⣼⡳⣍⢾⣿⢺⡅⠀⠤⠂⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⢾⣷⣻⣷⣿⣿⣜⣡⢞⣰⠓⠷⡤⣥⠗⢸⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠈⡑⡀⠀⠀⠀
⠀⣼⣏⠷⣎⡷⡭⣞⣯⠽⣇⠊⡄⠀⠀⠀⠀⠀⠀⠀⠀⢲⣿⣯⣿⣟⢯⣿⠿⣛⡏⡞⢮⣽⡈⠆⠈⠁⢀⠘⡀⠸⡧⠀⠀⠀⠀⠀⠀⠀⠀⠰⠠⡀⠀⠀
⠀⣿⣎⠿⣜⣳⣓⣯⣟⢦⠇⡐⠀⠀⠀⠀⠀⠀⡐⡑⣆⣿⡿⣽⡿⠮⠇⠋⠱⢌⣿⣹⢳⡞⠐⠀⠀⠀⠂⠌⡀⠀⢿⣰⢯⡄⠀⠀⠀⠀⠀⠀⣽⣓⡀⠀
⢸⣽⡞⣽⢫⡷⡭⣿⡾⡇⣰⠀⢀⠀⡀⢀⢀⡠⣢⠃⣻⢿⡽⠟⠁⠀⠀⠀⠀⠈⣷⣯⢷⣻⠀⠀⠀⠀⠈⡔⠠⠀⠸⡿⡰⣞⣄⠀⠀⡀⠀⠀⢩⢞⠑⡄]]




