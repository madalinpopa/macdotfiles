return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			-- Change the default chat adapter and model
			chat = {
				adapter = "gemini_cli",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>a", mode = "n", "<cmd>CodeCompanionActions<cr>", desc = "Toggle CodeCompanionActions" },
	},
}
