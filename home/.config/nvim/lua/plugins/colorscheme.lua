-- return {
--    "rose-pine/neovim",
--    lazy = false,
--    priority = 50,
--     config = function()
--     -- load the colorscheme here
--     require("rose-pine").setup({
--         variant = "auto",
--         styles = {
--         bold = true,
--         italic = true,
--         transparency = true,
--         },
--     })
--     vim.cmd.colorscheme("rose-pine")
--   end,
-- }

return {
  "bjarneo/ash.nvim",
  priority = 100,
  config = function()

    vim.cmd([[colorscheme ash]])

    -- transparent background
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

  end,
}
