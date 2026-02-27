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


	local function notify_template(event,content,topic)
		vim.api.nvim_create_autocmd(event, {
			callback =vim.schedule_wrap(function()
				ep("[nvim_notify] autocmd",notify,content,"info",{ title = topic, timeout=839})
			end)
		})
	end

	-- 保存文件
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = vim.schedule_wrap(function(ev)
			local filename = vim.fn.fnamemodify(ev.file, ":t")
			local size = vim.fn.getfsize(ev.file)
			ep("[nvim_notify] autocmd",notify,string.format("Saved(%s): %s",format_size(size),filename),"info",
				{ title = "欢唱，以我之名！闪耀时刻！"})
		end)
	})

	notify_template("TextYankPost","TextYank","往昔之影，奉我之命")

	notify_template("FileChangedShell","FileChanged","原灵现世")

	notify_template("VimSuspend","VimSuspend","星辰，为我降下")
	notify_template("VimResume","VimResume","极寒，任我驱使")

	notify_template("BufModifiedSet", "BufModifiedSet", "让世界热闹起来吧！")
	notify_template("BufDelete", "BufDelete", "化作浮沫吧")

	notify_template("CmdlineEnter", "CmdlineEnter", "律令")
	notify_template("CmdlineLeave", "CmdlineLeave", "命运，在此显现")

	notify_template("CompleteDone", "CompleteDone", "此乃天道")


	notify_template("FocusGained", "FocusGained", "向着(星辰)与深渊")
	notify_template("FocusLost", "FocusLost", "向着星辰与(深渊)")

	notify_template("RecordingEnter", "Recording", "来点灯光")
	notify_template("RecordingLeave", "Recorded", "魔术开场")

	notify_template("SwapExists", "Swap Exists", "坚冰，断绝深仇")

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

