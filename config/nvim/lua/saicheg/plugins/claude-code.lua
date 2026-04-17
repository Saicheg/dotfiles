return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical",
        split_ratio = 0.35,
      },
      keymaps = {
        toggle = {
          normal = "<leader>cc"
        },
      }
    })
  end
}
