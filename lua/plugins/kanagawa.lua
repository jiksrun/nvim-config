return {
    {
        "https://github.com/rebelot/kanagawa.nvim",
        config = function()
            -- Default options:
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = false,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = false },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    },
                },
                overrides = function(colors) -- add/modify highlights
                    local theme = colors.theme
                    return {
                        -- General window separators
                        WinSeparator = { fg = theme.ui.nontext },

                        -- Snacks picker / explorer borders
                        SnacksPickerBorder    = { fg = theme.ui.nontext, bg = theme.ui.bg },
                        SnacksPickerSeparator = { fg = theme.ui.nontext },
                        SnacksPickerNormal    = { bg = theme.ui.bg },
                        SnacksPickerTitle     = { fg = theme.ui.special, bold = true },

                        -- For Snacks explorer specifically (depends on version)
                        SnacksExplorerBorder = { fg = theme.ui.nontext, bg = theme.ui.bg },
                        SnacksExplorerNormal = { bg = theme.ui.bg },
                    }
                end,
                theme = "wave",              -- Load "wave" theme
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon" !
                    light = "lotus"
                },
            })
        end
    }
}
