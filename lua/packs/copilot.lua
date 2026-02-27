---@diagnostic disable: undefined-global

return {
	"zbirenbaum/copilot.lua",

	dependencies = {
		"copilotlsp-nvim/copilot-lsp",
	},

	cmd = "Copilot",

	event = "VeryLazy",

	opts = {

		panel = {
			enabled = true,

			-- suggestion auto refresh
			auto_refresh = false,

			keymap = {},

			layout = {
				-- | top | left | right | bottom |
				position = "bottom",
				ratio = 0.39
			},
		},

		-- disable the `copilot` suggestion
		suggestion = {
			enabled = false,

			--auto ghost text
			auto_trigger = false,

			hide_during_completion = false,
			debounce = 75,

			trigger_on_accept = false,
			keymap = {},

		},

		-- Set to `true` to suppress completion limit reached popup
		disable_limit_reached_message = true,


	},


	keys = {
		--显示panel <leader>ze can refresh, don't need to map refresh
		{'<leader>ze','<cmd>Copilot panel<CR>',          'n', { noremap = true }},
		{'<leader>zz','<cmd>Copilot panel accept<CR>',   'n', { noremap = true }},

		{'<leader>zj','<cmd>Copilot panel jump_next<CR>','n', { noremap = true }},
		{'<leader>zk','<cmd>Copilot panel jump_prev<CR>','n', { noremap = true }},
	},

}

