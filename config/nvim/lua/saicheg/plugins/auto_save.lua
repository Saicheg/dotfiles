return {
  'Pocco81/auto-save.nvim',
  config = function()
    require("auto-save").setup({
      execution_message = {
        message = function()
         return (vim.fn.expand('%:p'))
        end,
        dim = 0,
        cleaning_interval = 10000,
      },
    })
  end,
}
