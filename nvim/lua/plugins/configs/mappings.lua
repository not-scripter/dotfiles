--NOTE: Key Mappings with Which-Key
local M = {}
local wk = require("which-key")
function M.setup()
  --NOTE: Keymaps for Normal Mode without Prefix
  wk.register({
    [";"] = { ":", "Cmd" },
    ["<Tab>"] = { "<cmd>bnext<ce>", "Next Buffer" },
    ["<S-Tab>"] = { "<cmd>bprevious<ce>", "Previous Buffer" },
    ["-"] = { "<cmd>lua MiniFiles.open()<cr>", "Files" },
    -- map("n", "<C-d>", "<C-d>zz", default_opts)
    -- map("n", "<C-u>", "<C-u>zz", default_opts)
    -- map("n", "n", "nzzzv", default_opts)
    -- map("n", "N", "Nzzzv", default_opts)
    -- map("n", "-", "<CMD>Oil<CR>", { desc = "Files" })
    ["<A-t>"] = { '<cmd>lua require("FTerm").toggle()<cr>', "Terminal" },
    ["<A-v>"] = { "<cmd>vsplit<ce>", "Split Vertically" },
    ["<A-h>"] = { "<cmd>split<ce>", "Split Horizontally" },

  }, { mode = "n" })

  --NOTE: Keymaps for Insert Mode without Prefix
  wk.register({
    ["<C-c>"] = { "<esc>", "Esc" },
    ["<C-h>"] = { "<Left>", "Left" },
    ["<C-j>"] = { "<Down>", "Down" },
    ["<C-k>"] = { "<Up>", "Up" },
    ["<C-l>"] = { "<Right>", "Right" },
  }, { mode = "i" })

  --NOTE: Keymaps for Normal, Insert  and Visual Mode without Prefix
  wk.register({
    ["<A-h>"] = { "<cmd>MoveHChar(-1)<cr>", "Move Char Left" },
    ["<A-j>"] = { "<cmd>MoveLine(1)<cr>", "Move Line Down" },
    ["<A-k>"] = { "<cmd>MoveLine(-1)<cr>", "Move Line Uo" },
    ["<A-l>"] = { "<cmd>MoveHChar(1)<cr>", "Move Char Right" },
    ["<A-f>"] = { "<cmd>MoveWord(1)<cr>", "Move Word Forward" },
    ["<A-b>"] = { "<cmd>MoveWord(-1)<cr>", "Move Word Backward" },
    }, { mode = { "n", "i", "v" } })

    --NOTE: Keymaps for Terminal Mode without Prefix
    wk.register({
      ["<A-t>"] = { '<C-\\><C-n><cr>lua require("FTerm").toggle()<cr>', "Terminal" },
    }, { mode = "t" })

    --NOTE: Keymaps for Normal and Visual Mode with leader prefix
    wk.register({
      ["M"] = { "<cmd>WhichKey<cr>", "Mappings" },
      ["w"] = { "<cmd>write<cr>", "Save" },
      ["q"] = { "<cmd>quit<CR>", "Quit" },
      ["="] = { "z=", "Spelling Suggestions" },
      ["y"] = { "<cmd>%y+<cr>", "Copy All" },
      --NOTE: Dashboard
      ["D"] = { "<cmd>Dashboard<CR>", "Dashboard" },
      --NOTE: Actions
      ["x"] = { "<cmd>bdelete<CR>", "Close Buffer" },
      ["X"] = { "<cmd>%bd|e#|bd#<CR>", "Close All Buffer" },
      ["/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Comment Toggle" },
       --NOTE: Neotree
      ["e"] = { "<cmd>Neotree focus<CR>", "NeoTree" },
      ["c"] = { "<cmd>Neotree close<CR>", "Neotree Close" },
      -- ["c"] = { "<cmd>Ex<CR>", "" },
      -- ["leader>"] = { "=ap", "Format" },
      --NOTE: Ufo Folds
      ["a"] = { "za", "Toggle Fold" },
      ["A"] = { "zA", "Toggle Folds" },
      --NOTE: LazyGit
      ["g"] = { "<cmd>LazyGit<CR>", "LazyGit" },
      --NOTE: TreeJS
      ["m"] = { "<cmd>lua require('treesj').toggle()<CR>", "TSJ Toggle" },
      --NOTE: Nav Buddy 
      ["N"] = { "<CMD>Navbuddy<CR>", "Nav Buddy" },
      --NOTE: Zoxide
      ["Z"] = { require("telescope").extensions.zoxide.list, "zoxide find" },
      --NOTE: Pick Color 
      ["C"] = { "<CMD>PickColor<CR>", "Pick Color" },

      --NOTE: Keybind Groups

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

      --NOTE: Telescope
      f = {
        name = "Telescope",
        p = { "<cmd>Telescope project<CR>", "Find Projects" },
        P = { "<cmd>Telescope planets<CR>", "Find Planets" },
        t = { "<cmd>Telescope themes<CR>", "Themes" },
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

      -- C = {
        --   name = "Colortils",
        --   p = { "<CMD>Colortils picker<CR>", "Picker" },
        --   l = { "<CMD>Colortils lighten<CR>", "Lighten" },
        --   d = { "<CMD>Colortils darken<CR>", "Darken" },
        --   g = { "<CMD>Colortils greyscale<CR>", "Greyscale" },
        --   G = { "<CMD>Colortils gradient<CR>", "Gradient" },
        --   L = { "<CMD>Colortils css list<CR>", "List CSS Colors" },
        -- },

      }, {
        prefix = "<leader>",
        mode = { "n", "v" },
      })

      --NOTE: which-key config options
      wk.setup({
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
      })
    end
    return M
