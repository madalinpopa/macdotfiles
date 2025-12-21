return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			chat = {
				adapter = "copilot",
				default = "gpt-5-mini",
			},
			inline = {
				adapter = "copilot",
				-- model = "claude-sonnet-4",
				default = "gpt-4.1",
			},
			-- cmd = {
			-- 	adapter = "copilot",
			-- },
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
