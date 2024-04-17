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

    --Neotree
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

    a = {
      name = "ChatGPT",
      o = { "<cmd>ChatGPT<CR>", "ChatGPT Open" },
      a = { "<cmd>ChatGPTActAs<CR>", "ChatGPT ActAs" },
      e = { "<cmd>ChatGPTEditWithInstructions<CR>", "ChatGPT Edit w Ins" },
    },

    d = {
      name = "Debugger",
      b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
      c = { "<cmd>DapContinue<CR>", "Continue" },
      o = { "<cmd>DapStepOver<CR>", "Step Over" },
      i = { "<cmd>DapStepInto<CR>", "Step Into" },
      s = { "<cmd>DapShowLog<CR>", "Log" },
      t = { "<cmd>DapTerminate<CR>", "Terminate" },
      u = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Dap UI" },
    },

    h = {
      name = "Harpoon",
      m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark" },
      o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open" },
      p = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Previos" },
      n = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Next" },
      f = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "First" },
    },

    t = {
      name = "TSTools",
      o = { "<cmd>TSToolsOrganizeImports<cr>", "Organize" },
      s = { "<cmd>TSToolsSortImports<cr>", "Sort" },
      r = { "<cmd>TSToolsRemoveUnusedImports<cr>", "Remove Unused" },
      R = { "<cmd>TSToolsRemoveUnused<cr>", "Remove Unused Statement" },
      a = { "<cmd>TSToolsAddMissingImports<cr>", "Add Missing Imports" },
      f = { "<cmd>TSToolsFixAll<cr>", "Fix Errors" },
      d = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Source Definition" },
      r = { "<cmd>TSToolsRenameFile<cr>", "Rename File" },
      R = { "<cmd>TSToolsFileReferences<cr>", "Find File References" },
    },

    o = {
      name = "Obsodian",
      n = { "<cmd>ObsidianNew<CR>", "Create New <Create>" },
      o = { "<cmd>ObsidianOpen<CR>", "Open <Title>" },
      s = { "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
      S = { "<cmd>ObsidianSearch<CR>", "Search <Name>" },
      c = { "<cmd>ObsidianToggleCheckbox<CR>", "Toggle Checkbox" },
      f = { "<cmd>ObsidianFollowLink<CR>", "Follow Link" },
      b = { "<cmd>ObsidianBacklinks<CR>", "Back Links" },
      t = { "<cmd>ObsidianTags<CR>", "Tag [Tag]" },
      T = { "<cmd>ObsidianToday<CR>", "Today <Day>" },
      y = { "<cmd>ObsidianYesterday<CR>", "Yesterday" },
      Y = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow" },
      x = { "<cmd>ObsidianTemplate<CR>", "Template <Name>" },
      l = { "<cmd>ObsidianLink<CR>", "Link <Name>" },
      L = { "<cmd>ObsidianLinkNew<CR>", "New Link <Name>" },
      v = { "<cmd>ObsidianLinks<CR>", "Links" },
      r = { "<cmd>ObsidianRename<CR>", "Rename <New Name>" },
      e = { "<cmd>ObsidianExtractNote<CR>", "Extract Selected to New" },
      w = { "<cmd>ObsidianWorkspace<CR>", "Switch Workspace <Name>" },
      p = { "<cmd>ObsidianPasteImg<CR>", "Pase Img <Img Name>" },
    },

    T = {
      name = "Trouble",
      d = { "<cmd>Trouble diagnostics toggle<cr>", "Diagonostics" },
      b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagonostics" },
      s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
      r = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Definitions / References" },
      l = { "<cmd>Trouble loclist toggle<cr>", "Location List" },
      q = { "", "Quickfix List" },
    },

    S = {
      name = "Sessions",
      s = { "<cmd>SessionSave<cr>", "Save" },
      r = { "<cmd>SessionRestore<cr>", "Restore" },
      d = { "<cmd>SessionDelete<cr>", "Delete" },
      f = { "<cmd>Autosession search<cr>", "Find" },
      D = { "<cmd>Autosession delete<cr>", "Find and Delete" },
    },

    l = {
      name = "Lsp",
      k = { vim.lsp.buf.hover, "Hover" },
      r = { vim.lsp.buf.rename, "Rename" },
      d = { vim.lsp.buf.definition, "Definition" },
      f = { vim.lsp.buf.references, "References" },
      c = { vim.lsp.buf.code_action, "Code Action" },
    },

  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
 end

return M
