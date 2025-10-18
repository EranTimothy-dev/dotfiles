return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = { vim.env.VUMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}
