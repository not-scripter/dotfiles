return {
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter',
    -- config = function ()
    --   vim.g.codeium_disable_bindings = 1
    --   vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
    --   vim.keymap.set('i', '<C-CR>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    --   vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    --   vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    --   vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    -- end
  },
  -- }
    -- "jackMort/ChatGPT.nvim",
    -- event = "VeryLazy",
    -- config = function()
    --   require("chatgpt").setup({
    --     api_key_cmd = "pass show api/openai",
    --   })
    -- end,
    -- dependencies = {
    --   "MunifTanjim/nui.nvim",
    --   "nvim-lua/plenary.nvim",
    --   "folke/trouble.nvim",
    --   "nvim-telescope/telescope.nvim"
    -- }
  -- }
}
