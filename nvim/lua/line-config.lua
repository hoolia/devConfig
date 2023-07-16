local function setup()
    require("lualine").setup({
        options = {
            theme = "auto",
            always_divide_middle = false,
            globalstatus = true
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'diagnostics' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        tabline = {},
        extensions = {}
    })
end

return { setup = setup }
