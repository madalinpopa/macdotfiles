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

-- return {
--   "bjarneo/ash.nvim",
--   priority = 100,
--   config = function()
--
--     vim.cmd([[colorscheme ash]])
--
--     -- transparent background
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--
--   end,
-- }

-- return {
--       'sainnhe/everforest',
--       lazy = false,
--       priority = 1000,
--       config = function()
--         -- Optionally configure and load the colorscheme
--         -- directly inside the plugin declaration.
--         vim.g.everforest_enable_italic = true
--         vim.cmd.colorscheme('everforest')
--
--     -- transparent background
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--       end
-- }

return {
	"vague-theme/vague.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		require("vague").setup({
			transparent = true,
		})
		vim.cmd("colorscheme vague")

		-- transparent background
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
	end,
}
