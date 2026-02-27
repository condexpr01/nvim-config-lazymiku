---@diagnostic disable: undefined-global, unused-local

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

local function matchparen_disable()
	if vim.fn.exists ":DoMatchParen" ~= 2 then
		return
	end
	vim.cmd "NoMatchParen"
end


local function lsp_disable(buf)
	vim.api.nvim_create_autocmd({ "LspAttach" }, {
		buffer = buf,
		callback = function(args)
			vim.schedule(function()
				vim.lsp.buf_detach_client(buf, args.data.client_id)
			end)
		end,
	})
end

local function treesitter_disable()
	local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
	if not status_ok then return end

	for _, mod_name in ipairs(ts_config.available_modules()) do
		local module_config = ts_config.get_module(mod_name) or {}
		local old_disabled = module_config.disable
		module_config.disable = function(lang, buf)
			return (type(old_disabled) == "table" and vim.tbl_contains(old_disabled, lang))
				or (type(old_disabled) == "function" and old_disabled(lang, buf))
		end
	end

end


local function illuminate_disable(buf)
	pcall(function()
		require("illuminate.engine").stop_buf(buf)
	end)
end


local function indent_blankline_disable()
	pcall(function()
		require("indent_blankline.commands").disable()
	end)
end

local function vimopts_disable()
	vim.opt_local.swapfile = false
	vim.opt_local.foldmethod = "manual"
	vim.opt_local.undolevels = -1
	vim.opt_local.undoreload = 0
	vim.opt_local.list = false
end

local function syntax_disable()
	vim.cmd "syntax clear"
	vim.opt_local.syntax = "OFF"
end

local function filetype_disable()
	vim.opt_local.filetype = ""
end


local function miniindentscope_disable (buf)
	vim.b[buf].miniindentscope_disable = true
end

local function nvim_cmp_disable()
	local ok, cmp = pcall(require, "cmp")
	if ok then
		cmp.setup.buffer({ enabled = false })
	end
end

local function blink_disable()
	vim.b.completion=false
end

local function bigfile_callback()
	if vim.b.checked_bigfile==true then return end

	if (vim.fn.line2byte(vim.fn.line("$")+1) > 1.5 * 1024 * 1024) then
		vim.schedule(function()
			ep("[bigfile] disable",function()
				vimopts_disable()
				syntax_disable()
				filetype_disable()
				miniindentscope_disable(0)
				nvim_cmp_disable()
				blink_disable()
				matchparen_disable()
				lsp_disable(0)
				treesitter_disable()
				illuminate_disable(0)
				indent_blankline_disable()
			end)

			vim.b.checked_bigfile = true
			vim.notify("Bigfile optimizations have been applied !",vim.log.levels.INFO)
		end)

	--测试
	--else vim.notify("small file !",vim.log.levels.INFO)

	end

end

--进入缓冲后，操作时实时检测大小
vim.api.nvim_create_autocmd({"BufReadPre","BufReadPost",
	"TextChanged", "TextChangedI",
	"TextChangedP" },{
	callback = bigfile_callback})




