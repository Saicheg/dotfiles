return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      top_down = false,
      level = 3,
    })
  end,
}
