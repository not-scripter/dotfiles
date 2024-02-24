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
          a = { fg = colors.fg, bg = colors.red },
          b = { fg = colors.fg, bg = colors.red },
          c = { fg = colors.fg, bg = colors.red },
          x = { fg = colors.fg, bg = colors.red },
          y = { fg = colors.fg, bg = colors.red },
          z = { fg = colors.fg, bg = colors.red },
        },

        insert = {
          a = { fg = colors.bg, bg = colors.blue }, 
          b = { fg = colors.bg, bg = colors.blue }, 
          c = { fg = colors.bg, bg = colors.blue }, 
          x = { fg = colors.bg, bg = colors.blue }, 
          y = { fg = colors.bg, bg = colors.blue }, 
          z = { fg = colors.bg, bg = colors.blue }, 
        },
        visual = {
          a = { fg = colors.bg, bg = colors.green },
          b = { fg = colors.bg, bg = colors.green },
          c = { fg = colors.bg, bg = colors.green },
          x = { fg = colors.bg, bg = colors.green }, 
          y = { fg = colors.bg, bg = colors.green },
          z = { fg = colors.bg, bg = colors.green },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.cyan },
          b = { fg = colors.bg, bg = colors.cyan },
          c = { fg = colors.bg, bg = colors.cyan },
          x = { fg = colors.bg, bg = colors.cyan },
          y = { fg = colors.bg, bg = colors.cyan },
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

    local function file_icon()
      return [[󰈮]]
    end
    local function line_icon()
      return [[󰦨]]
    end

      require('lualine').setup {
        options = {
          -- theme = "catppuccin",
          theme = custom,
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            -- {'branch', icon = {'', align='right', color={fg='green'}}},
            -- { file_icon, separator = { left = '' }, right_padding = 2 },
            { file_icon },
          },
          lualine_b = {
            { 'filename' },
            { 'filesize' },
          },
          lualine_c = {
            { 'diagnostics' },
            { 'hostname' },
          },
          lualine_x = {
            { 'diff' },
            { 'branch' },
          },
          lualine_y = {
            { 'selectioncount' },
            { 'progress' },
            { 'location' },
          },
          lualine_z = {
            { line_icon, },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {
          lualine_a = {'buffers'},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
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
