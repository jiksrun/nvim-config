-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local file_dir = vim.fn.expand("%:p:h")
    -- vim.cmd("cd " .. file_dir)
    if file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1 then
      vim.cmd("cd " .. file_dir)
    end
  end,
  desc = "Automatically change CWD to the file's directory on buffer enter",
})
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
