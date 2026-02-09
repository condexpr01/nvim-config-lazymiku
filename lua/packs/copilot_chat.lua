return {
	event="VeryLazy",

	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	opts = {},
}

