
return {

	-- `noice`对`make cmake`等终端的显示不是很好
	enabled = false,

	"folke/noice.nvim",

	event = "VeryLazy",

	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify", -- 可选，更好看的通知
	},

	opts = {},

	keys = {
		--查看新消息,或刷新
		{'<leader>n','<cmd>NoiceAll<CR>',  'n', { noremap = true }},
	},
}


