return {
  "nvimtools/none-ls.nvim",
  -- enabled = false,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      -- autostart = true,
      sources = {
        --NOTE: Completions
        null_ls.builtins.completion.tags,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.completion.luasnip,
        --NOTE: Diagnostics
        -- null_ls.builtins.diagnostics.codespell,
        -- null_ls.builtins.diagnostics.actionlint,
        -- null_ls.builtins.diagnostics.checkmake,
        -- null_ls.builtins.diagnostics.alex,
        -- null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.eslint,
        -- require("none-ls.diagnostics.eslint"),
        --NOTE: Formatting
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        --NOTE: Code Actions 
        -- null_ls.builtins.code_actions.xo,
        -- null_ls.builtins.code_actions.ts_node_action,
        -- require("none-ls.code_actions.eslint"),
      },
    })
    -- vim.keymap.set('n', '<leader>l', vim.lsp.buf.format, { desc="Format Document" })
  end
}
