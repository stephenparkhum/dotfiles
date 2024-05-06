-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "build",
      "coverage",
      "public"
    },
    prompt_prefix = "$ ",
    mappings = {
      i = {
        ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension("fzf")
require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")

local map = vim.keymap

-- == TELESCOPE NAV == --
map.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
map.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
map.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
map.set("n", "<leader>cf", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>")
map.set("n", "<leader>sg", function()
  vim.ui.input({ prompt = "Grep > " }, function(input)
    if input ~= nil then
      builtin.grep_string({ search = input })
    end
  end)
end)
map.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
map.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>")
map.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })


local mappings = {}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({ height = 10, previewer = false })
  builtin.current_buffer_fuzzy_find(opt)
end
return mappings
