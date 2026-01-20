---@diagnostic disable: undefined-global
return {
	"andymass/vim-matchup",
	event = { "VeryLazy" },

	config = function()

		-- 允许同字符（like-pairs）匹配：比如 "..." 、 '...' 、 /.../ 、 *...* 等
		vim.g.matchup_matchpref = { like_pair = 1 }

	end,
}

