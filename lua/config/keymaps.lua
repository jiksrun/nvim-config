-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
-- vim.keymap.set('n', "cd", ":cd %:p:h<CR>", { desc = "Set CWD to current file's directory" }) -- ini udah ga perlu (udah nambah di autocmd)
-- vim.keymap.set("i", "<C-h>", function()
--   require("blink.cmp.signature.trigger").hide()
-- end, { desc = "Hide Blink Signature Help" })
