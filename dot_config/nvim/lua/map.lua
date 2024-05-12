vim.keymap.set('n', '<leader>sw', '<cmd>set list!<CR>');

vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>');
vim.keymap.set('n', '<leader>X', '<cmd>bd!<CR>');

vim.keymap.set('n', '<leader>rf', vim.lsp.buf.format);
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename);
vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action);

vim.keymap.set('n', '<C-u', '<C-u>zz');
vim.keymap.set('n', '<C-d', '<C-d>zz');
vim.keymap.set('n', '<ESC>', '<cmd>noh<CR>');
