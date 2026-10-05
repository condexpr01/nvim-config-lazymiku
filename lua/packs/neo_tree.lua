---@diagnostic disable: undefined-global
return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
        -- { "3rd/image.nvim", opts = {} }, -- Optional image support
	},

	lazy = false, -- neo-tree will lazily load itself

	opts ={

		filesystem = {
			bind_to_cwd = false,

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

					[","] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" then
							vim.cmd.cd(node.path)
							vim.notify("cd: " .. node.path)
						else
							vim.notify("Not a directory", vim.log.levels.WARN)
						end
					end,

					["."] = function(state)
						local node = state.tree:get_node()

						if node then
    						vim.api.nvim_input(": " .. vim.fn.fnameescape(node.path) .. "<Home>")
						else
							vim.notify("Invalid node", vim.log.levels.WARN)
						end
					end,

					["-"] = "navigate_up",
					["="] = "set_root",
					["?"] = "fuzzy_finder",
					["g?"] = "show_help",
				}
			},

		},

	},

	keys = {
		--显示切换
		{'<leader>e','<cmd>Neotree toggle<CR>', 'n', { noremap = true }},
		--切换到当前目录
		{'<leader>E','<cmd>Neotree %:h<CR>',    'n', { noremap = true }}
	},

}
