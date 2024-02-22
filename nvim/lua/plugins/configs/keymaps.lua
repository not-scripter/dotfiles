local M = {}

function M.setup()
 local whichkey = require "which-key"

 local conf = {
    plugins = {
      marks = true, 
      registers = true, 
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,    -- adds help for operators like d, y, ...
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    operators = { gc = "Comments" },
    key_labels = {
      ["<space>"] = "l",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    motions = {
      count = true,
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<C-d>", -- binding to scroll down inside the popup
      scroll_up = "<C-u>",   -- binding to scroll up inside the popup
    },
    window = {
      border = "single",          -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 2, 1, 2 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    },
    layout = {
      -- height = { min = 4, max = 25 }, -- min and max height of the columns
      -- width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 5, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
 }

 local opts = {
  mode = {'n', 'v'},
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
 }

  local mappings = {
    ["D"] = { "<cmd>Dashboard<CR>", "Dashboard" },
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["e"] = { "<cmd>Neotree focus<CR>", "NeoTree" },
    ["c"] = { "<cmd>Neotree close<CR>", "Neotree Close" },
    -- ["c"] = { "<cmd>Ex<CR>", "" },
  
    [";"] = { "<cmd>ToggleTerm<CR>", "ToggleTerm" },

    ["x"] = { "<cmd>bd!<CR>", "Close Buffer" },
    ["X"] = { "<cmd>%bd|e#|bd#<CR>", "Close all Buffer" },
    ["/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Comment  Toggle" },
    -- ["."] = { "<cmd>'<,'>CommentToggle<CR>", "Comment in V mode" },
    ["m"] = { "<cmd>lua require('treesj').toggle()<CR>", "TSJ Toggle" },

    ["<leader>"] = { "=ap", "Format" },


    z = {
      name = "Lazy",
      z = { "<cmd>Lazy<cr>", "Lazy" },
      c = { "<cmd>Lazy check<cr>", "Check" },
      C = { "<cmd>Lazy clean<cr>", "Clean" },
      i = { "<cmd>Lazy install<cr>", "Install" },
      s = { "<cmd>Lazy sync<cr>", "Sync" },
      S = { "<cmd>Lazy status<cr>", "Status" },
      u = { "<cmd>Lazy update<cr>", "Update" },
      r = { "<cmd>Lazy restore<cr>", "Restore" },
    },

    f = {
      name = "Telescope",
      b = { "<cmd>Telescope<CR>", "Telescope Builtins" },
      f = { "<cmd>Telescope find_files prompt_prefix=🔍<CR>", "Find Files" },
    },

    o = {
      name = "ChatGPT",
      o = { "<cmd>ChatGPT<CR>", "ChatGPT Open" },
      a = { "<cmd>ChatGPTActAs<CR>", "ChatGPT ActAs" },
      e = { "<cmd>ChatGPTEditWithInstructions<CR>", "ChatGPT Edit w Ins" },
    },

    h = {
      name = "Harpoon",
      m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark" },
      o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open" },
      p = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Previos" },
      n = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Next" },
      f = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "First" },
    },

    g = {
      name = "Git",
      s = { "<cmd>LazyGit<CR>", "LazyGit" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
 end

return M
