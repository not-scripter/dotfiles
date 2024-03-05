return {
  --Tailwind
  {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          tailwindcss = {},
        },
      },
    },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {
        user_default_options = {
          tailwind = true,
        },
      },
    },
  },
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm i && npm run build',
    config = true,
    -- opts = {
    --   on_save_enabled = true,
    -- }
  },
}
