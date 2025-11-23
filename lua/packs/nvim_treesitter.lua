
-- `:TSInstall <language_to_install>`

-- `nvim-treesitter pasers`
return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	build = ":TSUpdate",
	opts = {
		-- `LazyVim` config for `treesitter`
		indent =    { enable = true },
		highlight = { enable = true },
		folds =     { enable = true },

		ensure_installed = {
			"ebnf","regex",
			"markdown","markdown_inline",
			"c","cpp","asm","python",
			"lua","luadoc","luap",
			"html","http","css",
			"ini","json","yaml",
			"make","cmake",
			"vim","vimdoc",
			"git_config","git_rebase",
			"awk","bash",
			"printf","query","diff",
			"javascript","jsdoc",
			"toml","tsx","typescript","xml"
		},
	},

	config = function(this,opts)
		require(this.name .. ".configs").setup(opts)
	end,

	--事件懒加载
	event = "VeryLazy"
}







