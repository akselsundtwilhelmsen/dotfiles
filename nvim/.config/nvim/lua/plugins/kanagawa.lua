return {
  "rebelot/kanagawa.nvim",
  lazy = false, -- load during startup
  priority = 1000, -- ensure it loads first
  config = function()
    vim.cmd([[colorscheme kanagawa]])
  end,
}
