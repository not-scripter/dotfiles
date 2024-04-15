return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        cmp = true,
        ufo = true,
        gitsigns = true,
        neotree = true,
        noice = true,
        treesitter = true,
        notify = true,
        dashboard = true,
        flash = true,
        harpoon = true,
        lsp_trouble = true,
        which_key = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
    -- config = function()
    -- vim.cmd.colorscheme "catppuccin"
    -- end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    -- config = function()
    --   vim.cmd.colorscheme "tokyonight"
    -- end
  },

  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    -- config = function(plugin)
    --   vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    --   vim.cmd.colorscheme "aura-dark"
    -- end
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme "nightfox"
    -- end
  },
}
