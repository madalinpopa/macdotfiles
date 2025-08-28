return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	priority = 100,
	config = function()
		require("mini.pick").setup()
		require("mini.extra").setup()
		require("mini.git").setup()
		require("mini.notify").setup()
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
