return { 
  {
   'ThePrimeagen/vim-be-good'
  },
  -- {
  --   "turbio/bracey.vim",
  --   build = "npm install --prefix server"
  -- },

  --Test
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },

  {
    "turbio/bracey.vim",
    cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
    build = "npm install --prefix server",
  },

  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },

  --Search and Replace
  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  {
    "mrjones2014/nvim-ts-rainbow",
  },

  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, 
        throttle = true,
        max_lines = 0,
        patterns = { 
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },

  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },

}
