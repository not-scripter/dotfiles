local opt = vim.opt

opt.autowrite = true
-- opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.confirm = true
opt.cursorline = true
opt.expandtab = true 
-- opt.formatoptions = "jcroqlnt" 
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = true
opt.mouse = "a" 
opt.number = true
opt.pumblend = 10
opt.relativenumber = true 
opt.pumheight = 10
opt.scrolloff = 999
opt.showtabline= 0
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true 
opt.shiftwidth = 2 
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false 
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true 
opt.splitkeep = "screen"
opt.splitright = true 
opt.tabstop = 4
opt.termguicolors = true 
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 
opt.virtualedit = "block" 
opt.wildmode = "longest:full,full"
opt.winminwidth = 5 
opt.wrap = false
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
--Which-key opts
opt.timeout = true
opt.timeoutlen = 300 --300

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
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 3 --1
vim.o.foldenable = true
