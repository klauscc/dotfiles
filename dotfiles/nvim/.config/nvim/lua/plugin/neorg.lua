require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    gtd = "~/My Drive/norg/gtd",
                    work = "~/My Drive/norg/work",
                    home = "~/My Drive/norg/home"
                }
            }
        },
        ["core.gtd.base"] = {config = {workspace = "gtd"}},
        ["core.norg.completion"] = {config = {engine = "nvim-cmp"}},
        ["core.norg.concealer"] = {config = {icon_preset = "diamond"}},
        ["core.presenter"] = {config = {zen_mode = "zen-mode"}}
    }
}

