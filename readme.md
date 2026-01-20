
# Index
[fonts options.lua](#optionslua)

[keybindings lazy.lua](#lazylua)
[keybindings keymaps.lua](#keymapslua)
[keybindings bufferline.lua](#bufferlinelua)
[keybindings copilot.lua](#copilotlua)
[keybindings nvim_cmp.lua](#nvim_cmplua)
[keybindings nvim_lspconfig.lua](#nvim_lspconfiglua)
[keybindings nvim_tree.lua](#nvim_treelua)
[keybindings telescope.lua](#telescopelua)
[keybindings notice.lua](#noticelua)

# fonts

## options.lua

```lua
vim.opt.guifont = "Hack, Sarasa UI SC:h13"
```

# key bindings

## lazy.lua

```lua
-- 不超时主键
vim.g.mapleader = ';'
vim.opt.timeout=false
```

## keymaps.lua

```lua
-- 跳转到tag定义和返回
vim.keymap.set('n', 'tj', '<C-]>', { desc = 'Tag jump to'   })
vim.keymap.set('n', 'tk', '<C-t>', { desc = 'Tag jump back' })

-- 快速保存, 退出, 关闭窗口
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true })
vim.keymap.set('n', '<leader>W', '<cmd>w!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { noremap = true })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<CR>', { noremap = true })

-- 快速窗口间移动
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true })

-- 快速移动窗口
vim.keymap.set('n', '<leader>H', '<C-w>H', { noremap = true })
vim.keymap.set('n', '<leader>J', '<C-w>J', { noremap = true })
vim.keymap.set('n', '<leader>K', '<C-w>K', { noremap = true })
vim.keymap.set('n', '<leader>L', '<C-w>L', { noremap = true })

-- 快速分裂窗口
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>s', '<cmd>split<CR>',  { noremap = true })


-- `noremap=true`不递归
vim.keymap.set('i', '(', '()<Left>', { noremap = true })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true })
vim.keymap.set('i', '"', '""<Left>', { noremap = true })
vim.keymap.set('i', "'", "''<Left>", { noremap = true })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true })
```

## bufferline.lua

```lua
keys = {
	--左右buffer移动
	{"<leader>bh","<cmd>BufferLineCyclePrev<CR>",mode='n',silent=false},
	{"<leader>bl","<cmd>BufferLineCycleNext<CR>",mode='n',silent=false},

	--buffer选择
	{"<leader>bp","<cmd>BufferLinePick<CR>"     ,mode='n',silent=false},

	--buffer关闭其它
	{"<leader>bco","<cmd>BufferLineCloseOthers<CR>",mode='n',silent=false},

	--buffer删除
	{"<leader>bd","<cmd>bdelete<CR>" ,mode='n',silent=false},
	{"<leader>bD","<cmd>bdelete!<CR>",mode='n',silent=false},
},
```

## copilot.lua

```lua
keys = {
	--显示panel <leader>ze can refresh, don't need to map refresh
	{'<leader>ze','<cmd>Copilot panel<CR>',          'n', { noremap = true }},
	{'<leader>zz','<cmd>Copilot panel accept<CR>',   'n', { noremap = true }},

	{'<leader>zj','<cmd>Copilot panel jump_next<CR>','n', { noremap = true }},
	{'<leader>zk','<cmd>Copilot panel jump_prev<CR>','n', { noremap = true }},
},
```

## nvim_cmp.lua

```lua
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

```

## nvim_lspconfig.lua

```lua
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
```

## nvim_tree.lua

```lua
keys = {
	--显示切换
	{'<leader>e',':NvimTreeToggle<CR>',  'n', { noremap = true }},
	--切换到当前目录
	{'<leader>E',':NvimTreeOpen %:h<CR>','n', { noremap = true }}
},
```

## telescope.lua

```lua
keys = {
	{'<leader>ff','<cmd>Telescope find_files<CR>', 'n', { noremap = true }},
	{'<leader>fg','<cmd>Telescope live_grep<CR>',  'n', { noremap = true }},
	{'<leader>fb','<cmd>Telescope buffers<CR>',    'n', { noremap = true }},
	{'<leader>fh','<cmd>Telescope help_tags<CR>',  'n', { noremap = true }},
},
```

## notice.lua

```lua
--不好用，对于nvim上使用终端看不到什么输出
enable=false,

keys = {
	--查看新消息,或刷新
	{'<leader>n','<cmd>NoiceAll<CR>',  'n', { noremap = true }},
},
```





