# Neovim Configuration

A workflow-focused Neovim setup built on [LazyVim](https://github.com/LazyVim/LazyVim), optimized for LaTeX writing, Java development, SQL workflows, and terminal-first editing.

The configuration favors explicit control over aggressive automation:
- autoformat disabled globally
- conceal disabled for readable source
- transparent UI with minimal visual noise

Designed primarily for Linux + Wayland environments.

## Overview

| Category | Details |
|---|---|
| **Base** | LazyVim with custom plugin and config overrides |
| **Colorscheme** | Kanagawa (wave variant), transparent background |
| **Package Manager** | lazy.nvim |
| **Completion** | nvim-cmp (LSP, luasnip, buffer, path) |
| **Language Support** | LaTeX, Java, Python, JavaScript/TypeScript, SQL, Markdown |

## Plugin Configuration

### Editor

| Plugin | Description | Configuration |
|---|---|---|
| **nvim-treesitter** | Syntax highlighting and indentation | Parsers installed: bash, html, css, javascript, typescript, tsx, json, lua, markdown, markdown_inline, python, java, c, cpp, vim, yaml, query, regex. Highlight, indent, and autotag enabled. |
| **toggleterm.nvim** | Terminal management | Horizontal layout, 20 rows, zsh, auto-chdir enabled. Opens with `<C-\>`. Terminal buffers support Ctrl-h/j/k/l for window navigation. |
| **vim-tmux-navigator** | Tmux and nvim split navigation | Ctrl-h/j/k/l navigates between tmux panes and nvim windows. |
| **indent-blankline** | Indentation guides | Scope indicators disabled. Indent chars disabled (blank). Whitespace trail removal disabled. |
| **noice.nvim** | UI message handling | LSP signature auto-open disabled. |
| **csvview.nvim** | CSV file viewer | Excel-like navigation with `<Tab>` (next field), `<S-Tab>` (prev field), `<Enter>` (next row), `<S-Enter>` (prev row). Text objects `if` and `af` for field selection. |
| **comfy-line-numbers** | Line number display | Replaces numeric line numbers with clock-style pattern labels. |

### LaTeX

| Plugin | Description | Configuration |
|---|---|---|
| **vimtex** | LaTeX document editing | Non-lazy loaded. Viewer set to Zathura. |

LaTeX files are auto-formatted with `latexindent` on `BufWritePost`. Conceal level is set to 0 to display raw LaTeX commands.

### Java

| Plugin | Description | Configuration |
|---|---|---|
| **maven.nvim** | Maven build integration | Maven executable at `/usr/bin/mvn`. Commands: `:Maven` (`<leader>mm`), `:MavenExec` (`<leader>me`). |

### Markdown

| Plugin | Description | Configuration |
|---|---|---|
| **markdown-preview.nvim** | Live Markdown preview | Launches in Zen Browser. Toggle with `<leader>cp`. |

### SQL / Database

| Plugin | Description | Configuration |
|---|---|---|
| **vim-dadbod-ui** | Database management UI | Commands: `:DBUI`, `:DBUIToggle`, `:DBUIAddConnection`, `:DBUIFindBuffer`. Nerd Font icons enabled. `<leader>sql` saves the current query. |
| **vim-dadbod-completion** | SQL completion | Omni-function set for sql/mysql/plsql filetypes. |

### Completions

**nvim-cmp** is configured with four sources:
- `nvim_lsp` &rarr; Language server completions
- `luasnip` &rarr; Snippet expansion
- `buffer` &rarr; Buffer word completions
- `path` &rarr; File path completions

Key mappings: `<Tab>` / `<S-Tab>` for selection, `<CR>` to confirm, `<C-Space>` to trigger completion. Ghost text disabled. SQL files use `vim-dadbod-completion` as the primary source.

**blink.cmp** is present in the plugin tree but disabled.

### LSP

| Server | Type | Configuration |
|---|---|---|
| **pyright** | Python | Type checking mode set to `"off"`. Unused variable diagnostics disabled. |

LSP servers for TypeScript, JSON, and TOML are provided through LazyVim extras.

### Colorschemes

| Theme | Status | Details |
|---|---|---|
| **Kanagawa** | Active | Wave variant, transparent background, dimInactive disabled. Terminal colors enabled. Custom highlight overrides for WinSeparator, Snacks picker/explorer borders. |
| **Tokyonight** | Installed (fallback) | Transparent sidebars and floats. |
| **Catppuccin** | Installed (fallback) | Default configuration. |

## Editor Configuration

### Autocommands

- **Auto CWD**: Automatically changes the working directory to the current file's directory on `BufEnter`. Toggle with `:ToggleAutoCwd` or `<leader>t`.
- **LaTeX Formatting**: Runs `latexindent` on `BufWritePost` for `.tex` files.

### Keymaps

| Key | Command | Description |
|---|---|---|
| `<leader>t` | `:ToggleAutoCwd` | Toggle automatic CWD changes |
| `<leader>mm` | `:Maven` | Open Maven menu |
| `<leader>me` | `:MavenExec` | Execute Maven command |
| `<leader>cp` | `:MarkdownPreviewToggle` | Toggle Markdown preview |
| `<leader>sql` | `:DBUI` | Save SQL query |
| `<C-\>` | ToggleTerm | Toggle terminal |
| `<Tab>` | cmp.select_next_item | Next completion item |
| `<S-Tab>` | cmp.select_prev_item | Previous completion item |

## Snippets

### Java (`lua/snippets/java.lua`)

Snippets that automatically derive the package declaration from the file's path relative to `src/main/java/`:

| Trigger | Output |
|---|---|
| `javamain` | Full class with `main()` method and auto-generated package |
| `javaclass` | Public class declaration with package |
| `javaabstract` | Abstract class declaration with package |
| `javainterface` | Interface declaration with package |
| `sop` | `System.out.println()` |

### LaTeX (`lua/snippets/tex.lua`)

| Trigger | Content |
|---|---|
| `doc-article` | `\documentclass[12pt]{article}` |
| `doc-title` | Title, author, date block |
| `doc-begin` | Document environment with `\maketitle` |
| `pkg-geometry` | geometry package (1in margins) |
| `pkg-setspace` | setspace package |
| `pkg-font` | lmodern, fontenc, inputenc |
| `pkg-math` | amsmath, amssymb, amsthm, mathtools |
| `pkg-fig` | graphicx, float |
| `pkg-table` | booktabs, caption, subcaption |
| `pkg-list` | enumitem, parskip |
| `pkg-hyperref` | hyperref (hidelinks) |
| `pkg-biblatex` | biblatex (biber, IEEE style) |
| `pkg-code` | listings, xcolor |
| `pkg-algo` | algorithm, algpseudocode |

## LazyVim Extras

| Extra | Purpose |
|---|---|
| `mini-surround` | Text object surround manipulation |
| `snacks_explorer` | File explorer |
| `snacks_picker` | Fuzzy finder |
| `json` | JSON LSP and Treesitter |
| `markdown` | Markdown LSP and Treesitter |
| `tex` | TeX/LaTeX LSP and Treesitter |
| `toml` | TOML LSP and Treesitter |

