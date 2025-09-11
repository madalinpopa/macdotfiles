return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	priority = 100,
	config = function()
		require("mini.pick").setup()
		require("mini.extra").setup()
		require("mini.git").setup()
		require("mini.notify").setup({
			-- Content management
			content = {
				format = nil,
				sort = nil,
			},

			-- Notifications about LSP progress
			lsp_progress = {
				enable = true,
				level = "INFO",
				duration_last = 1000,
			},

			-- Window options
			window = {
				config = {
					style = "minimal",
				},
				max_width_share = 0.382,
				winblend = 90, -- adjust for more/less transparency
			},
		})
	end,
	keys = {
		{ "<leader>sf", mode = "n", "<cmd>Pick files<CR>", desc = "Pick files" },
		{ "<leader>sh", mode = "n", "<cmd>Pick help<CR>", desc = "Pick help" },
		{ "<leader>sb", mode = "n", "<cmd>Pick buffers<CR>", desc = "Pick buffers" },
		{ "<leader>sg", mode = "n", "<cmd>Pick grep_live<CR>", desc = "Pick grep_livc" },
		{ "<leader>sc", mode = "n", "<cmd>Pick commands<CR>", desc = "Pick commands" },
		{ "<leader>sd", mode = "n", "<cmd>Pick diagnostic<CR>", desc = "Pick dignostic" },
		{ "<leader>se", mode = "n", "<cmd>Pick explorer<CR>", desc = "Pick explorer" },
	},
}
