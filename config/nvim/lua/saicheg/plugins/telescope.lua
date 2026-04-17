return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "smilovanovic/telescope-search-dir-picker.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")


    -- from https://github.com/ThePrimeagen/harpoon/discussions/592
    -- local harpoon_add_mark = function(prompt_bufnr)
    --   local entry = require("telescope.actions.state").get_selected_entry()
    --   local list = require("harpoon"):list()
    --   local harpoon_config = list.config
    --   local item = harpoon_config.create_list_item(harpoon_config, entry[1])
    --   list:add(item)
    -- end

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ["<C-r>"] = harpoon_add_mark,
          },
          -- n = {
          --   ["<C-r>"] = harpoon_add_mark,
          -- },
        },

        -- layout_strategy = 'vertical',
        layout_config = {
          height = 0.95,
          width = 0.95,
        },

        -- Format path as "file.txt (path\to\file\)"
        -- path_display = function(opts, path)
        --   local tail = require("telescope.utils").path_tail(path)
        --   return string.format("%s (%s)", tail, path), { { { 2, #tail }, "Constant" } }
        -- end,

        -- Defines the command that will be used for `live_grep` and `grep_string` pickers.
        -- https://github.com/Conni2461/telescope.nvim/blob/047c4d5751b0cf4eb5b92457b06a149a8a339d43/doc/telescope.txt#L213-L231
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          -- "--no-ignore",     -- Don't respect .gitignore
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },
      },

      pickers = {
        find_files = {
          hidden = true,
          -- needed to exclude some files & dirs from general search
          -- when not included or specified in .gitignore
          find_command = {
            "rg",
            "--files",
            "--hidden",
            -- "--no-ignore",
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
          },
        },
        -- grep_string = {
        --   additional_args = {"--hidden"}
        -- },
        -- live_grep = {
        --   additional_args = {"--hidden"}
        -- },
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("egrepify")
    telescope.load_extension("undo")
    telescope.load_extension("noice")
    telescope.load_extension("search_dir_picker")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fd", "<cmd>Telescope search_dir_picker<cr>", { desc = "Fuzzy find files in folder" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    -- keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Lists current changes per file with diff preview and add action." })
    -- keymap.set("n", "<leader>ft", "<cmd>Telescope git_stash<cr>", { desc = "Lists git branches" })
    -- Lists all branches with log preview,
    --   checkout action <cr>,
    --   track action <C-t>,
    --   rebase action<C-r>,
    --   create action <C-a>,
    --   switch action <C-s>,
    --   delete action <C-d>
    --   and merge action <C-y>
    -- keymap.set("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", { desc = "Lists git branches" })
    -- keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })
    -- keymap.set("n", "<leader>fn", "<cmd>Telescope noice<cr>", { desc = "Telescope noice" })
  end,
}
