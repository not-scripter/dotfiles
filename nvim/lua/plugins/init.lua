return {
  --Codeium Ai
  -- {
  --   "Exafunction/codeium.vim",
  --   event = 'BufEnter',
  --   -- config = function ()
  --   --     vim.g.codeium_disable_bindings = 1
  --   --   vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
  --   --   vim.keymap.set('i', '<C-CR>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  --   --   vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --   --   vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --   --   vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --   -- end
  -- },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  {
    "numToStr/FTerm.nvim",
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local keymap = vim.api.nvim_set_keymap
      local default_opts = { noremap = true, silent = true }
      keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", default_opts)
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    'ThePrimeagen/vim-be-good'
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
  },
  {
    "aurum77/live-server.nvim",
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },

}
