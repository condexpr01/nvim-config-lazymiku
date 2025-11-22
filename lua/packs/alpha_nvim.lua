---@diagnostic disable: undefined-global

-- `miku`
return {
	"goolord/alpha-nvim",

	event = "VimEnter",

	opts = function()
		local dashboard = require("alpha.themes.dashboard")
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
					.. " Works cmds","<cmd>lua require\"works.wcmds\"(1)<cr>"),

					dashboard.button("e", "⚡  "
					.. " Edit Works cmds","<cmd>lua require\"works.wcmds\"(0)<cr>"),
				},
				opts = {spacing = 0}
			},
			{
				type = "group",
				val = {
					dashboard.button("c", "⚡  "
					.. " CmpStatus","<cmd>lua require\"cmp\"<cr>"
					.. "<cmd>CmpStatus<cr>"),

					dashboard.button("h", "⚡  "
					.. " Checkhealth","<cmd>checkhealth<cr>"),

					dashboard.button("l", "⚡󰒲 " .. " Lazy","<cmd>Lazy<cr>"),

					dashboard.button("m", "⚡  "
					.. " Mason","<cmd>lua require\"mason\"<cr>"
					.. "<cmd>Mason<cr>"),

					dashboard.button("n", "⚡  "
					.. " Nvim config","<cmd>lua require(\"nvim-tree\")<cr>"
					.. "<cmd>lua vim.cmd(\"NvimTreeToggle \".. vim.fn.stdpath(\"config\"))<cr>"),

					dashboard.button("p", "⚡  "
					.. " LspInfo","<cmd>lua require\"mason-lspconfig\"<cr>"
					.. "<cmd>LspInfo<cr>"),

					dashboard.button("t", "⚡  "
					.. " TSModuleInfo","<cmd>lua require\"nvim-treesitter\"<cr>"
					.. "<cmd>TSInstallInfo<cr>"),

				},
				opts = {spacing = 0}
			},
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		vim.cmd("hi AlphaHeader guifg=#39C5BB")

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
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				dashboard.section.footer.val = "⚡ Neovim loaded "
				.. stats.loaded.. "/".. stats.count .. " plugins "
				.. "in "  .. stats.startuptime .. "ms\n"
				.. "⚡ Done: ".. stats.times.LazyDone .. "ms "
				.. "⚡ Start: ".. stats.times.LazyStart .. "ms"
				pcall(vim.cmd.AlphaRedraw)
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




