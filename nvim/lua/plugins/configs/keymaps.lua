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
        operators = true,    
        motions = true,     
        text_objects = true,
        windows = true,    
        nav = true,       
        z = true,        
        g = true,       
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
      breadcrumb = "»",
      separator = "➜", 
      group = "+", 
    },
    popup_mappings = {
      scroll_down = "<C-d>",
      scroll_up = "<C-u>", 
    },
    window = {
      border = "single",       
      position = "bottom",    
      margin = { 1, 2, 1, 2 },
      padding = { 1, 2, 1, 2 },
      winblend = 0,           
      zindex = 1000,         
    },
    layout = {
      -- height = { min = 4, max = 25 }, -- min and max height of the columns
      -- width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 5,
      align = "center",
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
  
    ["x"] = { "<cmd>bd!<CR>", "Close Buffer" },
    ["X"] = { "<cmd>%bd|e#|bd#<CR>", "Close all Buffer" },
    ["/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Comment  Toggle" },

    ["<leader>"] = { "=ap", "Format" },

    --Terminal
    ["<A-t>"] = { '<CMD>lua require("FTerm").toggle()<CR>', "Terminal" },
    ["<A-t>"] = { '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', "Terminal" },
    --Oil File Browser
    ["-"] = { "<CMD>Oil<CR>", "Files" },

    --Ufo Folds
    ["a"] = { "za", "Toggle Fold" },
    ["A"] = { "zA", "Toggle Folds" },

    --LazyGit
    ["g"] = { "<cmd>LazyGit<CR>", "LazyGit" },

    --TreeJS
    ["m"] = { "<cmd>lua require('treesj').toggle()<CR>", "TSJ Toggle" },

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

    --Telescope
    f = {
      name = "Telescope",
      p = { "<cmd>Telescope planets<CR>", "Find Planets" },
      c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Find Keymaps" },
      f = { "<cmd>Telescope find_files<cr>", "Find Files" },
      s = { "<cmd>Telescope builtin<cr>", "Find Select Telescope" },
      w = { "<cmd>Telescope grep_string<cr>", "Find Current Word" },
      g = { "<cmd>Telescope live_grep<cr>", "Find by Grep" },
      d = { "<cmd>Telescope diagnostics<cr>", "Find Diagonostics" },
      r = { "<cmd>Telescope resume<cr>", "Find Resume" },
      u = { "<cmd>Telescope oldfiles<cr>", "Find Recent Files" },
      b = { "<cmd>Telescope buffers<cr>", "Find Existing Buffers" },
      m = { "<cmd>Telescope media_files<CR>", "Find Media Files" },
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
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
 end

return M
