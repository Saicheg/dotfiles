return {
  'zbirenbaum/copilot.lua',
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
        },
      },
      copilot_node_command = '/Users/saicheg/.nvm/versions/node/v20.17.0/bin/node'
    })
  end,
}
