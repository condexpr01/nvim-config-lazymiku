---@diagnostic disable: undefined-global
return {
  "andymass/vim-matchup",
  event = "VeryLazy",
  init = function()
    vim.g.matchup_matchparen_enabled = 0   -- 关闭高亮
    vim.g.matchup_motion_enabled = 1       -- 保留跳转
    vim.g.matchup_text_obj_enabled = 0     -- 关闭文本对象
    vim.g.matchup_surround_enabled = 0     -- 关闭环绕
  end,
}
