---@diagnostic disable: undefined-global

local lsp_keys = {
	-- 代码跳转
	{ "gi", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },
	{ "ge", vim.lsp.buf.type_definition, desc = "Type definition", mode = "n" },

	-- 信息查看
	{ "K", vim.lsp.buf.hover, desc = "Hover doc", mode = "n" },
	{ "<C-k>", vim.lsp.buf.signature_help, desc = "Signature help", mode = "n" },

	-- 重构 / 操作
	{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol", mode = "n" },
	{ "<leader>a" , vim.lsp.buf.code_action, desc = "Code action", mode = "n" },

	--diagnostic
	{ "<leader>do", vim.diagnostic.open_float, desc = "Line diagnostics", mode = "n" },
	{ "<leader>dl", vim.diagnostic.setloclist, desc = "Diagnostics list", mode = "n" },

	--`goto_next` and `go_prev` has deprecated
	--`{ "]d", vim.diagnostic.goto_next, desc = "Next diagnostic", mode = "n" },`
	--`{ "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic", mode = "n" },`
	{ "<leader>dj",function() vim.diagnostic.jump({count = 1})  end, desc = "Next diagnostic", mode = "n" },
	{ "<leader>dk",function() vim.diagnostic.jump({count = -1}) end, desc = "Previous diagnostic", mode = "n" },

}

local lsp_opts = {
	lua_ls = {
		cmd = { 'lua-language-server' },
		filetypes = { 'lua' },
		root_markers = {
			".luarc.json", ".luarc.jsonc",
			".luacheckrc", ".stylua.toml",
			"stylua.toml", "selene.toml",
			"selene.yml", ".git" },
		settings = {Lua = {runtime = {version = 'LuaJIT',}}}
	},

	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--enable-config", --`$XDG_CONFIG_HOME/clangd/config.yaml`
		},

	},
}

-- 源`XDG_CONFIG_HOME/clangd/config.yaml`
-- `clangd`根据平台选择自动生成配置文件
local function clangd_config()
	local uv = vim.loop

	local yaml_config = [[
CompileFlags:
	Add:
		- --target=x86_64-w64-windows-gnu
		- -I${XDG_CONFIG_HOME}/nvim/vapi
]]

	local real_config = yaml_config:gsub("%${(.-)}",
		function (env)
			return uv.os_getenv(env) or ""
		end)

	local path

	if jit.os == "Windows" then
		path = uv.os_getenv("LOCALAPPDATA").."/clangd/config.yaml"
	elseif jit.os == "Linux" or jit.os == "OSX" then
		path = uv.os_getenv("HOME").."/.config/clangd/config.yaml"
	else
		path = uv.os_getenv("XDG_CONFIG_HOME").."/clangd/config.yaml"
	end


	-- 确保目录存在
	vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")

	-- 写入内容（保留换行）
	local f = assert(io.open(path, "w"))
	f:write(real_config)
	f:close()
end


-- `treesitter`判断位置是否处于注释节点
local function in_comment(bufnr, row, col)
	local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
	if not lang then return false end

	local parser = vim.treesitter.get_parser(bufnr, lang)
	if not parser then return false end

	local tree = parser:parse()[1]
	if not tree then return false end

	local root = tree:root()
	local node = root:descendant_for_range(row, col, row, col)

	while node do
		if node:type():find("comment") then
			return true
		end
		node = node:parent()
	end

	return false
end

-- 过滤注释中的诊断
local function filter_diags(diags, bufnr)
	local out = {}
	for _, d in ipairs(diags) do
		local r = d.range.start
		if not in_comment(bufnr, r.line, r.character) then
			table.insert(out, d)
		end
	end
	return out
end


return {
	"neovim/nvim-lspconfig",

	opts = lsp_opts,

	config = function(_ ,opts)
		clangd_config()

		for k,v in pairs(opts) do
			vim.lsp.config[k] = v
			vim.lsp.enable(k)
		end

		-- Hook LSP注释诊断处理
		local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]

		vim.lsp.handlers["textDocument/publishDiagnostics"] =
			function(err, result, ctx, config)
				if result and result.diagnostics then
					local bufnr = vim.uri_to_bufnr(result.uri)
					result.diagnostics = filter_diags(result.diagnostics, bufnr)
				end
				return orig(err, result, ctx, config)
			end

	end,

	keys = lsp_keys,

	-- 懒加载
	lazy = true
}






