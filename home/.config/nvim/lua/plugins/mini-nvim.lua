
return {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    priority = 100,
    config = function()
      require("mini.pick").setup()
      require("mini.extra").setup()
    end,
    keys = {
        { "<leader>sf", mode="n", "<cmd>Pick files<CR>", desc = "Pick files" },
        { "<leader>sh", mode="n", "<cmd>Pick help<CR>", desc = "Pick help" },
        { "<leader>sb", mode="n", "<cmd>Pick buffers<CR>", desc = "Pick buffers" },
        { "<leader>sg", mode="n", "<cmd>Pick grep_live<CR>", desc = "Pick grep_live" },
    }
}
