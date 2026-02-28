---@diagnostic disable: undefined-global

return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",

	opts={
		--[[
		on_attach = function(bufnr)
			vim.keymap.set("", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,]]
	},
	keys={
		{ "<leader>t", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
	},
}

