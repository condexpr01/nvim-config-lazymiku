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
	branch = 'master',
	build = ":silent! TSUpdate",

	event = "VeryLazy",

	opts = {
		-- `LazyVim` config for `treesitter`
		indent =    { enable = true},
		highlight = { enable = true },
		folds =     { enable = true },

		auto_install = false,
		sync_install = false,

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
		},
	},

	config = function(this,opts)
		local utils = ep("[nvim_treesitter] utils",require,"nvim-treesitter.utils")

		ep("[nvim_treesitter] join_path",function()
			if utils then
				local origin_join_path = utils.join_path;
				utils.join_path = function(...)
					local result = origin_join_path(...)

					--filter
					if vim.fn.has("win32") and result then
						result = result:gsub('\\','/')
					end

					return result
				end

			end
		end)

		local epr = ep("[nvim_treesitter] configs",require,"nvim-treesitter.configs")
		if epr then epr.setup(opts)
		else return end

	end,

}




