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
        black    = '#000000',
        white    = '#9399b2',
        blue     = '#89b4fa',
        cyan     = '#89dceb',
        darkblue = '#b4befe',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#cba6f7',
        magenta  = '#f5c2e7',
        red      = '#f38ba8',
      }
      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.black, bg = colors.black },
          x = { fg = colors.white, bg = colors.black },
          y = { fg = colors.white, bg = colors.black },
          z = { fg = colors.black, bg = colors.violet },
        },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
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
        theme = "catppuccin", --tokyonight, catppuccin
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          -- {'branch', icon = {'', align='right', color={fg='green'}}}
          { file_icon, separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          { 'filename', separator = { left = '' }, right_padding = 2 },
          { 'filesize', separator = { left = '' }, right_padding = 2 },
        },
        lualine_c = {
          { 'diagnostics', separator = { left = '' }, right_padding = 2 },
          { 'hostname', separator = { left = '' }, right_padding = 2 },
        },
        lualine_x = {
          { 'diff', separator = { left = '' }, right_padding = 2 },
          { 'branch', separator = { left = '' }, right_padding = 2 },
        },
        lualine_y = {
          { 'selectioncount', separator = { left = '' }, right_padding = 2 },
          { 'progress', separator = { left = '' }, right_padding = 0 },
          { 'location', separator = { left = '' }, right_padding = 0 },
        },
        lualine_z = {
          { line_icon, separator = { left = '' }, right_padding = 2 },
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
      tabline = {},
      extensions = {},
    }

    end
  },
  {
    -- 'akinsho/bufferline.nvim',
    -- version = "*",
    -- dependencies = 'nvim-tree/nvim-web-devicons',
    -- config = function()
    --   local buff = require('bufferline')
    --   buff.setup({
    --     options = {
    --       style_preset = {
    --         buff.style_preset.no_italic,
    --         -- buff.style_preset.no_bold
    --       },
    --       hover = {
    --         enabled = true,
    --         delay = 200,
    --         reveal = {'close'}
    --       },
    --       -- groups = {
    --       --  items = {
    --       --   require('bufferline.groups').builtin.pinned:with({ icon = "" })
    --       --  }
    --       -- },
    --     }  
    --   })
    --   diagnostics_indicator = function(count, level)
    --     local icon = level:match("error") and " " or ""
    --     return " " .. icon .. count
    --   end
    --   return buff 
    -- end
  },
}
