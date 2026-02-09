---@diagnostic disable: undefined-global
return {
	"andymass/vim-matchup",
	event = "VeryLazy",

	config = function()

		vim.g.matchup_enable=true

		vim.g.matchup_matchparen_enabled = 1 --高亮
		vim.g.matchup_motion_enabled = 1     --启用跳转
		vim.g.matchup_surround_enabled = 0  -- 包围
		vim.g.matchup_text_obj_enabled = 0   --文本对象
		vim.g.matchup_delim_stopline = 0     -- 无限制

	end,
}

