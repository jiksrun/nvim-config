return {
  {
    "iamcco/markdown-preview.nvim",

    ft = { "markdown" },

    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },

    build = function()
      vim.fn["mkdp#util#install"]()
    end,

    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "zen-browser"
    end,

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.keymap.set(
            "n",
            "<leader>cp",
            "<cmd>MarkdownPreviewToggle<CR>",
            { buffer = true, desc = "Markdown Preview" }
          )
        end,
      })
    end,
  },

  -- disable markdownlint for markdown files
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
