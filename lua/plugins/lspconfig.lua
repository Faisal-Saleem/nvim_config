return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls','csharp_ls','html','ts_ls' }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.html.setup({})
            lspconfig.ts_ls.setup({})
            
            vim.keymap.set('n','K',vim.lsp.buf.hover, {})
            vim.keymap.set('n','gD',vim.lsp.buf.declaration, {})
            vim.keymap.set('n','gd',vim.lsp.buf.definition, {})
            vim.keymap.set('n','gi',vim.lsp.buf.implementation, {})
            vim.keymap.set('n','ca',vim.lsp.buf.code_action, {})
        end
    }
}
