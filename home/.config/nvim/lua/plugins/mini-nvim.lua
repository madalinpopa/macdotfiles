return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	priority = 100,
	config = function()
		require("mini.pick").setup({
			window = {
				config = {
					relative = "editor",
					anchor = "NW",
					width = math.floor(vim.o.columns * 0.8),
					height = math.floor(vim.o.lines * 0.8),
					row = math.floor((vim.o.lines - vim.o.lines * 0.8) / 2),
					col = math.floor((vim.o.columns - vim.o.columns * 0.8) / 2),
					style = "minimal",
					border = "rounded",
				},
			},
		})
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
		{ "<leader>f", mode = "n", "<cmd>Pick files<CR>", desc = "Pick files" },
		{ "<leader>h", mode = "n", "<cmd>Pick help<CR>", desc = "Pick help" },
		{ "<leader> ", mode = "n", "<cmd>Pick buffers<CR>", desc = "Pick buffers" },
		{ "<leader>g", mode = "n", "<cmd>Pick grep_live<CR>", desc = "Pick grep_livc" },
		{ "<leader>c", mode = "n", "<cmd>Pick commands<CR>", desc = "Pick commands" },
		{ "<leader>d", mode = "n", "<cmd>Pick diagnostic<CR>", desc = "Pick dignostic" },
		{ "<leader>e", mode = "n", "<cmd>Pick explorer<CR>", desc = "Pick explorer" },
		{ "<leader>l", mode = "n", "<cmd>Pick buf_lines scope='current'<CR>", desc = "Pick buffer lines" },
		{ "<leader>w", mode = "n", "<cmd>Pick lsp scope='workspace_symbol'<CR>", desc = "Pick workspace symbols" },
		{ "<leader>s", mode = "n", "<cmd>Pick lsp scope='document_symbol'<CR>", desc = "Pick document symbols" },
	},
}
