---@diagnostic disable: undefined-global, unused-local

local function ep(what,func,...)
	local ok,result = pcall(func,...)

	if not ok then
		print("Error:",tostring(what));
		return nil
	end

	return result;
end

local function format_size(bytes)
	if bytes < 1024 then return bytes .. "B"
	elseif bytes < 1024*1024 then return string.format("%.1fK", bytes/1024)
	else return string.format("%.1fM", bytes/(1024*1024)) end
end

local function autocmds(notifymod)
	local notify = notifymod

	-- 5 notify resoures per second
	vim.g.notify_resources = 0;
	vim.fn.timer_start(1000,function()
		vim.g.notify_resources = 5
	end,{["repeat"] = -1})

	local function notify_template(event,content,topic)
		vim.api.nvim_create_autocmd(event, {
			callback =vim.schedule_wrap(function()
				local res = vim.g.notify_resources
				if res and res > 0 then
					vim.g.notify_resources = res - 1
					ep("[nvim_notify] autocmd",notify,content,"info",{ title = topic, timeout=839})
				else
					ep("[nvim_notify] autocmd",vim.notify,content,vim.log.levels.TRACE)
				end
			end)
		})
	end

	-- 保存文件
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = vim.schedule_wrap(function(ev)
			local filename = vim.fn.fnamemodify(ev.file, ":t")
			local size = vim.fn.getfsize(ev.file)

			local res = vim.g.notify_resources
			if res and res > 0 then
				ep("[nvim_notify] autocmd",notify,string.format("Saved(%s): %s",format_size(size),filename),"info",
					{ title = "让世界热闹起来！"})
				vim.g.notify_resources = res - 1
			else
				ep("[nvim_notify] autocmd",vim.notify,
					string.format("Saved(%s): %s",format_size(size),filename),
					vim.log.levels.TRACE)
			end
		end)
	})

	notify_template("TextYankPost","TextYank","miku miku mi！")

	notify_template("FileChangedShell","FileChangedShell","No-o!")
	notify_template("SwapExists", "Swap Exists", "No-o！")

	notify_template("InsertEnter","InsertEnter","哒哒哒！")
	notify_template("InsertLeave","InsertLeave","啦啦啦！")

	notify_template("CmdlineEnter", "CmdlineEnter", "律令")
	notify_template("CmdlineLeave", "CmdlineLeave", "噔噔！")

	notify_template("BufDelete", "BufDelete", "请看这边！")

	notify_template("FocusGained", "FocusGained", "我得集中精神！")
	notify_template("FocusLost", "FocusLost", "向着星辰与深渊")

	notify_template("RecordingEnter", "Recording", "来点灯光")
	notify_template("RecordingLeave", "Recorded", "魔术开场")

	notify_template("CompleteDone", "CompleteDone", "锵锵！")

end


return {
	'rcarriga/nvim-notify',

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	enabled=true,
	event="VeryLazy",

	opts = {
		fps = 60,
		render = "compact",
		stages = "slide",
		timeout = 1500,
		top_down = true,
		max_width = 50,
		max_height = 10,
	},

	config=function (_,opts)
		local notify = ep("[nvim_notify] notify",require,"notify")
		if not notify then return end

		notify.setup(opts)
		vim.notify = notify


		vim.defer_fn(function()
			ep("[nvim_notify] autocmds",autocmds,notify)
		end, 100)
	end,

	keys = {
		--查看新消息,或刷新
		{'<leader>n','<cmd>Notifications<CR>',  'n', { noremap = true }},
	},
}

