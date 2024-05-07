return { 
  {
   'ThePrimeagen/vim-be-good'
  },

  --TEST:
  {
    "romgrk/nvim-treesitter-context",
    enabled = false,
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

  --TEST: replacing null-ls
  -- {
  --   'mfussenegger/nvim-lint',
  --   enabled = false,
  --   config = function()
  --     local lint = require("lint")
  --     lint.linters_by_ft = {
  --       markdown = {'vale',},
  --       -- javascript = {"eslint"}
  --     }
  --
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --       callback = function()
  --         lint.try_lint()
  --         lint.try_lint("cspell")
  --       end,
  --     })
  --   end
  -- },

  --TEST: Floating win bar
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
      local helpers = require 'incline.helpers'
      local navic = require 'nvim-navic'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            guibg = '#44406e',
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { ' > ', group = 'NavicSeparator' },
                { item.icon, group = 'NavicIcons' .. item.type },
                { item.name, group = 'NavicText' },
              })
            end
          end
          table.insert(res, ' ')
          return res
        end,
      }
    end,
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      local navic = require("nvim-navic")
      navic.setup({
        lsp = {
          auto_attach = true,
        },
      })
      -- require("lspconfig").clangd.setup({
      --   on_attach = function(client, bufnr)
      --     navic.attach(client, bufnr)
      --   end
      -- })
    end
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } },
  },

  --TEST: music player 
  --TEST: color picker

}
