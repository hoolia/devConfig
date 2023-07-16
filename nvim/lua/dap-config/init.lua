local function setup()
    require("dapui").setup()
    local dap = require('dap')

    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }

    dap.configurations.rust = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ',
                    vim.fn.getcwd() .. '/target/debug/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {}
            -- runInTerminal = true
        }
    }

    dap.configurations.c = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ',
                    vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {}
            -- runInTerminal = true
        }
    }

    dap.adapters.node2 = { type = 'executable', command = 'node-debug2-adapter' }
    dap.configurations.javascript = {
        {
            name = 'Launch',
            type = 'node2',
            request = 'launch',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal'
        }, {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process
    }
    }
    dap.configurations.typescript = dap.configurations.javascript

    dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' }
    }

    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = "Launch file",
            program = "${file}",
            pythonPath = '/usr/bin/python'
        }
    }
end

return { setup = setup }
