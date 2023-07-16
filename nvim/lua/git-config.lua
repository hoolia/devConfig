local function setup()
    require("gitsigns").setup({
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 500,
            ignore_whitespace = false
        }
    })
end

return { setup = setup }
