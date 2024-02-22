return {
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
}
