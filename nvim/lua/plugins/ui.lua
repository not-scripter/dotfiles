return {
 {
   'glepnir/dashboard-nvim',
   event = 'VimEnter',
   dependencies = {{'nvim-tree/nvim-web-devicons'}},

    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = {
            " 🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧",
            " 🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧",
            " 🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧",
            " ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜",
            " ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🔵⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜",
            " ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜",
            " 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩",
            " 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩",
            " 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩",
            "                                                       ",
            "Ｖａｓｕｄｈａｉｖａ Ｋｕｔｕｍｂａｋａｍ",
            "                                                       ",
          },
          -- week_header = {
          --  enable = false,
          -- },
          shortcut = {
            {
              desc = '󰊳 Update',
              group = '@property',
              action = 'Lazy update',
              key = 'u'
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
          footer = {}
        },
      }
    end
  },
  --Greatest UI plugin for performance
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    lazy = true,
  init = function()
    vim.ui.select = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
    vim.ui.input = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = "NotifyBackground",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 100,
      render = "compact",
      stages = "no_animation",
      timeout = 2000,
      top_down = false,
    },
  },
  {
    "RRethy/vim-illuminate",
  },
  --FileManager
  { 
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    -- vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus<CR>', {})
  },
  --Indenting
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      }
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', opt = true
    },
    config = function()
      local colors = {
        bg    = '#000000',
        fg    = '#CDD6F4',
        blue     = '#89B4FA',
        cyan     = '#94E2D5',
        green    = '#A6E3A1',
        yellow   = '#F9E2AF',
        magenta  = '#F5C2E7',
        red      = '#F38BA8',
      }
      local custom = {
        normal = {
          a = { fg = colors.bg, bg = colors.red}, -- gui = 'bold'
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
          x = { fg = colors.fg, bg = colors.bg },
          y = { fg = colors.fg, bg = colors.bg },
          z = { fg = colors.bg, bg = colors.red },
        },

        insert = {
          a = { fg = colors.bg, bg = colors.blue }, 
          z = { fg = colors.bg, bg = colors.blue }, 
        },
        visual = {
          a = { fg = colors.bg, bg = colors.green },
          z = { fg = colors.bg, bg = colors.green },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.cyan },
          z = { fg = colors.bg, bg = colors.cyan },
        },

        inactive = {
          a = { fg = colors.fg, bg = colors.bg },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
          x = { fg = colors.fg, bg = colors.bg },
          y = { fg = colors.fg, bg = colors.bg },
          z = { fg = colors.fg, bg = colors.bg },
        },
      }
      require('lualine').setup {
        options = {
          -- theme = "catppuccin", --           
          theme = custom,
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = {
            { 'hostname', icon = {"󰙄", align="left",}, separator = { left = '  ', right = '' }, },
          },
          lualine_b = {
            { 'branch', icon = {"󰊢", align="left",}},
          },
          lualine_c = {
            { 'filesize', icon = {"󰈔", align="left",}},
            { 'diagnostics', separator = { left = '', right = '  ' }, },
          },
          lualine_x = {
            { 'diff' },
          },
          lualine_y = {
            { 'selectioncount' },
            { 'progress' },
          },
          lualine_z = {
            { 'location', icon = {"󰦨", align="right",}, separator = { left = '  ', right = '  ' }, },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            { 'buffers', separator = { left = '  ', right = '' },},
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            { 'tabs', separator = { left = '', right = '  ' },},
          }
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { "lazy", "mason", "fzf", "oil", "neo-tree", "trouble", },
      }
    end
  },
}
