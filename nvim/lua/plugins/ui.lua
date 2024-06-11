return {
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('dashboard').setup({
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
      })
    end,
  },

  --NOTE: Greatest UI plugin for performance
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-treesitter/nvim-treesitter",
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
        lsp_doc_border = false,
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
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
    config = function()
      local colors = {
        bg      = '#000000',
        fg      = '#CDD6F4',
        blue    = '#89B4FA',
        cyan    = '#94E2D5',
        green   = '#A6E3A1',
        yellow  = '#F9E2AF',
        magenta = '#F5C2E7',
        red     = '#F38BA8',
      }
      local custom = {
        normal = {
          a = { fg = colors.bg, bg = colors.red }, -- gui = 'bold'
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
      require('lualine').setup({
        --NOTE: Uniqe separators           
        options = {
          -- theme = "catppuccin",
          -- theme = custom,
          theme = "auto",
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = {
            { 'hostname', icon = { "󰙄", align = "left", }, separator = { left = '  ', right = '' }, },
          },
          lualine_b = {
            { 'branch', icon = { "󰊢", align = "left", } },
          },
          lualine_c = {
            -- {require('auto-session.lib').current_session_name},
            { 'filesize', icon = { "󰈔", align = "left", } },
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
            { 'location', icon = { "󰦨", align = "right", }, separator = { left = '  ', right = '  ' }, },
          },
        },
        tabline = {
          lualine_a = {
            {
              'buffers',
              separator = { left = '  ', right = '' },
              symbols = {
                modified = ' ●',
                alternate_file = '',
                directory = '',
              },
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              'tabs',
              separator = { left = '', right = '  ' },
              symbols = {
                modified = ' ●',
                alternate_file = '',
                directory = '',
              },
            },
          }
        },
        winbar = {
          lualine_a = {},
          lualine_b = {
            {
              "navic",
              -- color_correction = nil,
              -- navic_opts = nil,
              separator = { left = "", right = "" },
              padding = { left = 4 },
            }
          },
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
        extensions = {
          "lazy",
          "mason",
          "fzf",
          "oil",
          "neo-tree",
          "trouble",
        },
      })
    end
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        hide_cursor = true,
        stop_eof = true,
        use_local_scrolloff = false,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = nil,
        pre_hook = nil,
        post_hook = nil,
      })

      local t    = {}
      t['<C-k>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
      t['<C-j>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
      t['<C-h>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
      t['<C-l>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
      t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
      t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
      t['zt']    = { 'zt', { '250' } }
      t['zz']    = { 'zz', { '250' } }
      t['zb']    = { 'zb', { '250' } }
      require('neoscroll.config').set_mappings(t)
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    'gen740/SmoothCursor.nvim',
    opts = {
      type = "default",
      cursor = "",
      texthl = "@text.environment",
    }
  },

  --NOTE: Dim Inactive Code
  {
    "folke/twilight.nvim",
    opts = {}
  },

  --NOTE: winbar
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {}
  -- },

  --NOTE: ScrollBar
  {
    'Xuyuanp/scrollbar.nvim',
    config = function()
      vim.api.nvim_create_augroup("ScrollbarInit", { clear = true })
      vim.api.nvim_create_autocmd({
        "WinScrolled",
        "VimResized",
        "QuitPre",
        "WinEnter",
        "FocusGained"
      }, {
        pattern = "*",
        callback = function()
          require("scrollbar").show()
        end,
      })
      vim.api.nvim_create_autocmd({
        "WinLeave",
        "BufLeave",
        "BufWinLeave",
        "FocusLost",
      }, {
        pattern = "*",
        callback = function()
          require("scrollbar").clear()
        end,
      })
    end
  },

  --NOTE: Smart Splits
  -- {
  --   'mrjones2014/smart-splits.nvim'
  -- },

  --TEST:
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      local mapping = ccc.mapping
      ccc.setup({
        highlighter = {
          auto_enable = true,
        },
        mappings = {
          -- h = mapping.decrease5(),
          -- l = mapping.increase5(),
        },
      })
    end
  },

  --NOTE: LightBulb
  {
    'kosayoda/nvim-lightbulb',
    opts = {
      sign = {
        enabled = false,
        hl = "LightBulbSign",
      },
      virtual_text = {
        enabled = true,
      },
    }
  },
  -- --NOTE: Movement suggestions
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },

  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local navic = require("nvim-navic")
      navic.setup({
        icons = {
          File          = "󰈙 ",
          Module        = " ",
          Namespace     = "󰌗 ",
          Package       = " ",
          Class         = "󰌗 ",
          Method        = "󰆧 ",
          Property      = " ",
          Field         = " ",
          Constructor   = " ",
          Enum          = "󰕘 ",
          Interface     = "󰕘 ",
          Function      = "󰊕 ",
          Variable      = "󰆧 ",
          Constant      = "󰏿 ",
          String        = "󰀬 ",
          Number        = "󰎠 ",
          Boolean       = "◩ ",
          Array         = "󰅪 ",
          Object        = "󰅩 ",
          Key           = "󰌋 ",
          Null          = "󰟢 ",
          EnumMember    = " ",
          Struct        = "󰌗 ",
          Event         = " ",
          Operator      = "󰆕 ",
          TypeParameter = "󰊄 ",
        },
        lsp = {
          auto_attach = true,
          preference = nil,
        },
        highlight = true,
        separator = "  ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        safe_output = true,
        lazy_update_context = false,
        click = true,
        format_text = function(text)
          return text
        end,
      })
    end
  },
  {
    "SmiteshP/nvim-navbuddy",
    enabled = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } },
  },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      extra_groups = {},
      exclude_groups = {},
    }
  },

  --NOTE: Rainbow Delimiters
  {
    "HiPhish/rainbow-delimiters.nvim"
  },

}
