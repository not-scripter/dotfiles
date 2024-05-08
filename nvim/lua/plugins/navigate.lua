return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
      config = function()
          require("plugins.configs.mappings").setup()
        end,
      -- config = function()
        --   require("plugins.configs.which-key").setup()
        -- end,
      },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  --NOTE: Telescope
  {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.x",
    branch = "0.1.x",
    dependencies = {
      'nvim-lua/popup.nvim',
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-github.nvim",
      'andrew-george/telescope-themes',
    },
    config = function()
      local ts = require("telescope")
      local lx = require("telescope").load_extension
      local themes = require("telescope.themes")
      local action = require("telescope.actions")

      ts.setup({
        defaults = {
          theme = "custom", 
          results_title = false,
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          sorting_strategy = "ascending",
          layout_strategy = "center", --center, cursor, bottom_pane
          layout_config = {
            preview_cutoff = 1,
            width = function(_, max_columns, _)
              return math.min(max_columns, 80)
            end,
            height = function(_, _, max_lines)
              return math.min(max_lines, 15)
            end,
          },
        },
        pickers = {
          colorscheme = {
            enable_preview = true
          },
          find_files = {
            theme = "dropdown", -- cursor, ivy, dropdown
          }
        },
        extensions = {
          themes = {
            layout_config = {
              horizontal = {
                width = 0.8,
                height = 0.7,
              },
            },
            enable_previewer = true, 
            enable_live_preview = true,
            persist = {
              enabled = true, 
              path = vim.fn.stdpath("config") .. "/lua/core/theme.lua" 
            }
          },
        },
        mappings = {
          n = { ["q"] = action.close },
        },
      })
      lx("noice")
      lx("ui-select")
      lx('media_files')
      lx('project')
      lx('themes')
      lx('zoxide')
      -- lx('colorscheme')
      -- lx("fzf")
      -- lx("fzy_native")
      -- lx('dap')
    end,
  },

  {
    'ThePrimeagen/harpoon',
    config = function()
      menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
      }
    end
  },

  {
    'stevearc/oil.nvim',
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      -- lsp_rename_autosave = true,
      -- lsp_file_methods.autosave_changes = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g/"] = "actions.toggle_trash",
      },
      use_default_keymaps = false,
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end,
      },
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        update_on_cursor_moved = true,
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        }
      }
    }
  },

  --NOTE: replacement for oil.nvim
  { 
    'echasnovski/mini.files', 
    version = '*',
    opts = {},
  },

  --NOTE: Move Nvim
  { 
    'fedepujol/move.nvim',
    opts = {}
  },

}
