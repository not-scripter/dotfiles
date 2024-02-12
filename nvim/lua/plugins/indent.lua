return {
 "lukas-reineke/indent-blankline.nvim", 
 main = "ibl", 
 config = function()
--   local highlight = {
--     "RainbowFirst",
--     "RainbowSecond",
-- }
--
-- local hooks = require "ibl.hooks"
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowFirst", { fg = "#f000f0" })
--     vim.api.nvim_set_hl(0, "RainbowSecond", { fg = "#00f0f0" })
-- end)
--
-- require("ibl").setup { indent = { highlight = highlight } }

  require("ibl").setup()
 end
}
