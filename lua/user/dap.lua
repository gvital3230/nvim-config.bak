require('dap-go').setup()
require('dapui').setup()
require("nvim-dap-virtual-text").setup()

local dap = require('dap')

-- php
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/vital/.local/share/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
  },
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug (with path mapping)',
    port = 9003,
    pathMappings = {
        ['/var/www/html'] = "${workspaceFolder}",
    },
  }
}


-- lua
dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}


