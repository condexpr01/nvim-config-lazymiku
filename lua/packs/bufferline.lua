
-- show buffer UI,
-- keys : b for buffer
return {
	--enabled = false,

	'akinsho/bufferline.nvim',

	version = "*",

	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},

	keys = {
		--左右buffer移动
		{"<leader>bh","<cmd>BufferLineCyclePrev<CR>",mode='n',silent=false},
		{"<leader>bl","<cmd>BufferLineCycleNext<CR>",mode='n',silent=false},

		--buffer选择
		{"<leader>bp","<cmd>BufferLinePick<CR>"     ,mode='n',silent=false},

		--buffer关闭其它
		{"<leader>bco","<cmd>BufferLineCloseOthers<CR>",mode='n',silent=false},

		--buffer删除
		{"<leader>bd","<cmd>bdelete<CR>" ,mode='n',silent=false},
		{"<leader>bD","<cmd>bdelete!<CR>",mode='n',silent=false},
	},

	opts = {},

	--事件懒加载
	event = "VeryLazy"
}
