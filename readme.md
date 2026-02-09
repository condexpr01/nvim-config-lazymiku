# Install

```shell
makepkg -si
nvim-config-lazymiku-install <target-dir>
```

# Index
[fonts options.lua](#optionslua)

[keybindings lazy.lua](#lazylua)
[keybindings keymaps.lua](#keymapslua)
[keybindings bufferline.lua](#bufferlinelua)
[keybindings copilot.lua](#copilotlua)
[keybindings blink_cmp.lua](#blink_cmplua)
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

| 按键 | 功能 |
|------|------|
| `;`  | 主键 |

```lua
-- 不超时主键
vim.g.mapleader = ';'
vim.opt.timeout=false
```


## keymaps.lua

| 按键 | 功能 |
|------|------|
| `tj` | tag定义,跳转进入 |
| `tk` | tag定义,跳转返回 |
| `;w` | 快速保存文件 |
| `;W` | 快速强制保存 |
| `;c` | 快速关闭窗口 |
| `;q` | 快速退出 |
| `;Q` | 快速强制退出 |
| `;h` | 快速移动到左窗口 |
| `;l` | 快速移动到右窗口 |
| `;k` | 快速移动到上窗口 |
| `;j` | 快速移动到下窗口 |
| `;H` | 将窗口移动到左侧 |
| `;J` | 将窗口移动到底部 |
| `;K` | 将窗口移动到顶部 |
| `;L` | 将窗口移动到右侧 |
| `;v` | 快速垂直分割窗口 |
| `;s` | 快速水平分割窗口 |
| `(` | 快速输入括号对 `()` |
| `{` | 快速输入大括号对 `{}` |
| `"` | 快速输入双引号对 `""` |
| `'` | 快速输入单引号对 `''` |
| `[` | 快速输入方括号对 `[]` |

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

| 按键 | 功能 |
|------|------|
| `;bh` | 向左切换buffer |
| `;bl` | 向右切换buffer |
| `;bp` | 菜单选择buffer |
| `;bco`| 关闭其他buffer |
| `;bd` | 删除当前buffer |
| `;bD` | 强制删除当前buffer |

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

| 按键 | 功能 |
|------|------|
| `;ze` | 显示Copilot面板 |
| `;zz` | 接受Copilot面板建议 |
| `;zj` | 跳转到下一条建议 |
| `;zk` | 跳转到上一条建议 |

```lua
keys = {
	--显示panel <leader>ze can refresh, don't need to map refresh
	{'<leader>ze','<cmd>Copilot panel<CR>',          'n', { noremap = true }},
	{'<leader>zz','<cmd>Copilot panel accept<CR>',   'n', { noremap = true }},

	{'<leader>zj','<cmd>Copilot panel jump_next<CR>','n', { noremap = true }},
	{'<leader>zk','<cmd>Copilot panel jump_prev<CR>','n', { noremap = true }},
},
```


## blink_cmp.lua

| 按键 | 功能 |
|------|------|
| `Space` | 确认选择补全项 |
| `Tab`   | 选择下一个补全项/向后跳转snippet |
| `S-Tab` | 选择上一个补全项/向前跳转snippet |
| `C-j` | luasnip choice节点向下选择 |
| `C-k` | luasnip choice节点向上选择 |
| `C-f` | 文档向下滚动 |
| `C-b` | 文档向上滚动 |
| `C-space` | 打开补全 |
| `C-e`     | 关闭补全 |
| `C-k`     | 签名signature|

```lua
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
```


## nvim_lspconfig.lua

| 按键 | 功能 |
|------|------|
| `gi` | 跳转到实现 |
| `ge` | 跳转到类型定义 |
| `K` | 显示悬停文档 |
| `C-k` | 显示签名帮助 |
| `;rn` | 重命名符号 |
| `;a`  | 代码行动 |
| `;do` | 显示当前行诊断 |
| `;dl` | 显示诊断列表 |
| `;dj` | 跳转到下一个诊断 |
| `;dk` | 跳转到上一个诊断 |

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

| 按键 | 功能 |
|------|------|
| `;e` | 切换NvimTree显示 |
| `;E` | 打开当前文件所在目录的NvimTree |

```lua
keys = {
	--显示切换
	{'<leader>e',':NvimTreeToggle<CR>',  'n', { noremap = true }},
	--切换到当前目录
	{'<leader>E',':NvimTreeOpen %:h<CR>','n', { noremap = true }}
},
```


## telescope.lua

| 按键 | 功能 |
|------|------|
| `;ff` | 查找文件 |
| `;fg` | 实时搜索 |
| `;fb` | 查找缓冲区 |
| `;fh` | 查找帮助标签 |

```lua
keys = {
	{'<leader>ff','<cmd>Telescope find_files<CR>', 'n', { noremap = true }},
	{'<leader>fg','<cmd>Telescope live_grep<CR>',  'n', { noremap = true }},
	{'<leader>fb','<cmd>Telescope buffers<CR>',    'n', { noremap = true }},
	{'<leader>fh','<cmd>Telescope help_tags<CR>',  'n', { noremap = true }},
},
```


## notice.lua

| 按键 | 功能 |
|------|------|
| `;n` | 查看新消息/刷新 |

```lua
--不好用，对于nvim上使用终端看不到什么输出
enable=false,

keys = {
	--查看新消息,或刷新
	{'<leader>n','<cmd>NoiceAll<CR>',  'n', { noremap = true }},
},
```




