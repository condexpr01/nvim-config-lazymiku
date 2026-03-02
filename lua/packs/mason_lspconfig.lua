
-- `mason lspconfig`
return {

	"mason-org/mason-lspconfig.nvim",

	opts = {

		automatic_enable =true,
		ensure_installed ={
			--"clangd",
			"harper_ls",
			"lua_ls",
			"vimls",
			"bashls",
			"cmake",
			"pyright",
			"jsonls",
			"yamlls",
		},

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

