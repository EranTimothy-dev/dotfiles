return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimlua/plenary.nvim" },
    config = function()
        require("null-ls").setup({
            
        })
    end,
}
