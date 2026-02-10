---@diagnostic disable: undefined-global

return {

	enabled = true,

	"folke/noice.nvim",

	event = "VeryLazy",

	dependencies = {
		"MunifTanjim/nui.nvim",
		--"rcarriga/nvim-notify",
	},

	opts = {

		cmdline = { enabled = true},
		notify = { enabled = false},
		messages = { enabled = false},
		popupmenu = { enabled = false},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
			},

			message = {enabled = false,},
			progress = {enabled = false,},
			throttle = 100/30,
		},

		throttle=1000/30,

		health={
			checker=true,
		},

		presets = {
			command_palette = true,
			inc_rename = true,
			bottom_search = false,
			long_message_to_split = false,
			lsp_doc_border = false,
		},

	},

}



