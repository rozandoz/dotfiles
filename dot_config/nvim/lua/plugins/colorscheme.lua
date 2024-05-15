return {
    "catppuccin/nvim",
    lazy = false,
	priority = 1000,
    config = function()
        require("catppuccin").setup({
            no_italic = true,
        })
        vim.cmd("colorscheme catppuccin-macchiato")
	end
}
