return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP source
      "hrsh7th/cmp-buffer",        -- Buffer words
      "hrsh7th/cmp-path",          -- Filesystem paths
      "L3MON4D3/LuaSnip",          -- Snippet engine
      "saadparwaiz1/cmp_luasnip",  -- Snippet completions
      "onsails/lspkind.nvim",
      -- "rafamadriz/friendly-snippets", -- Useful preset snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local handlers = require("nvim-autopairs.completion.handlers")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- Load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lua" },
        }),
        formatting = {
            format = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "....",
            }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = true, -- Preview inline completion
        },
        vim.cmd([[
            set completeopt=menuone,noinsert,noselect
            highlight! default link CmpItemKind CmpItemMenuDefault
        ]])
      })

        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done({
            filetypes = {
              -- "*" is a alias to all filetypes
              ["*"] = {
                ["("] = {
                  kind = {
                    cmp.lsp.CompletionItemKind.Function,
                    cmp.lsp.CompletionItemKind.Method,
                  },
                  handler = handlers["*"]
                }
              },
              lua = {
                ["("] = {
                  kind = {
                    cmp.lsp.CompletionItemKind.Function,
                    cmp.lsp.CompletionItemKind.Method
                  },
                  ---@param char string
                  ---@param item table item completion
                  ---@param bufnr number buffer number
                  ---@param rules table
                  ---@param commit_character table<string>
                  handler = function(char, item, bufnr, rules, commit_character)
                    -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
                  end
                }
              },
              -- Disable for tex
              tex = false
            }
          })
        )
    end,
  },
}
