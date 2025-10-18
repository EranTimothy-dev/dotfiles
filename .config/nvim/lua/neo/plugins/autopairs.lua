return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    configs = function()
        require("nvim-autopairs").setup({
            disable_filetype = {"TelescopePrompt", "vim" },
        })
    end,
}
