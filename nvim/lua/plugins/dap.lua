return {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { automatic_setup = true },
      config = require "plugins.configs.mason-nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  event = "User AstroFile",
  dap = {
    plugins = {
      ensure_installed = { "cpptools" },
    },
    adapters = {
      cpptools = {
        type = "executable",
        name = "cpptools",
        args = {},
        attach = {
          pidProperty = "processId",
          pidSelect = "ask",
        },
      },
      configurations = {
        cpp = {
          name = "Attach to file",
          type = "cpptools",
          request = "attach",
          program = "${workspaceFolder}/main",
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          args = {},
          runInTerminal = false,
          miDebuggerPath = "/bin/usr/gdb",
        },
      },
    },
  },
}
