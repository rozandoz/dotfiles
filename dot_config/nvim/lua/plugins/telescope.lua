return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require("telescope").setup({})
        require('telescope').load_extension("ui-select")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fa', builtin.live_grep)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fm', builtin.treesitter)
    end
}
