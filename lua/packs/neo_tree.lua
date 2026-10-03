return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},

	lazy = false, -- neo-tree will lazily load itself

	opts ={
		filesystem = {
			filtered_items = {
				visible = true,
				children_inherit_highlights = false,
			},

			window = {
				mappings = {
					["/"] = "",
					["#"] = "",
					["*"] = "",
					["-"] = "navigate_up",
					["="] = "set_root",
					["?"] = "fuzzy_finder",
					["g?"] = "show_help",
				}
			}
		}

	},

	keys = {
		--显示切换
		{'<leader>e','<cmd>Neotree toggle<CR>', 'n', { noremap = true }},
		--切换到当前目录
		{'<leader>E','<cmd>Neotree %:h<CR>',    'n', { noremap = true }}
	},

}
