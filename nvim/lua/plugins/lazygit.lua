return {
  "kdheepak/lazygit.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local default_opts = { noremap = true, silent = true }
    keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", default_opts)
  end
}
