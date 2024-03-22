local function setup()
    local alts = {
        FIX = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" },
        DONE = { "DONE", "DONE!", "DONE.", "FIXED", "WONTFIX" },
        TODO = { "PLAN", "TODO", "TASK", "START", "BEGIN" },
        WARN = { "WARNING", "WARN", "HACK" },
        PREF = { "PERF", "OPTIM", "OPTIMIZE", "PERFORMANCE" }
    }

    require("todo-comments").setup({
        signs = true,
        sign_priority = 0,
        keywords = {
            FIX = { icon = "", color = "error", alt = alts.FIX },
            DONE = { icon = "", color = "hint", alt = alts.DONE },
            TODO = { icon = "", color = "info", alt = alts.TODO },
            WARN = { icon = "", color = "warning", alt = alts.WARN },
            PREF = { icon = "", alt = alts.PREF }
        },
        merge_keywords = true,
        highlight = {
            before = "fg",
            keyword = "bg",
            after = "fg",
            pattern = [[.*<(KEYWORDS)\s*:]],
            comments_only = true,
            max_line_len = 400
        },
        search = {
            command = "rg",
            args = {
                "--color=never", "--no-heading", "--with-filename",
                "--line-number", "--column"
            },
            pattern = [[\b(KEYWORDS):]] -- ripgrep regex
        }
    })
end

return { setup = setup }
