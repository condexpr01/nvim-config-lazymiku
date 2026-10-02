---@diagnostic disable: undefined-global

local function opts(cmp)

	return {
		--experimental = {ghost_text = true}

		--性能
		performance = {
			max_view_entries = nil, -- 不限制可见条目
			debounce = nil,         -- 输入后触发
			throttle = 50,          -- 限制高频触发
		},

		--代码模板,`lsp`展开snippet的文本内容,占位符解析
		snippet = {
			expand = function(args)
				local ok_luasnip, luasnip = pcall(require,"luasnip")
				if ok_luasnip and luasnip then
					require('luasnip').lsp_expand(args.body)
				else
					vim.notify("FAILED: require luasnip")
				end

				-- vim.snippet.expand(args.body)
			end,
		},

		--补全和文档加边
		window = {
			completion = cmp.config.window.bordered({
				max_height = 13,
			}),
			documentation = cmp.config.window.bordered(),
		},

		--键位,无选tab space流
		mapping = cmp.mapping.preset.insert({

			--选中时确定或打开,不自动选第一个,不选则原样
			['<Space>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if cmp.get_selected_entry() then
						cmp.confirm({select = false})
					else
						fallback()
					end
				else
					fallback()
				end
			end,{'i','c','s'}),

			--补全打开
			['<C-space>'] = cmp.mapping.complete(),

			--关闭
			['<C-e>'] = cmp.mapping.abort(),

			-- Tab：向下一个跳转
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({behavior=cmp.SelectBehavior.Select})
				else
					fallback()
				end
			end, { "i","c", "s" }),

			-- Shift-Tab：向上一个跳转
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({behavior=cmp.SelectBehavior.Select})
				else
					fallback()
				end
			end, { "i","c","s" }),

			["<C-n>"] = cmp.mapping(function(fallback)
				local ok_luasnip, luasnip = pcall(require,"luasnip")
				if ok_luasnip and luasnip then

					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end

				else
					vim.notify("FAILED: require luasnip")
				end

			end, { "i","c", "s" }),

			["<C-p>"] = cmp.mapping(function(fallback)
				local ok_luasnip, luasnip = pcall(require,"luasnip")
				if ok_luasnip and luasnip then

					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end

				else
					vim.notify("FAILED: require luasnip")
				end
			end, { "i","c", "s" }),

			--文档翻滚
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),

		}),

		--源,`vim.cmd("CmpStatus")`查看
		sources = cmp.config.sources(
			{

				{ name = 'luasnip',priority=13  },

				{ name = 'nvim_lsp_signature_help',priority=24 },

				{ name = 'nvim_lsp',priority=23 },

				{--for large project
					name = 'tags',priority=22 ,
					option={
						complete_defer=100,
						max_iterms=10,
						keyword_length=1,
						exact_match=false,
						current_buffer_only=false
					}
				},

				{ name = 'buffer',priority= 18 },

				{ name = 'copilot',priority=16 },
			},
			{
				--for script
				{ name = 'path' },
			}),

			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip  = "[LUASNIP]",
						buffer   = "[BUFFER]",
						path     = "[PATH]",
						cmdline  = "[CMDLINE]",
						tags     = "[TAGS]",
						copilot  = "[COPILOT]",
					})[entry.source.name]
					return vim_item
				end,
			},

	}
end

return {
	"hrsh7th/nvim-cmp",

	enabled = function ()
		if vim.g.cmp_engine ~= "nvim-cmp" then
			return false
		else
			return true
		end
	end,

	dependencies = {
		'neovim/nvim-lspconfig',
		"mason-org/mason-lspconfig.nvim",

		'hrsh7th/cmp-nvim-lsp-signature-help',

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',

		--tags sources
		'quangnguyen30192/cmp-nvim-tags',

		-- snippet sources
		{
			'L3MON4D3/LuaSnip',
			version = "*",
			build = "make install_jsregexp"
		},

		'saadparwaiz1/cmp_luasnip',

		--copilot-cmp
		{
			"zbirenbaum/copilot-cmp",
			config = function ()
				local ok, copilot_cmp = pcall(require,"copilot_cmp")
				if ok and copilot_cmp then
					copilot_cmp.setup()
				else
					vim.notify("FAILED: require copilot_cmp")
				end
			end
		}

	},


	config = function ()
		local ok,cmp = pcall(require,"cmp")
		if not ok or not cmp then
			vim.notify("FAILED: require cmp")
			return
		end

		cmp.setup(opts(cmp))

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {{ name = 'buffer' }}
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
				{{ name = 'path' }},
				{{ name = 'cmdline' }}
			),
		})

		-- Sets the default configuration for an LSP client
		local ok_lsp, cmp_nvim_lsp = pcall(require,"cmp_nvim_lsp")
		if ok_lsp and cmp_nvim_lsp then
			vim.lsp.config('*', {capabilities = require('cmp_nvim_lsp').default_capabilities()})
		else
			vim.notify("FAILED: require cmp_nvim_lsp")
		end

	end,

	--事件懒加载
	event = "VeryLazy",
}
