return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    require('hlchunk').setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#4b7d65" },
          { fg = "#c21f30" },
        },
        duration = 40,
        delay = 200,
      },
    })
  end
}
