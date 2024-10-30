return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true }, -- optional icons support
  lazy = false, -- load during startup
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",  -- Automatically picks a theme based on your colorscheme
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

