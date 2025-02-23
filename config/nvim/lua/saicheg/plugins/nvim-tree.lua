return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 35,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false
          },
        },
      },
      filters = {
        custom = { ".DS_Store", "__pycache__", ".pytest_cache", ".venv", ".git" },
        exclude = { ".github", ".gitignore", ".gitmodules", ".gitattributes" },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
  end,
}
