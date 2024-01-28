local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      {
        "quangnguyen30192/cmp-nvim-ultisnips",
        config = function()
          require("cmp_nvim_ultisnips").setup({})
        end,
      },
      { "hrsh7th/cmp-omni" },
    },
    config = function()
      local cmp = require("cmp")

      -- require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/snipmate" })
      -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/vscode" }

      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ---@diagnostic disable-next-line: missing-parameter
          -- Abort auto completion
          ["<C-e>"] = cmp.mapping.close(),
          ["<C-c>"] = cmp.mapping({
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
          }),
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              cmp_ultisnips_mappings.jump_forwards(fallback)
            else
              vim.api.nvim_feedkeys(t("<Plug>(Tabout)"), "m", true)
              -- fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              cmp_ultisnips_mappings.jump_backwards(fallback)
            else
              vim.api.nvim_feedkeys(t("<Plug>(TaboutBack)"), "m", true)
              -- fallback()
            end
          end, { "i", "s" }),
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif luasnip.expandable() then
          --     luasnip.expand()
          --   elseif luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif luasnip.jumpable(-1) then
          --     luasnip.jump(-1)
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "ultisnips" },
          { name = "path" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      cmp.setup.filetype({ "md", "tex", "latex" }, {
        sources = cmp.config.sources({
          { name = "emoji" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "ultisnips" },
          {
            name = "omni",
            option = {
              disable_omnifuncs = { "v:lua.vim.lsp.omnifunc" },
            },
          },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
}
