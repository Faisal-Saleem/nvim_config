return {  
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
}
