return {
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
}
