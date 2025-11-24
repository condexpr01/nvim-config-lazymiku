---@diagnostic disable: undefined-global
return {
	"andymass/vim-matchup",
	event = { "VeryLazy" },

	config = function()

		-- 启用更智能的括号/符号匹配
		vim.g.matchup_matchparen_deferred = 1

		-- 允许同字符（like-pairs）匹配：比如 "..." 、 '...' 、 /.../ 、 *...* 等
		vim.g.matchup_matchpref = { like_pair = 1 }

	end,
}

