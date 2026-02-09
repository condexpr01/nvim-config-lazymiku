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
			"--enable-config",
		},

	},
}

-- `clangd_config`根据平台选择自动生成配置文件
local function clangd_config()
	local uv = vim.loop
	local path,yaml_config

	--msys2
	if jit.os == "Windows" then
		path = uv.os_getenv("LOCALAPPDATA").."/clangd/config.yaml"
		yaml_config =[[
CompileFlags:
  Add:
    - --target=x86_64-w64-windows-gnu]]

		-- 确保目录存在(必要时创建)
		vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")

		-- 写入内容（保留换行）
		local f = io.open(path, "w")
		if f ~= nil then
			f:write(yaml_config)
			f:close()
		end

	end

end



-- 判断 (row, col) 是否落在注释节点里
local function in_comment(bufnr, row, col)
	-- get_lang，lsp不认这个文件类型就当成“非注释”
	local ok, lang = pcall(vim.treesitter.language.get_lang, vim.bo[bufnr].filetype)
	if not ok or not lang then return false end

	-- get_parser，失败就当成“非注释”
	local parser
	ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
	if not ok or not parser then return false end

	-- parse 语法树
	local ast
	ok, ast = pcall(parser.parse, parser)
	if not ok or not ast then return false end
	ast = ast[1]

	-- 取根节点
	local root = ast:root()
	if not root then return false end

	-- 找最小覆盖节点,传入的是start的位置，所以开始和结束都是一样的
	local node = root:descendant_for_range(row, col, row, col)
	while node do

		local t = node:type()

		-- 大部分语言注释节点都叫comment/line_comment/block_comment
		-- 这里找有子串comment的节点当成注释
		if t:find("comment") then
			return true
		end

		-- 出现任何问题在nvim中使用测试获取名字(lang改为语言,row,col从下标0开始,对应到文本行列):
		-- lua parser=vim.treesitter.get_parser(0,"lang")
		-- =parser.parse(parser)[1]:root():descendant_for_range(row,col,row,col):type()

		node = node:parent()
	end
	return false
end


-- 过滤掉落在注释里的诊断
local function filter_diags(diags, bufnr)
	local out = {}
	for _, d in ipairs(diags) do

		--不管end只管start
		local r = d.range.start

		local ok, is_comment = pcall(in_comment, bufnr, r.line, r.character)

		if not (ok and is_comment) then
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

		-- 修改vim.lsp.handlers["textDocument/publishDiagnostics"]不进行注释诊断处理
		local origin = vim.lsp.handlers["textDocument/publishDiagnostics"]

		vim.lsp.handlers["textDocument/publishDiagnostics"] =
		function(err, result, ctx, config)
			--[[
			-- 测试使用，dfs递归遍历表
			local function show_tree(t)
				if (type(t) ~= "table") then return end

				for k,v in pairs(t) do
					print(k,"\t\t", v)
					if (type(v) == "table") then
						print("^^^^^^^^^")
						show_tree(v)
						print("$$$$$$$$$\n\n")
					end
				end
			end

			for k,v in pairs(result.diagnostics) do
				print("#",k,"\t\t", v)
				show_tree(v)
				print("\n\n")
			end
			]]

			if result and result.diagnostics then
				local bufnr = vim.uri_to_bufnr(result.uri)
				result.diagnostics = filter_diags(result.diagnostics, bufnr)
			end

			return origin(err, result, ctx, config)
		end

	end,

	keys = lsp_keys,

	-- 懒加载
	lazy = true
}


