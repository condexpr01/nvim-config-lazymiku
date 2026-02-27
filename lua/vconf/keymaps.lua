---@diagnostic disable: undefined-global
--显示当前的键位
--:map
--vim.cmd("map")


-- #warning#: no exception handling, handle when require

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


-- `cpp` hates this
-- `vim.keymap.set('i', '<', '<><Left>', { noremap = true })`

-- % jump
vim.opt.matchpairs:append({
	-- english pairs
	"(:)",
	"{:}",
	"[:]",
	"<:>",

	-- 中文pairs
	"‘:’",
	"“:”",
	"（:）",
	"【:】",
	"《:》",

	--  others
	"「:」",
	"『:』",
	"〈:〉",

	--  add more if needed


	-- synxtax pairs and same char pairs
	-- use vim-matchup plugin to support these
	-- as different char can be matchpairs
	-- the fllowing pairs are not supported by default
	"':'",
	'":"',
})





