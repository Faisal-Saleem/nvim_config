return { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local treesitterConfig = require("nvim-treesitter.configs")
        treesitterConfig.setup({
            ensure_installed = { 
                'c_sharp',
                'c',
                'bash',
                'dart',
                'cmake',
                'cpp',
                'css',
                'csv',
                'diff',
                'git_config',
                'git_rebase',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'html',
                'http',
                'javascript',
                'java',
                'json',
                'json5',
                'lua',
                'make',
                'markdown',
                'markdown_inline',
                'php',
                'powershell',
                'python',
                'regex',
                'sql',
                'tcl',
                'tmux',
                'vim',
                'yaml'
            },
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true }
        })
    end
}
