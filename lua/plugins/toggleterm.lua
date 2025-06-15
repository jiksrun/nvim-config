return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Automatically grabs the latest stable version
    config = function()
      require("toggleterm").setup({
        -- Customize toggleterm behavior here
        size = 20,
        open_mapping = [[<C-\>]], -- Default toggle key
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        direction = "horizontal", -- Options: "vertical", "horizontal", "tab", "float"
        float_opts = {
          border = "curved",    -- Options: "single", "double", "shadow", "curved"
        },
        shell = "zsh",
      })

      -- Custom Keymaps for Terminal Mode
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)        -- Exit terminal mode
        vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)           -- Alternative exit
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Move left
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Move down
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Move up
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Move right
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
