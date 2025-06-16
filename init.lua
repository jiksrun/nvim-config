-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme tokyonight-moon")
vim.cmd("colorscheme catppuccin-macchiato")
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#A020F0" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700" })

-- enable copy and paste with wayland clipboard
vim.opt.clipboard = ""
vim.g.clipboard = {
  name = "waylandClipboard",
  copy = {
    ["*"] = "wl-copy",
    ["+"] = "wl-copy",
  },
  paste = {
    ["*"] = "wl-paste --no-newline",
    ["+"] = "wl-paste --no-newline",
  },
  cache_enabled = 0,
}

-- disable autoformat when saving files
vim.g.autoformat = false

-- transparent background
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
