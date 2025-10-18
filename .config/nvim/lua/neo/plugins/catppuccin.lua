return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- priority = 1000,  -- Load before everything else (so it’s applied first)
  enabled = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
      integrations = {
        treesitter = true,
        telescope = true,
        which_key = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    -- set the colorscheme *after* setup
    -- vim.cmd.colorscheme "catppuccin-mocha"
  end,
}
