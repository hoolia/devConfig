local function setup()
    require("lualine").setup({
        options = {
            theme = "auto",
            always_divide_middle = false,
            globalstatus = true
        },
        sections = {
            lualine_a = { 'mode', 'branch' },
            lualine_b = {},
            lualine_c = { 'iagnostics' },
            lualine_x = { 'selectioncount', 'encoding', 'fileformat', 'filetype' },
            lualine_y = {},
            lualine_z = { 'filesize', 'location', 'progress' }
        },
        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {}
    })
end

return { setup = setup }
