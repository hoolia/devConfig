local function setup()
    local dap = require("dap")

    dap.adapters.codelldb = {
        type = 'server',
        port = "10000",
        executable = {
            -- CHANGE THIS to your path!
            command = '/home/flagmate/.local/share/nvim/mason/bin/codelldb',
            args = { "--port", "10000" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        }
    }

    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = '/home/flagmate/.local/share/nvim/mason/bin/OpenDebugAD7',
    }

    dap.configurations.c = {
        {
            name = "cpptools Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        },
        {
            name = "codelldb Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    }

    dap.configurations.cpp = dap.configurations.c
    dap.configurations.rust = {
        {
            name = "cpptools Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        },
    }
end

return { setup = setup }
