local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

--Insert Mode
map("i", "<C-h>", "<Left>", default_opts)
map("i", "<C-l>", "<Right>", default_opts)
map("i", "<C-j>", "<Down>", default_opts)
map("i", "<C-k>", "<Up>", default_opts)
map("i", "<C-s>", "<cmd> w <CR>", default_opts)
map("i", "<C-c>", "<ESC>", default_opts)
map("i", "<Tab>", "<cmd>bnext<CR>", default_opts)
-- map("i", "<S-Tab>", "<cmd>bprev<CR>", default_opts)
map("i", "<S-Tab>", "<cmd>vsplit<CR>", default_opts)
-- map("i", "< - > ", "<cmd>split<CR>", default_opts)

--Normal Mode
map("n", ";", ":", default_opts) 
map("n", "<C-h>", "<Left>", default_opts)
map("n", "<C-l>", "<Right>", default_opts)
map("n", "<C-j>", "<Down>", default_opts)
map("n", "<C-k>", "<Up>", default_opts)
map("n", "<C-s>", "<cmd> w <CR>", default_opts) 
map("n", "<C-c>", "<cmd> %y+ <CR>", default_opts)
map("n", "<C-d>", "<C-d>zz", default_opts)
map("n", "<C-u>", "<C-u>zz", default_opts)
map("n", "n", "nzzzv", default_opts)
map("n", "N", "Nzzzv", default_opts)
map("n", "<Tab>", "<cmd>bnext<CR>", default_opts)
map("n", "<S-Tab>", "<cmd>vsplit<CR>", default_opts)
-- map("n", "<S-Tab>", "<cmd>bprev<CR>", default_opts)
-- map("n", "< - > ", "<cmd>split<CR>", default_opts)

--ToggleTerm
map('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>', default_opts)
map('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', default_opts)

--Oil Files
map("n", "-", "<CMD>Oil<CR>", { desc = "Files" })
