return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'debugloop/telescope-undo.nvim',
    },
    config = function()

        require("telescope").setup({
            -- extensions = {
            --     undo = {
            --         side_by_side = true,
            --         layout_strategy = "vertical",
            --         layout_config = {
            --             preview_height = 0.8,
            --         },
            --     },
            -- },
        })

        require('telescope').load_extension("ui-select")
        require('telescope').load_extension("undo")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fa', builtin.live_grep)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fm', builtin.treesitter)

        vim.keymap.set("n", "<leader>fz", "<cmd>Telescope undo<cr>")

    end
}
