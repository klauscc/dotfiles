-- function _G.check_back_space()
--   local col = vim.fn.col(".") - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
-- end

function _G.show_docs()
  local cw = vim.fn.expand("<cword>")
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command("h " .. cw)
  elseif vim.bo.filetype == "tex" then
    return
  elseif vim.api.nvim_eval("coc#rpc#ready()") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

return {
  {
    "klauscc/vim-snippets",
    dependencies = { "neoclide/coc.nvim" },
    init = function()
      vim.g.ultisnips_python_style = "google"
      -- vim.g.coc_snippet_next = "<tab>"
      -- vim.g.coc_snippet_prev = "<s-tab>"
    end,
  },
  {
    "SirVer/ultisnips",
    dependencies = { "klauscc/vim-snippets" },
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<c-cr>"
      vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
    end,
  },
  {
    "neoclide/coc.nvim",
    dependencies = { "altermo/ultimate-autopair.nvim", "SirVer/ultisnips" },
    branch = "release",
    lazy = false,
    keys = {
      { "[e", "<Plug>(coc-diagnostic-prev)", desc = "Prev Diagnostic" },
      { "]e", "<Plug>(coc-diagnostic-next)", desc = "Next Diagnostic" },
    },
    config = function()
      vim.g.coc_global_extensions = { "coc-json", "coc-pyright", "coc-ltex", "coc-vimtex", "coc-sh", "coc-ultisnips" }
      local keyset = vim.keymap.set

      function Smart_Tab()
        local check_back_space = function()
          local col = vim.api.nvim_win_get_cursor(0)[2]
          return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
        end

        local function t(str)
          return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        if vim.fn["coc#pum#visible"]() ~= 0 then
          return vim.fn["coc#pum#next"](1)
        elseif check_back_space() then
          return t("<Tab>")
        end
        return vim.fn["coc#refresh"]()
        -- return '<Plug>(Tabout)'
      end

      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

      vim.keymap.set("i", "<tab>", "v:lua.Smart_Tab()", opts)
      -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      keyset("i", "<cr>", [[coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"]], opts)
      -- keyset("i", "<CR>", function()
      --   if vim.fn["coc#pum#visible"]() == 1 then
      --     return vim.fn["coc#_select_confirm"]()
      --   end
      --   return "<c-g>u<cr>"
      -- end, { silent = true, expr = true })

      keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
      -- keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
      -- keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
      keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
      keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      -- keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
      -- keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
      keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})

      -- vim.api.nvim_create_autocmd("CursorHold", {
      --   group = "CocGroup",
      --   command = "silent call CocActionAsync('highlight')",
      --   desc = "Highlight symbol under cursor on CursorHold",
      -- })

      -- Symbol renaming
      keyset("n", "<leader>cr", "<Plug>(coc-rename)", { silent = true })
      -- Update signature help on jump placeholder
      vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder",
      })
      -- Apply codeAction to the selected region
      -- Example: `<leader>aap` for current paragraph
      local opts = { silent = true, nowait = true }
      keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
      keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

      -- Remap keys for apply code actions at the cursor position.
      keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
      -- Remap keys for apply source code actions for current file.
      keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
      -- Apply the most preferred quickfix action on the current line.
      keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

      -- Remap keys for apply refactor code actions.
      keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
      keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
      keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

      -- Run the Code Lens actions on the current line
      keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

      -- Remap <C-f> and <C-b> to scroll float windows/popups
      ---@diagnostic disable-next-line: redefined-local
      local opts = { silent = true, nowait = true, expr = true }
      keyset("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"', opts)
      keyset("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"', opts)
      keyset("i", "<C-j>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
      keyset("i", "<C-k>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
      keyset("v", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"', opts)
      keyset("v", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"', opts)

      -- Use CTRL-S for selections ranges
      -- Requires 'textDocument/selectionRange' support of language server
      -- keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
      -- keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
    end,
  },
}
