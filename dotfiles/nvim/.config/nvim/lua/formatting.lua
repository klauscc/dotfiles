require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {{formatCommand = "lua-format -i", formatStdin = true}},
            python = {
                {formatCommand = "black --quiet -", formatStdin = true},
                {formatCommand = "isort --quiet -", formatStdin = true}
            },
            markdown = {
                {
                    formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=4",
                    formatStdin = true
                }
            },
            json = {{formatCommand = "jq ."}},
            tex = {{formatCommand = "latexindent.pl", formatStdin = true}}
        }
    }
}
