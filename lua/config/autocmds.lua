-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     local file_dir = vim.fn.expand("%:p:h")
--     -- vim.cmd("cd " .. file_dir)
--     if file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1 then
--       vim.cmd("cd " .. file_dir)
--     end
--   end,
--   desc = "Automatically change CWD to the file's directory on buffer enter",
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     local file_dir = vim.fn.expand("%:p:h")
--
--     -- Look for common Java project markers
--     local pom = vim.fn.findfile("pom.xml", file_dir .. ";")
--     local gradle = vim.fn.findfile("build.gradle", file_dir .. ";")
--
--     if pom ~= "" or gradle ~= "" then
--       return  -- skip for Java projects
--     end
--
--     if file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1 then
--       vim.cmd("cd " .. file_dir)
--     end
--   end,
--   desc = "Auto CWD (except for Java projects)",
-- })
-- Create a global toggle variable
_G.auto_cwd_enabled = true

-- Define the autocmd
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if not _G.auto_cwd_enabled then
      return
    end

    local file_dir = vim.fn.expand("%:p:h")
    if file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1 then
      vim.cmd("cd " .. file_dir)
    end
  end,
  desc = "Automatically change CWD to the file's directory on buffer enter",
})

-- Define a user command to toggle the feature
vim.api.nvim_create_user_command("ToggleAutoCwd", function()
  _G.auto_cwd_enabled = not _G.auto_cwd_enabled
  if _G.auto_cwd_enabled then
    print("📁 Auto CWD: ON")
  else
    print("📁 Auto CWD: OFF")
  end
end, {})
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
