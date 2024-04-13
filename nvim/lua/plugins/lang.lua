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
    config = function()
      require('tailwind-sorter').setup({
        on_save_enabled = false,
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' },
        node_path = 'node',
      })
    end
  },
  --Note Taking with Neorg
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup {
  --       load = {
  --         ["core.defaults"] = {},
  --         ["core.concealer"] = {},
  --         ["core.dirman"] = {
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --             default_workspace = "notes",
  --           },
  --         },
  --       },
  --     }
  --   end
  -- },
  -- {
  --   "vhyrro/luarocks.nvim", 
  --   priority = 1000,
  --   config = true,
  -- },
  -- {
  --   "nvim-neorg/neorg",
  --   dependencies = {
  --     "luarocks.nvim",
  --   },
  --   lazy = false,
  --   version = "*",
  --   config = true,
  -- },
}
