local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.t_co = 256
g.background = "dark"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.netrw_banner = 0
g.netrw_liststyle = 0
-- Give me some fenced codeblock goodness
g.markdown_fenced_languages = {
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"css",
	"lua",
	"vim",
	"bash",
}

opt.laststatus = 3 -- global statusline
opt.showmode = false

--NOTE: Barbecue
-- opt.winbar = true
-- opt.winbarpaddingleft = " "

-- opt.clipboard = "unnamedplus"

opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true

opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true

opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 999
opt.showtabline = 2
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false
opt.sidescrolloff = 8

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

--Which-key opts
opt.timeout = true
opt.timeoutlen = 300

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
-- Vertically center document when entering insert mode
-- vim.cmd([[autocmd InsertEnter * norm zz]])
-- detect mdx file and set file type to markdown
vim.cmd([[autocmd BufNewFile,BufRead *.mdx set filetype=markdown.mdx]])
--format document on save using lsp
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

--UFO
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

--TEST:
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true

--NOTE: Change cursor style in insert mode
-- vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

--NOTE: Space after enter inside html element
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "html", "typescriptreact", "javascriptreact" },
-- 	callback = function()
-- 		vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<CR><Esc>O", { noremap = true, silent = true })
-- 	end,
-- })
