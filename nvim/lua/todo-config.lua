-- FIX: add a new task
-- DONE: add a new task
-- TODO: add a new task
-- WARN: add a new task
-- PERF: add a new task
local function setup()
    local alts = {
        FIX = {"FIXME", "BUG", "FIXIT", "ISSUE", "ERROR"},
        DONE = {"DONE", "DONE!", "DONE.", "FIXED", "WONTFIX"},
        TODO = {"PLAN"},
        WARN = {"WARNING", "XXX"}
    }

    require("todo-comments").setup({
        signs = true, -- show icons in the signs column
        sign_priority = 0, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
            FIX = {icon = "", color = "error", alt = alts.FIX},
            DONE = {icon = "", color = "hint", alt = alts.DONE},
            TODO = {icon = "", color = "info", alt = alts.TODO},
            WARN = {icon = "", color = "warning", alt = alts.WARN}
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        highlight = {
            before = "fg", -- "fg" or "bg" or empty
            keyword = "bg", -- "fg", "bg", "wide" or empty.
            after = "fg", -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = true, -- uses treesitter to match keywords in comments only
            max_line_len = 400 -- ignore lines longer than this
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

return {setup = setup}
