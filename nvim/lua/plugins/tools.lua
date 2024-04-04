return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "lua", "vim", "html", "css", "javascript", "typescript", "tsx", "norg", "json", "python", "gitignore", "git_config", "jsonc" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
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
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        }
      })
      vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, { desc="Session Manager", noremap = true })
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
      -- {
      --   "microsoft/vscode-js-debug",
      --   opt = true,
      --   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      -- }
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
          })

          for _, language in ipairs({ "typescript", "javascript" }) do
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
}
