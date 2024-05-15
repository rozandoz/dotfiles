return {
    "catppuccin/nvim",
    lazy = false,
	priority = 1000,
    config = function()
        require("catppuccin").setup({
            styles = {
                conditionals = {},
            }
        })
        vim.cmd("colorscheme catppuccin-macchiato")
	end
}
