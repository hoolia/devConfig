local function setup()
    local rt = require("rust-tools")
    rt.setup({})
    rt.inlay_hints.enable()
end

return {setup = setup}
