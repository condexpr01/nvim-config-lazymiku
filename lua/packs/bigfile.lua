---@diagnostic disable: undefined-global, unused-local

local function exec_bigfile_autocmds()

	local bigfile_ok, _ = pcall(require, "bigfile")

	if (bigfile_ok) then

		vim.g.force_bigfile = true

		-- bigfile plugin will set a buffer variable "bigfile_detected"
		-- must delete it first to retrigger the autocmds
		pcall(vim.api.nvim_buf_del_var,0,"bigfile_detected")

		vim.api.nvim_exec_autocmds("BufReadPre", {buffer = 0})
		vim.api.nvim_exec_autocmds("BufReadPost", {buffer = 0})

		vim.g.force_bigfile = nil


	end

end


return {

	"LunarVim/bigfile.nvim",

	enabled = true,
	lazy = false,
	--event = "VeryLazy",

	opts={
		-- size of the file in MiB, the plugin round file sizes to the closest MiB
		filesize = 1,

		-- autocmd pattern or function see <### Overriding the detection of big files>
		-- vim.g.force_bigfile can be set to true to force bigfile mode
		-- pattern = { "*" , function () return vim.g.force_bigfile end },
		pattern = function () return vim.g.force_bigfile end,


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

			--[[
			{
				name = "mini.indentscope",
				disable = function (buf)
					vim.b[buf].miniindentscope_disable = true
				end
			},]]

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

		--initialize force_bigfile to false, use pattern '*'
		vim.g.force_bigfile = false
		require("bigfile").setup(opts)

	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "TextChangedP" }, {
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))

			if (size > 2 * 1024 * 1024) then
				exec_bigfile_autocmds()
				print("Current size: " .. size .. " bytes" .. " bigfile optimizations have been applied ")
			end

		end,
	})


	end,

}


