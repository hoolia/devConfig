local function setup(ignored_files)
    require("telescope").setup({
        defaults = {
            prompt_prefix = " ",
            color_devicons = true,
            selection_strategy = "closest",
            file_ignore_patterns = ignored_files,

            mappings = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-h>"] = "which_key"
                }
            }
        }
    })
end

return { setup = setup }
