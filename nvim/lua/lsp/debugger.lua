return {
  'mfussenegger/nvim-dap',
  -- enabled = false,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" }
    },
    --TEST:
    {
      'theHamsta/nvim-dap-virtual-text',
      config = function()
        require("nvim-dap-virtual-text").setup()
      end
    },
    --NOTE: Lua dap
    {
      "tomblind/local-lua-debugger-vscode"
    },
    --NOTE: Javascript dap
    {
      "microsoft/vscode-js-debug",
      enabled = false,
      opts = true,
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
  },
  config = function()
    -- require("dap-up").setup()

    local dap = require("dap")
    local dapui = require("dapui")
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
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})

    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js"
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }
  end
}



-- {
--   'mfussenegger/nvim-dap',
--   dependencies = {
--     {
--       'rcarriga/nvim-dap-ui',
--       dependencies = "nvim-neotest/nvim-nio",
--   opts = {},
--     },
--     {
--       "microsoft/vscode-js-debug",
--       opts = true,
--       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
--     },
--
-- BUG: THIS PLUGIN CAUSES "STAKE CORRUPTION ERROR"
--     {
--       "mxsdev/nvim-dap-vscode-js",
--       config = function()
--         require("dap-vscode-js").setup({
--           adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
--         })
--
--         for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
--           require("dap").configurations[language] = {
--             {
--               type = "pwa-node",
--               request = "launch",
--               name = "Launch file",
--               program = "${file}",
--               cwd = "${workspaceFolder}",
--             },
--             {
--               type = "pwa-node",
--               request = "attach",
--               name = "Attach",
--               processId = require'dap.utils'.pick_process,
--               cwd = "${workspaceFolder}",
--             }
--           }
--         end
--       end
--     }
--   },
--   config = function()
--     local dap, dapui = require("dap"), require("dapui")
--     dap.listeners.before.attach.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.launch.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated.dapui_config = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited.dapui_config = function()
--       dapui.close()
--     end
--   end
--  },
