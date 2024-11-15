return { 
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim' 
    },
    config = function()
        require('neo-tree').setup({
            window = {
                auto_expand_width = false,
                width = 30
            }
        })
        vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>', {})
        vim.keymap.set('n', '<C-r>', ':Neotree filesystem reveal left<CR>', {})
    end
}
