return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()

        require('telescope').load_extension("ui-select")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fa', builtin.live_grep)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fm', builtin.treesitter)
        vim.keymap.set('n', 'gd', builtin.lsp_definitions)
        vim.keymap.set('n', 'gi', builtin.lsp_implementations)
        vim.keymap.set('n', 'gr', builtin.lsp_references)
    end
}
