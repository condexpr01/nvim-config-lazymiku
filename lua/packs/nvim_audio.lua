---@diagnostic disable: undefined-global

return {
	"condexpr01/nvim-audio.nvim",

	enabled = true,

	build = function (plugin)
		vim.cmd("make -C " .. plugin.dir)
	end,

	event = "VeryLazy",

	opts = {
		-- volume gain
		volume=1.0,

		-- try call fn.ra_bind()
		bind_when_setup = true
	},

	config = function (main, opts)

		-- load audio api(M.fn.*)
		local fn_ok, M = pcall(require,'nvim-audio')
		if not fn_ok or not M.fn then
			vim.notify("FAILED: require nvim-audio")
			return
		end

		M.setup(opts)

		--register wav(requires: 44100sample, 2channel, pixels-fmt: SDL_AUDIO_F32(float))
		M.fn.load_wav("__tick", main.dir .. '/wav/tick.wav')

		M.fn.load_wav("command", vim.fn.stdpath('config') .. '/wav/command.wav')
		M.fn.load_wav("dd", vim.fn.stdpath('config') .. '/wav/dd.wav')

		M.fn.load_wav("mikumikumi", vim.fn.stdpath('config') .. '/wav/mikumikumi.wav')
		M.fn.load_wav("miku-no", vim.fn.stdpath('config') .. '/wav/miku-no.wav')

		M.fn.load_wav("jj", vim.fn.stdpath('config') .. '/wav/jj.wav')

		M.fn.load_wav("dadada", vim.fn.stdpath('config') .. '/wav/dadada.wav')
		M.fn.load_wav("lalala", vim.fn.stdpath('config') .. '/wav/lalala.wav')

		M.fn.load_wav("focus", vim.fn.stdpath('config') .. '/wav/focus.wav')
		M.fn.load_wav("lookhere", vim.fn.stdpath('config') .. '/wav/lookhere.wav')

		M.fn.load_wav("givelight", vim.fn.stdpath('config') .. '/wav/givelight.wav')
		M.fn.load_wav("magic-start", vim.fn.stdpath('config') .. '/wav/magic-start.wav')

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
		audio_template("TextYankPost","mikumikumi")

		audio_template("FileChangedShell","miku-no")
		audio_template("SwapExists","miku-no")

		audio_template("InsertEnter","dadada")
		audio_template("InsertLeave","lalala")

		audio_template("CmdlineEnter","command")
		audio_template("CmdlineLeave","dd")

		audio_template("RecordingEnter","givelight")
		audio_template("RecordingLeave","magic-start")

		audio_template("FocusGained","focus")

		audio_template("BufDelete","lookhere")

		audio_template("BufWritePost","world")

		audio_template("CompleteDone","jj")


		--nvim-cmp for confirm_done event
		local ok_cmp, cmp = pcall(require,'cmp')
		if ok_cmp and cmp then
			cmp.event:on('confirm_done', function()
				local res = vim.g.audio_play_ticks_resources
				if res and res > 0 then
					vim.g.audio_play_ticks_resources= res - 1

					local ok, what = M.fn.ra_play("jj")
					if not ok then
						vim.notify(string.format("status:%d, what:%s",ok,what))
					end
				end
			end)
		end

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

