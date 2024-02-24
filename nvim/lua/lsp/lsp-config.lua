return {
  {
    "williamboman/mason.nvim",
    -- vim.lsp.set_log_level("off"),
    -- vim.lsp.set_log_level("debug"), 
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          -- "stylua",
          "eslint_d",
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          -- "lua_ls",
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local keymap = vim.keymap.set

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

    lspconfig.html.setup({
      capabilities = capabilities,
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })
    -- lspconfig.emmet_ls.setup({
    --   capabilities = capabilities,
    -- })
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities,
      --   settings = { -- custom settings for lua
      --     Lua = {
      --       -- make the language server recognize "vim" global
      --       diagnostics = {
      --         globals = { "vim" },
      --       },
      --       workspace = {
      --         -- make language server aware of runtime files
      --         library = {
      --           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --           [vim.fn.stdpath("config") .. "/lua"] = true,
      --         },
      --       },
      --     },
      --   },
      -- })

      keymap('n', 'K', vim.lsp.buf.hover, {})
      keymap('n', 'gd', vim.lsp.buf.definition, {})
      keymap('n', 'gr', vim.lsp.buf.references, {})
      keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
