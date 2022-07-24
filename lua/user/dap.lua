require('dap-go').setup()
require('dapui').setup()
require("nvim-dap-virtual-text").setup()

local dap = require('dap')

-- php local settings
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
    port = 9003
  }
}
