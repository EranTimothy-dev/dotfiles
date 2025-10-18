return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
              ui = { 
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        -- config = function()
        --     require("mason-lspconfig").setup({
        --       ensure_installed = {
        --           "lua_ls",
        --           "clangd",
        --           "eslint",
        --           "pyright"
        --       },
        --     })
        -- end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("neo.lsp")
        end,
    },
    {
        "nvim-java/nvim-java",
        dependencies = {
          "neovim/nvim-lspconfig",
          "mfussenegger/nvim-dap",
          "nvim-java/lua-async",
          "nvim-java/nvim-java-core",
          "nvim-java/nvim-java-test",
          "nvim-java/nvim-java-refactor",
          "nvim-java/nvim-java-dap",
        }
    },
    {
        "javaHello/spring-boot.nvim",
        ft = {"java", "yaml", "jproperties"},
        dependencies = {
            "nvim-java/nvim-java",
            "nvim-telescope/telescope.nvim",
        },
        opts = {},
        config = function()
            require("java").setup();
        end,
    },
}
