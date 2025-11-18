
return {
	'nvim-telescope/telescope.nvim',

	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	keys = {
		{'<leader>ff','<cmd>Telescope find_files<CR>',  'n', { noremap = true }},
		{'<leader>fg','<cmd>Telescope live_grep<CR>',  'n', { noremap = true }},
		{'<leader>fb','<cmd>Telescope buffers<CR>',  'n', { noremap = true }},
		{'<leader>fh','<cmd>Telescope help_tags<CR>',  'n', { noremap = true }},
	},

	event = {"VeryLazy"}
}
