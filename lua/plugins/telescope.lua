return {  
    {
        'nvim-telescope/telescope.nvim',
        tag='0.1.8',
        dependencies = { 
                'nvim-lua/plenary.nvim' 
        },
        config = function()
            local telescopeBuiltin = require("telescope.builtin")
            vim.keymap.set('n','<leader>p',telescopeBuiltin.git_files, {})
            vim.keymap.set('n','<leader>f', telescopeBuiltin.find_files, {})
            vim.keymap.set('n','<leader>g', telescopeBuiltin.live_grep, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {
                        }
                    }
                }
            })
            require('telescope').load_extension('ui-select')
        end
    }
}
