require('auto-session').setup {
    log_level = 'info',
    auto_session_suppress_dirs = {'~/', '~/Projects'},
    pre_save_cmds = {"NvimTreeClose","SymbolsOutlineClose"},
    pre_restore_cmds = {"NvimTreeOpen"}
}
