---@diagnostic disable: undefined-global

return {
	enabled = true,

	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",

	event = "VeryLazy",

	opts = {
		suggestion = {
			enabled = not vim.g.ai_cmp,
			auto_trigger = true,
			hide_during_completion = vim.g.ai_cmp,

			keymap = {
				accept = false, -- handled by `nvim-cmp/blink.cmp`
				prev = "<leader>[",
				next = "<leader>]",
			},
		},
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
