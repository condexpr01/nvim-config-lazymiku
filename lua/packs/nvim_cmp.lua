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
			require('luasnip').lsp_expand(args.body)
			-- vim.snippet.expand(args.body)
		end,
	},

	--补全和文档加边
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	--键位,无选tab space流
	mapping = cmp.mapping.preset.insert({

		--选中时确定或打开,不自动选第一个,不选则原样
		['<Space>'] = cmp.mapping(
			function(fallback)
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

		-- Tab：snippet 向后跳转
		-- `visible`优先于`jumpable`
		["<Tab>"] = cmp.mapping(function(fallback)
			local luasnip = require("luasnip")

			if cmp.visible() then
				cmp.select_next_item({behavior=cmp.SelectBehavior.Select})
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i","c", "s" }),

		-- Shift-Tab：snippet 向前跳转
		-- `visible`优先于`jumpable`
		["<S-Tab>"] = cmp.mapping(function(fallback)
			local luasnip = require("luasnip")

			if cmp.visible() then
				cmp.select_prev_item({behavior=cmp.SelectBehavior.Select})
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i","c","s" }),

		-- `luasnip` choice node up
		["<C-j>"] = cmp.mapping(function(fallback)
			local luasnip = require("luasnip")

			if luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { "i","c", "s" }),

		-- `luasnip` choice node down
		["<C-k>"] = cmp.mapping(function(fallback)
			local luasnip = require("luasnip")

			if luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { "i","c", "s" }),

		--文档翻滚
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),

		--补全打开
		['<C-space>'] = cmp.mapping.complete(),

		--关闭
		['<C-e>'] = cmp.mapping.abort(),
	}),

	--源,`vim.cmd("CmpStatus")`查看
	sources = cmp.config.sources(
	{

		{ name = 'luasnip',priority=39  },
		{ name = 'nvim_lsp',priority=13 },
		{ name = 'nvim_lsp_signature_help',priority=11 },
		{ name = 'buffer',priority=3 },

		--for project
		{ name = 'tags',priority=1 ,
		option={
			complete_defer=100,
			max_iterms=10,
			keyword_length=1,
			exact_match=false,
			current_buffer_only=false
		}},

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
			})[entry.source.name]
			return vim_item
		end,
	},


}
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',

		-- snippet sources
		{
			'L3MON4D3/LuaSnip',
			version = "*",
			build = "make install_jsregexp"
		},

		'saadparwaiz1/cmp_luasnip',

		--tags sources
		'quangnguyen30192/cmp-nvim-tags',


	},


	config = function ()
		local cmp = require("cmp")

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

		vim.lsp.config('*',
		{capabilities = require('cmp_nvim_lsp').default_capabilities()})
	end,

	--事件懒加载
	event = "VeryLazy",
}








