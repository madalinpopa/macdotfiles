return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls", "gopls", "ty", "templ", "tailwindcss" },
    automatic_enable = {
      "lua_ls",
      "gopls",
      "ty",
      "templ",
      "docker_ls",
      "tailwindcss",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}
