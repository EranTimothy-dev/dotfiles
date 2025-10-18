return {
    require('spring_boot').init_lsp_commands(),
    vim.lsp.config["jdlts"] = {
        init_options = {
            bundles = require("spring_boot").java_extensions(),
        },
    },
    vim.lsp.enable("jdlts"),
}
