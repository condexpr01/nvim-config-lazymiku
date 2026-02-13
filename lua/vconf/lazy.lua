---@diagnostic disable: undefined-global


-- 克隆lazy包管理器:Lazy
local function load_lazy(lazy_setup_table)

	-- lazy.nvim
	local lazy_path = vim.fn.stdpath("data")
						.. "/lazy/lazy.nvim"

	-- 如果没有就克隆 
	if not (vim.uv or vim.loop).fs_stat(lazy_path) then

		--git用`ssh`代替路径
		--require("vconf.git_ssh")(true)

		-- git clone
		vim.fn.system({
			"git","clone",
			"--filter=blob:none",
			"--branch=stable",
			"https://github.com/folke/lazy.nvim.git",
			lazy_path
		})

	end

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo(
			{{"Fatal: git didn't clone lazy package manager."}},
			true, {})

		do return false end
	end

	-- lazy运行时路径run time path
	vim.opt.rtp:prepend(lazy_path)


	-- lazy配置
	require("lazy").setup(lazy_setup_table)

	do return true end
end


local opts= {

	spec = {
		{import="packs" },
	},

	performance = {
		rtp = {
			--禁用自带插件
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"zipPlugin",
				"matchparen",
				"matchit",
				"netrwPlugin",
				"tohtml",
				"tutor"
			}
		}
	},

	lazy = false
}

-- 不超时主键
vim.g.mapleader = ';'
vim.opt.timeout=false

-- lazy加载失败会return false,可处理
load_lazy(opts)










