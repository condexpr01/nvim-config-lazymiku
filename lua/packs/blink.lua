---@diagnostic disable: undefined-global

--键位,无选tab space流
local keymap={
	-- 'none' disable the 'default' preset
	preset = 'none',

	--space做accpet，不然就fallback
	['<Space>']   = { 'accept', 'fallback' },

	--前后选择
	['<Tab>']     = { 'select_next', 'fallback' },
	['<S-Tab>']   = { 'select_prev', 'fallback' },

	--显示关闭
	['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
	['<C-e>']     = { 'hide', 'fallback' },

	--snippets前后
	['<C-n>']     = { 'snippet_forward', 'fallback' },
	['<C-p>']     = { 'snippet_backward', 'fallback' },

	--文档滚动
	['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
	['<C-f>']     = { 'scroll_documentation_down', 'fallback' },

	--函数签名
	['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
}

local completion = {
	--只参考prefix, 不用full
	keyword={range="prefix"},

	--触发字符
	trigger ={
		show_on_trigger_character = true,
		show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
	},

	--不自动选，不自动插入
	list ={selection={preselect=false , auto_insert=false},},

	--自动花括号
	accept={auto_brackets={enabled=true},},


	documentation = {
		window = { border = 'single' },
		auto_show=true,
		auto_show_delay_ms=0
	},

	menu={
		auto_show=true,
		auto_show_delay_ms=0,
		draw = {
			columns = {
				{ "label", "label_description", gap = 1 },
				{ "kind_icon", "kind", "source_name" }
			},
		}
	},

	ghost_text={enabled=true},
}

local cmdline_completion = {

	--不自动选，不自动插入
	list ={selection={preselect=false , auto_insert=false},},

	menu={
		auto_show=true,
		draw = {
			columns = {
				{ "label", "label_description", gap = 1 },
				{ "kind_icon", "kind", "source_name" }
			},
		}
	},

	ghost_text={enabled=true},
}


local function opts()

	return {
		appearance = {nerd_font_variant = 'Nerd Font'},
		snippets={preset = 'luasnip'},

		keymap = keymap,
		completion=completion,

		-- 高性能模糊查找优先
		fuzzy = { implementation = "prefer_rust_with_warning" },

		--启用签名
		signature ={enabled=true},

		sources = {
			default = { 'lsp','path','snippets','buffer','tags','copilot' },
			providers = {
				lsp = {
					name = 'LSP',
					module = 'blink.cmp.sources.lsp',
					opts = {},
					enabled = true,
					async = false,
					timeout_ms = 2000,
					transform_items = nil,
					should_show_items = true,
					max_items = nil,
					min_keyword_length = 0,
					fallbacks = {},
					score_offset = 0,
					override = nil,
				},

				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},

				tags = {
					name = "tags",
					module = "blink.compat.source",
				},

			},
		},

		cmdline = {
			enabled=true,
			keymap = keymap,
			completion = cmdline_completion,
			sources = {'cmdline','path','buffer'}
		},

	}
end



return {
	enabled=true,
	event="VeryLazy",

	'saghen/blink.cmp',

	version = '1.*',

	build = 'CARGO_FEATURE_PURE=1 cargo build --release',
	--build = 'cargo build --release',
	--build = 'nix run .#build-plugin',

	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"L3MON4D3/LuaSnip",
		"giuxtaposition/blink-cmp-copilot",

        "saghen/blink.compat",
        "quangnguyen30192/cmp-nvim-tags",
	},

	opts = opts(),

	opts_extend = { "sources.default" }
}



