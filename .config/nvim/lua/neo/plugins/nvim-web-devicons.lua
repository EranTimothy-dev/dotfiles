return {
    "nvim-tree/nvim-web-devicons",
    priority = 900,
    config = function()
        require("nvim-web-devicons").setup({
            color_icons = true;
            default = true;
            strict = true;
            blend = 0;
            variant = "light|dark";
        })
    end,
}
