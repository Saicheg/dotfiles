return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    lualine.setup {
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      },
    }
  end,
}
