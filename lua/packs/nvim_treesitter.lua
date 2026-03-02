---@diagnostic disable: unused-local, undefined-global

-- `:TSInstall <language_to_install>`

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

-- `nvim-treesitter pasers`
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	event = "VeryLazy",

	opts = {
		-- `LazyVim` config for `treesitter`
		indent =    { enable = true},
		highlight = { enable = true },
		folds =     { enable = true },

		auto_install = true,
		sync_install = false,

		ensure_installed = {},

		--[[
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
		},]]

	},

	config = function(this,opts)
		local epr = ep("[nvim_treesitter] configs",require,"nvim-treesitter.configs")
		if epr then epr.setup(opts)
		else return end

		if true and jit.os == "Windows" then
			epr = ep("[nvim_treesitter] install",require,"nvim-treesitter.install")
			if epr then
				epr.compilers ={"cl","zig","gcc","clang","cc","c++","g++","clang++"}
			else return end
		end

	end,

}



