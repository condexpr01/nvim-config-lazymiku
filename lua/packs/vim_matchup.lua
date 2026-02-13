---@diagnostic disable: undefined-global
return {
	"andymass/vim-matchup",
	event = "VeryLazy",

	config = function()

		vim.g.matchup_enable=true

		vim.g.matchup_matchparen_enabled = 1 --高亮
		vim.g.matchup_motion_enabled = 1     --启用跳转

	end,
}

