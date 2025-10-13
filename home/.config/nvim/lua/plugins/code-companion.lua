return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			chat = {
				adapter = "gemini_cli",
			},
			inline = {
				adapter = "gemini_cli",
			},
			cmd = {
				adapter = "gemini",
			},
		},
		adapters = {
			acp = {
				gemini_cli = function()
					return require("codecompanion.adapters").extend("gemini_cli", {
						-- commands = {
						-- 	default = { "gemini", "--experimental-acp" },
						-- },
						defaults = {
							auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
						},
						env = {
							GOOGLE_CLOUD_PROJECT = "cmd:op read op://Development/gemini/project --no-newline",
						},
					})
				end,
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<C-s>", mode = { "n", "v" }, "<cmd>CodeCompanionActions<cr>", desc = "Toggle CodeCompanionActions" },
	},
}
