return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        local always = {
          [".git"] = true,
          [".jj"] = true,
          ["node_modules"] = true,
          [".DS_Store"] = true,
          ["__pycache__"] = true,
        }
        if always[name] then
          return true
        end
        return false
    end,
    }
  },
   keys = {
      { "<leader>e", mode="n", "<cmd>Oil<cr>", desc = "Toggle Oil" },
    },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
