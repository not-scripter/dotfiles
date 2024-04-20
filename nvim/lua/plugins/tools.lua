return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "lua", "vim", "html", "css", "javascript",  "typescript", "tsx", "norg", "json", "python", "gitignore", "git_config", "jsonc" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
      })
    end
  },
  {
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    'kevinhwang91/nvim-ufo', 
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = {"BufReadPre", "BufNewFile"},
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  {
    "numToStr/FTerm.nvim",
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local keymap = vim.api.nvim_set_keymap
      local default_opts = { noremap = true, silent = true }
      keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", default_opts)
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = true,
        }
      })
      vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end
  },

  {
    'jvgrootveld/telescope-zoxide',
    dependencies = {
      'nanotee/zoxide.vim',
      'nvim-lua/popup.nvim',
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension('zoxide')
      vim.keymap.set("n", "<leader>zf", telescope.extensions.zoxide.list, { desc = "Zoxide Find" })
    end
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = "nvim-neotest/nvim-nio",
        config = function()
          require("dapui").setup()
        end
      },
      {
        "microsoft/vscode-js-debug",
        opts = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
          })

          for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
            require("dap").configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
              }
            }
          end
        end
      }
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },

  --NOTE: Live edit html css javascript
  {
    "turbio/bracey.vim",
    cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
    build = "npm install --prefix server",
  },

  {
    "aurum77/live-server.nvim",
    enabled = false,
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },

  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup({
        register = "+",
        color_preview =  "█ %s",
        default_format = "hex",
        border = "rounded",
        mappings = {
          increment = "l",
          decrement = "h",
          increment_big = "L",
          decrement_big = "H",
          min_value = "0",
          max_value = "$",
          set_register_default_format = "<cr>",
          set_register_cjoose_format = "g<cr>",
          replace_default_format = "<m-cr>",
          replace_choose_format = "g<m-cr>",
          export = "E",
          set_value = "c",
          transparency = "T",
          choose_background = "B",
        }
      })
    end
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

}
