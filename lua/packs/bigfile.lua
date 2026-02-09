
---@diagnostic disable: undefined-global, unused-local

local function exec_bigfile_autocmds()

	local bigfile_ok, _ = pcall(require, "bigfile")

	if (bigfile_ok) then
		vim.b.force_bigfile = true  --pattern control

		-- bigfile plugin will set a buffer variable "bigfile_detected"
		-- must delete it first to retrigger the autocmds
		pcall(vim.api.nvim_buf_del_var,0,"bigfile_detected")

		vim.api.nvim_exec_autocmds("BufReadPre",  {buffer = 0})
		vim.api.nvim_exec_autocmds("BufReadPost", {buffer = 0})

		vim.b.force_bigfile = nil   --pattern control
	end

end

return {

	"LunarVim/bigfile.nvim",

	lazy = false,

	opts={
		-- size of the file in MiB
		filesize = 1.5,

		-- autocmd pattern or function see <### Overriding the detection of big files>
		-- vim.b.force_bigfile can be set to true to force bigfile mode
		pattern = function () return vim.b.force_bigfile end,

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
			-- "vimopts",
			"filetype",

			--[[{
				name = "mini.indentscope",
				disable = function (buf)
					vim.b[buf].miniindentscope_disable = true
				end
			},]]

			--[[{	name = "nvim-cmp",
				disable = function(buf)
					local ok, cmp = pcall(require, "cmp")
					if ok then
						cmp.setup.buffer({ enabled = false })
					end
				end,}]]

			{	name = "cmp-blink",
				disable = function()
					vim.b.completion=false
				end,}
		},

	},

	config = function(_, opts)

		require("bigfile").setup(opts)

		local function bigfile_callback()
			local _,is_big= pcall(vim.api.nvim_buf_get_var,0,"bigfile_detected")
			if is_big==1 then return end

			if (vim.fn.line2byte(vim.fn.line("$")+1) > 1.5 * 1024 * 1024) then
				vim.schedule(
					function()
						exec_bigfile_autocmds()
						vim.notify(" Bigfile optimizations have been applied !",
							vim.log.levels.INFO)
					end
				)
			end
		end

		local function bigfile_callback_defer_fn()
			vim.defer_fn(bigfile_callback,139)
		end

		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "TextChangedP" },
			{callback = bigfile_callback_defer_fn})

	end,
}



