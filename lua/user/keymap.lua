local map = vim.keymap.set
vim.g.mapleader = ','

local builtin = require('telescope.builtin')
map('n', '<leader>o', builtin.find_files, {})
map('n', '<leader>s', builtin.lsp_workspace_symbols, {})
map('n', '<leader>f', builtin.lsp_document_symbols, {})

-- FloaTerm configuration
map('n', "<leader>t", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
map('n', "t", ":FloatermToggle myfloat<CR>")
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")
