return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    local noice = require("noice")
    noice.setup({
      -- add any setup options here
    })
    -- local keymap = vim.keymap
    -- keymap.set("n", "<leader>nm", "<cmd>messages<CR>", { desc = "Show messages" })
    -- keymap.set("n", "<leader>na", "<cmd>NoiceAll<CR>", { desc = "Show All Noice messages" })
    -- keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice message" })
  end,

  -- config = function ()
  --   noice = require("noice")
  --
  --   vim.keymap.set("n", "<leader>nl", function()
  --     noice.cmd("last")
  --   end)
  --
  --   vim.keymap.set("n", "<leader>nh", function()
  --     noice.cmd("history")
  --   end)
  -- end
}
