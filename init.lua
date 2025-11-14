-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("colorscheme kanagawa")

-- enable copy and paste with wayland clipboard
vim.opt.clipboard = "unnamedplus"

-- disable autoformat when saving files
vim.g.autoformat = false

vim.opt.wrap = true
vim.opt.linebreak = true

-- latexindent
require("config.latexindent").setup()

-- create templatefor java
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

-- no conceal (ini buat kalo lagi di .tex file)
vim.opt.conceallevel=0
