return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          svelte = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 5000,
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>L", function()
        conform.format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 5000,
        })
      end, { desc = "Format Buffer" })
    end,
  },
  {
    'Wansmer/treesj',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {},
  },

}
