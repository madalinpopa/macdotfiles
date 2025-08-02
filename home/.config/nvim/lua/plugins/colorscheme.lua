return {
   "rose-pine/neovim",
   lazy = false,
   priority = 50,
    config = function()
    -- load the colorscheme here
    require("rose-pine").setup({
        variant = "auto",
        styles = {
        bold = true,
        italic = true,
        transparency = true,
        },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}