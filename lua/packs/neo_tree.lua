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
					["z"] = "",
					["-"] = "navigate_up",
					["="] = "set_root",
					["?"] = "fuzzy_finder",
					["g?"] = "show_help",
				}
			},

			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},

		buffers = {
			follow_current_file = {
				-- This will find and focus the file in the active buffer every time
				enabled = true,
				-- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				leave_dirs_open = true,
			},
		}


	},

	keys = {
		--显示切换
		{'<leader>e','<cmd>Neotree toggle<CR>', 'n', { noremap = true }},
		--切换到当前目录
		{'<leader>E','<cmd>Neotree %:h<CR>',    'n', { noremap = true }}
	},

}
