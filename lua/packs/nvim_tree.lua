---@diagnostic disable: undefined-global

-- 文件导航功能

-- Disable `netrw` at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit color
vim.opt.termguicolors = true

-- on_attach function
local function nvim_tree_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return {desc="nvim-tree: ".. desc,
		buffer = bufnr,
		noremap = true,
		silent = true,
		nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- help
	--'<Tab>',api.node.open.preview()
	--'<CR>' ,api.node.open.edit()
	vim.keymap.set('n', '?'    ,api.tree.toggle_help    ,opts('help'))

	-- 上层目录下层目录的切换
	vim.keymap.set('n', '-',api.tree.change_root_to_parent,opts('cd ..'))

	vim.keymap.set('n', '=',api.tree.change_root_to_node  ,opts('cd dir'))

end


return {
	"nvim-tree/nvim-tree.lua",

	version = "*",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},


	opts ={
		--大小写敏感,宽度
		sort =     {sorter = "case_sensitive"},
		view =     {width = 30},

		--简化空文件夹显示
		renderer = {group_empty = false},

		--过滤不显示
		filters =  {dotfiles = false},

		on_attach = nvim_tree_on_attach
	},

	keys = {
		--显示切换
		{'<leader>e',':NvimTreeToggle<CR>',  'n', { noremap = true }},
		--切换到当前目录
		{'<leader>E',':NvimTreeOpen %:h<CR>','n', { noremap = true }}
	},

	--懒加载
	lazy = true
}





