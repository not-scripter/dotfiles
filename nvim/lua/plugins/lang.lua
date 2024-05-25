return {
  --HTML 
  {
    'mattn/emmet-vim',
    enabled = false
  },

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
  -- {
  --   'laytan/tailwind-sorter.nvim',
  --   dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
  --   build = 'cd formatter && npm i && npm run build',
  --   config = function()
  --     require('tailwind-sorter').setup({
  --       on_save_enabled = false,
  --       on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' },
  --       node_path = 'node',
  --     })
  --   end
  -- },
  {
    'razak17/tailwind-fold.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
    opts= {},
  },
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = {
  --     document_color = {
  --       enabled = true,
  --     }
  --   }
  -- },

  -- Javascript / Typescript
  -- {
  --   "windwp/nvim-ts-autotag",
  --   config = function()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },

  --Note Taking with Neorg
  {
    "nvim-neorg/neorg",
    enabled = false,
    lazy = false,
    version = "*",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }
  },

  -- Note Taking with Obsidian
  {
    "epwalsh/obsidian.nvim",
    enabled = false,
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/notes",
        },
        {
          name = "work",
          path = "~/notes/work",
        },
      }
    }
  },

  --Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "b0o/schemastore.nvim",
  },

}
