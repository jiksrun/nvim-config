return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    -- Browser config (optional)
    vim.g.mkdp_browser = "zen-browser" -- or remove if causing issues
    vim.g.mkdp_filetypes = { "markdown" }

    -- Trigger FileType autocmd manually
    vim.cmd([[do FileType]])

    -- Setup keymap only for markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.keymap.set("n", "<leader>cp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview", buffer = true })
      end,
    })
  end,
}
