local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
local list_binds = {
    {key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")},
    {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
    {key = "v", cb = tree_cb("vsplit")}, {key = "s", cb = tree_cb("split")},
    {key = "t", cb = tree_cb("tabnew")},
    {key = "P", cb = tree_cb("parent_node")},
    {key = "<BS>", cb = tree_cb("close_node")},
    {key = "K", cb = tree_cb("first_sibling")},
    {key = "J", cb = tree_cb("last_sibling")},
    {key = "I", cb = tree_cb("toggle_ignored")},
    {key = "H", cb = tree_cb("toggle_dotfiles")},
    {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")},
    {key = "d", cb = tree_cb("remove")}, {key = "D", cb = tree_cb("trash")},
    {key = "r", cb = tree_cb("rename")}, {key = "x", cb = tree_cb("cut")},
    {key = "c", cb = tree_cb("copy")}, {key = "p", cb = tree_cb("paste")},
    {key = "y", cb = tree_cb("copy_name")},
    {key = "Y", cb = tree_cb("copy_path")},
    {key = "gy", cb = tree_cb("copy_absolute_path")},
    {key = "[c", cb = tree_cb("prev_git_item")},
    {key = "]c", cb = tree_cb("next_git_item")},
    {key = "-", cb = tree_cb("dir_up")},
    {key = "o", cb = tree_cb("system_open")},
    {key = "q", cb = tree_cb("close")}, {key = "?", cb = tree_cb("toggle_help")}
}

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

-- vim.g.nvim_tree_disable_window_picker = 1

require('nvim-tree').setup {
    actions = {open_file = {enable = false}},
    view = {width = 40, auto_resize = false, mappings = {list = list_binds}},
    git = {ignore = false}
}
