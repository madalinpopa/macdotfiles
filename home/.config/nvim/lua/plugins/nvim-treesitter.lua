local config = function()
    require'nvim-treesitter.configs'.setup {
    indent = { enable = true},
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = {
    "c",
    "lua",
    "go",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "python",
    "html",
    "css",
    "javascript",
    "typescript",
    "json",
    "yaml",
    "bash",
    "dockerfile",
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
end

return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    config = config,
    build = ':TSUpdate',
}