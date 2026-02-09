
-- `mason lspconfig`
return {

	"mason-org/mason-lspconfig.nvim",

	opts = {

		ensure_installed ={
			"harper_ls",
			"clangd",
			"lua_ls",
			"vimls",
			"bashls",
			"cmake",
			"pyright",
			"pylsp",
			"jsonls",
			"yamlls",
		},

		automatic_enable =true
	},

	dependencies = {
		"neovim/nvim-lspconfig",

		{"mason-org/mason.nvim",
		opts = {ui = {icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}}}}
	},

	--事件懒加载
	lazy = true
}
