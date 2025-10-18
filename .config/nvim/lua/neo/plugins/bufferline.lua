 return {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    enabled = false,
    config = function()
        require("bufferline").setup({
            options = {
                custom_filter = nil,
                mappings = false,
                -- Only show filename, not full path
                name_formatter = function(buf)
                    return vim.fn.fnamemodify(buf.name, ":t") -- ":t" gives filename only
                end,

                -- Diagnostic from LSP
                diagnostic = "nvim-lsp",

                -- Show indicator for errors
                diagnostic_indicator = function(count, level, _, _)
                    if level == "error" then
                        return " " .. count -- error icon
                    elseif level == "warning" then
                        return " " .. count -- warning icon
                    end
                    return ""
                end,

                -- Optional styling
                show_buffer_close_icons = true,
                show_close_icon = false,
                show_buffer_icons = true,
                enforce_regular_tabs = false,
                separator_style = "slant",
            },
            highlights = {
            -- You can add custom highlight if needed
            buffer_selected = {
              gui = "bold",
              fg = "#ffffff",
              bg = "#3b4261",
            },
          },
        })
    end,
}
