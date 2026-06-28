---@diagnostic disable: unused-local, undefined-global

-- `:TSInstall <language_to_install>`

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	event = "VeryLazy",
}
