return {
    "xiyaowong/nvim-transparent",
    lazy = false,
    dependencies = {"catppuccin/nvim"},
    priority = 900,
    config = function()
        require("transparent").setup({
            enable = true,
            extra_groups = {
                "NormalFloat", -- for floating windows
                "NvimTreeNormal",

                -- Core UI elements
                "Normal", "NormalNC", "FloatBorder", "SignColumn",
                "EndOfBuffer", "MsgArea", "CursorLine", "StatusLine", "StatusLineNC",
                "WinBar", "WinBarNC",

                -- Telescope
                "TelescopeNormal", "TelescopeBorder",
                "TelescopePromptNormal", "TelescopePromptBorder",
                "TelescopeResultsNormal", "TelescopeResultsBorder",
                "TelescopePreviewNormal", "TelescopePreviewBorder",

                -- Neo-tree
                "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeFloatNormal", "NeoTreeFloatBorder",

                -- LSP/UI plugins
                "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",
            },
            exclude = {},
        })
        -- Ensure transparency is applied immediately
        -- require("transparent").enable()
    end,

    keys = {
        { "<leader>up", "<Cmd>TransparentToggle<CR>", desc= "Toggle Transparent" },
    },
}
