---@diagnostic disable: undefined-global

return {
	"condexpr01/nvim-audio.nvim",

	build = function (plugin)
		vim.cmd("make -C " .. plugin.dir)
	end,

	event = "VeryLazy",

	opts = {
		volume=1.0,
		bind_when_setup = true
	},

	config = function (main, opts)
		local M = require('nvim-audio')
		M.setup(opts)

		--register wav(requires: 44100sample, 2channel, pixels-fmt: SDL_AUDIO_F32(float))
		M.fn.load_wav("__tick", main.dir .. '/wav/tick.wav')


		M.fn.load_wav("aaa", vim.fn.stdpath('config') .. '/wav/aaa.wav')
		M.fn.load_wav("breakshadow", vim.fn.stdpath('config') .. '/wav/breakshadow.wav')
		M.fn.load_wav("change", vim.fn.stdpath('config') .. '/wav/change.wav')
		M.fn.load_wav("command", vim.fn.stdpath('config') .. '/wav/command.wav')
		M.fn.load_wav("dd", vim.fn.stdpath('config') .. '/wav/dd.wav')
		M.fn.load_wav("fate", vim.fn.stdpath('config') .. '/wav/fate.wav')
		M.fn.load_wav("focus", vim.fn.stdpath('config') .. '/wav/focus.wav')
		M.fn.load_wav("givelight", vim.fn.stdpath('config') .. '/wav/givelight.wav')
		M.fn.load_wav("happytime", vim.fn.stdpath('config') .. '/wav/happytime.wav')
		M.fn.load_wav("holycmd", vim.fn.stdpath('config') .. '/wav/holycmd.wav')
		M.fn.load_wav("ice", vim.fn.stdpath('config') .. '/wav/ice.wav')
		M.fn.load_wav("judgement", vim.fn.stdpath('config') .. '/wav/judgement.wav')
		M.fn.load_wav("listened-cmd", vim.fn.stdpath('config') .. '/wav/listened-cmd.wav')
		M.fn.load_wav("lookhere", vim.fn.stdpath('config') .. '/wav/lookhere.wav')
		M.fn.load_wav("magic-start", vim.fn.stdpath('config') .. '/wav/magic-start.wav')
		M.fn.load_wav("noemo", vim.fn.stdpath('config') .. '/wav/noemo.wav')
		M.fn.load_wav("showtime", vim.fn.stdpath('config') .. '/wav/showtime.wav')
		M.fn.load_wav("silence", vim.fn.stdpath('config') .. '/wav/silence.wav')
		M.fn.load_wav("treasure", vim.fn.stdpath('config') .. '/wav/treasure.wav')
		M.fn.load_wav("world", vim.fn.stdpath('config') .. '/wav/world.wav')


		--timer for call resources
		vim.g.audio_play_resources = 0;
		vim.fn.timer_start(100,function()
			vim.g.audio_play_resources = 2
		end,{["repeat"] = -1})

		--timer for call __tick resources
		vim.g.audio_play_ticks_resources = 0;
		vim.fn.timer_start(100,function()
			vim.g.audio_play_ticks_resources = 1
		end,{["repeat"] = -1})

		--template(for using vim.g.audio_play_resources)
		local function audio_template(event,alias_name)
			vim.api.nvim_create_autocmd(event,{
				callback=function()
					local res = vim.g.audio_play_resources
					if res and res > 0 then
						vim.g.audio_play_resources= res - 1

						local ok, what = M.fn.ra_play(alias_name)
						if not ok then
							vim.notify(string.format("status:%d, what:%s",ok,what))
						end
					end
				end
			})
		end

		--binding
		audio_template("TextYankPost","world")
		audio_template("FileChangedShell","change")

		audio_template("InsertEnter","showtime")
		audio_template("InsertLeave","fate")

		audio_template("CmdlineEnter","command")
		audio_template("CmdlineLeave","dd")

		audio_template("BufWritePost","happytime")
		audio_template("BufDelete","lookhere")
		audio_template("BufModifiedSet","aaa")

		audio_template("CompleteDone","judgement")

		audio_template("RecordingEnter","givelight")
		audio_template("RecordingLeave","magic-start")

		audio_template("SwapExists","breakshadow")

		audio_template("FocusGained","focus")


		--binding tick
		vim.api.nvim_create_autocmd({"FocusLost","BufEnter","VimSuspend","VimResume"},{
			callback=function()
				local res = vim.g.audio_play_ticks_resources
				if res and res > 0 then
					vim.g.audio_play_ticks_resources= res - 1

					local ok, what = M.fn.ra_play("__tick")
					if not ok then
						vim.notify(string.format("status:%d, what:%s",ok,what))
					end
				end
			end
		})

	end

}
