local function setup(ignored_files)
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {adaptive_size = true},
        update_cwd = true,
        diagnostics = {
            enable = true,
            icons = {hint = "", info = "", warning = "", error = ""}
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = ignored_files
        },
        filters = {dotfiles = true, custom = ignored_files},
        git = {enable = true, ignore = true, timeout = 500},
        trash = {cmd = "rm", require_confirm = false}
    })
end

return {setup = setup}
