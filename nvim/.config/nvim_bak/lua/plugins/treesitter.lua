return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- Automatically update the parsers when installing/updating
    event = { "BufReadPost", "BufNewFile" },  -- Lazy load for performance
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = "all",  -- Automatically install all maintained languages
        highlight = {
          enable = true, -- Enables syntax highlighting
        },
        indent = {
          enable = true, -- Enables smart indentation
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end
  }
