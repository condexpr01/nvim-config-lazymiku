
--状态栏
return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opt=true
	},

	opts = {
		options={
			theme = "horizon"
		}
	},

	--事件懒加载
	event = "VeryLazy"
}
