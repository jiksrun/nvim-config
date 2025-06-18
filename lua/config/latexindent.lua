local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    callback = function()
      local file = vim.fn.expand("%:p")
      local cmd = string.format("latexindent -w -l=/home/jiksrun/.latexindent.yaml %s", file)
      vim.fn.system(cmd)
      vim.cmd("checktime")
    end,
  })
end

return M
