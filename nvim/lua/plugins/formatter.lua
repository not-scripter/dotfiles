return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          svelte = { "prettier" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          graphql = { "prettier" },
          java = { "google-java-format" },
          kotlin = { "ktlint" },
          ruby = { "standardrb" },
          markdown = { "prettier" },
          erb = { "htmlbeautifier" },
          html = { "prettier" --[[ "htmlbeautifier" ]] },
          bash = { "beautysh" },
          proto = { "buf" },
          rust = { "rustfmt" },
          yaml = { "yamlfix" },
          toml = { "taplo" },
          css = { "prettier" },
          scss = { "prettier" },
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
