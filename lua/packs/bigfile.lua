---@diagnostic disable: undefined-global, unused-local

return {

	"LunarVim/bigfile.nvim",

	enabled = true,
	lazy = false,
	--event = "VeryLazy",

	opts={
		-- size of the file in MiB, the plugin round file sizes to the closest MiB
		filesize = 2,

		-- autocmd pattern or function see <### Overriding the detection of big files>
		pattern = { "*" },


		-- features to disable
		features = {
			--lsp	detaches the lsp client from buffer
			--treesitter	disables treesitter for the buffer
			--illuminate	disables RRethy/vim-illuminate for the buffer
			--indent_blankline	disables lukas-reineke/indent-blankline.nvim for the buffer
			--syntax	:syntax off for the buffer
			--filetype	filetype = "" for the buffer
			--vimopts	swapfile = false foldmethod = "manual" undolevels = -1 undoreload = 0 list = false for the buffer
			--matchparen	:NoMatchParen globally, currently this feature will stay disabled, even after you close the big file

			"indent_blankline",
			"illuminate",
			"lsp",
			"treesitter",
			"syntax",
			"matchparen",
			"vimopts",
			"filetype",
			{
				name = "mini.indentscope",
				disable = function (buf)
					vim.b[buf].miniindentscope_disable = true
				end
			},

			{
				name = "cmp",
				disable = function(buf)
					local ok, cmp = pcall(require, "cmp")
					if ok then
						cmp.setup.buffer({ enabled = false })
					end
				end,
			}

		},
	},

	config = function(_, opts)
		require("bigfile").setup(opts)
	end,

}























