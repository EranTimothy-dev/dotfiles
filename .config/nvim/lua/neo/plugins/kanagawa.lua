return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            transparent = true,
            terminalColors = true,
            theme = "wave",
            background = {
                dark = "dragon",
                light = "wave",
            },
            overrides = function(colors)
            local theme = colors.theme
            return {
              CursorLine = { bg = theme.ui.bg_p2 },
              -- Visual = { bg = theme.syn.constant, fg = theme.ui.bg, bold = true },
              Search = { bg = theme.syn.identifier, fg = theme.ui.bg, bold = true },
              IncSearch = { bg = theme.syn.special1, fg = theme.ui.bg, bold = true },
              MatchParen = { fg = theme.syn.keyword, bold = true },
            }
          end
        })

        vim.cmd.colorscheme "kanagawa-wave"
    end,

}
