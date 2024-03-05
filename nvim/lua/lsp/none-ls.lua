return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      -- autostart = true,
      sources = {
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.eslint,
        require("none-ls.diagnostics.eslint"),
        require("none-ls.code_actions.eslint"),
        -- null_ls.builtins.code_actions.xo,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.tags,
        -- null_ls.builtins.code_actions.ts_node_action,
      },
    })
    -- vim.keymap.set('n', '<leader>l', vim.lsp.buf.format, { desc="Format Document" })
  end
}
