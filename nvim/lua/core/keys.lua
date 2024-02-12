local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }


--Insert Mode
keymap("i", "<C-h>", "<Left>", default_opts)
keymap("i", "<C-l>", "<Right>", default_opts)
keymap("i", "<C-j>", "<Down>", default_opts)
keymap("i", "<C-k>", "<Up>", default_opts)
keymap("i", "<C-s>", "<cmd> w <CR>", default_opts)
keymap("i", "<C-c>", "<ESC>", default_opts)
keymap("i", "<Tab>", "<cmd>bnext<CR>", default_opts)
-- keymap("i", "<S-Tab>", "<cmd>bprev<CR>", default_opts)
keymap("i", "<S-Tab>", "<cmd>vsplit<CR>", default_opts)
-- keymap("i", "< - > ", "<cmd>split<CR>", default_opts)


--Normal Mode
keymap("n", ";", ":", default_opts) 
keymap("n", "<C-h>", "<Left>", default_opts)
keymap("n", "<C-l>", "<Right>", default_opts)
keymap("n", "<C-j>", "<Down>", default_opts)
keymap("n", "<C-k>", "<Up>", default_opts)
keymap("n", "<C-s>", "<cmd> w <CR>", default_opts) 
keymap("n", "<C-c>", "<cmd> %y+ <CR>", default_opts)
keymap("n", "<C-d>", "<C-d>zz", default_opts)
keymap("n", "<C-u>", "<C-u>zz", default_opts)
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
keymap("n", "<Tab>", "<cmd>bnext<CR>", default_opts)
-- keymap("n", "<S-Tab>", "<cmd>bprev<CR>", default_opts)
keymap("n", "<S-Tab>", "<cmd>vsplit<CR>", default_opts)
-- keymap("n", "< - > ", "<cmd>split<CR>", default_opts)


--ToggleTerm
keymap('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>', default_opts)
keymap('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', default_opts)
