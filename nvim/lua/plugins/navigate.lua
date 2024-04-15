return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.which-key").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  --Telescope
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
    },
    config = function()

      --Test 
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")

      function enter(prompt_bufnr)
        local selection = actions_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selection[1]
        vim.cmd(cmd)

        local init = vim.fn.expand("~/.config/nvim/init.lua")
        local job_cmd = "sed -i '$d' " .. init .. " && echo '".. cmd .. "' >> " .. init 
        vim.cmd('!echo "testing2" >> ~/.config/nvim/init.lua')
        -- vim.fn.jobstart(job_cmd)
        actions.close(prompt_bufnr)
      end

      require("telescope").setup({
        defaults = {
          thene = "custom", 
          results_title = false,
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          sorting_strategy = "ascending",
          layout_strategy = "center", --center, cursor, bottom_pane
          layout_config = {
            preview_cutoff = 1, -- Preview should always show (unless previewer = false)
            width = function(_, max_columns, _)
              return math.min(max_columns, 80)
            end,
            height = function(_, _, max_lines)
              return math.min(max_lines, 15)
            end,
          },
          border = true,
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
          ["ui-select"] = {
            require("telescope.themes").get_cursor(),
          },
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      })
      -- require('telescope').load_extension('colorscheme')
      -- require("telescope").load_extension("fzf")
      -- require("telescope").load_extension("fzy_native")
      require("telescope").load_extension("ui-select")
      require('telescope').load_extension('media_files')
      -- require('telescope').load_extension('dap')

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
      -- lsp_rename_autosave = false,
      -- lsp_file_methods.autosave_changes,
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
      -- Set to false to disable all of the above keymaps
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
}
