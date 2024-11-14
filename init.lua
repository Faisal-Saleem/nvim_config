vim.cmd("set expandtab")
vim.cmd("set tabstop=5")
vim.cmd("set softtabstop=5")
vim.cmd("set shiftwidth=5")
vim.cmd("set number")
vim.cmd("set nowrap")

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
     local lazyrepo = "https://github.com/folke/lazy.nvim.git"
     local out = vim.fn.system({ 
          "git", 
          "clone", 
          "--filter=blob:none", 
          "--branch=stable", 
          lazyrepo, 
          lazypath 
     })  
     if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
               { 
                    "Failed to clone lazy.nvim:\n", 
                    "ErrorMsg" 
               },
               { 
                    out, 
                    "WarningMsg"
               },
               { 
                    "\nPress any key to exit..." 
               },
    
          }, 
          true, 
          {}
          )
          vim.fn.getchar()
          os.exit(1)
     end
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
     { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
     { 'sainnhe/gruvbox-material', lazy = false },
     { 'sainnhe/everforest', lazy = false },
     { 'projekt0n/github-nvim-theme', name = 'github-theme' }, 
     { 'maxmx03/solarized.nvim', lazy = false },
     { 'nvim-telescope/telescope.nvim', tag='0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
     { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
     { 'nvim-neo-tree/neo-tree.nvim', branch = "v3.x", dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' }},
     { 'nvim-lualine/lualine.nvim',dependencies = { 'nvim-tree/nvim-web-devicons' }},
     { 'kristijanhusak/vim-dadbod-ui',dependencies = {{ "tpope/vim-dadbod", lazy = true }, { 'kristijanhusak/vim-dadbod-completion',ft = { "sql","mysql","plsql" },lazy = true }}},
     { 'williamboman/mason.nvim' },
     { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
     { 'sindrets/diffview.nvim' },
     { 'folke/which-key.nvim' },
     { 'echasnovski/mini.nvim', version = '*' },
     { 'vhyrro/luarocks.nvim', priority = 1000, config = true },
     { 'HiPhish/rainbow-delimiters.nvim' }
}

require("lazy").setup(plugins, {})

local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-f>', builtin.find_files, {})
vim.keymap.set('n','<C-g>', builtin.live_grep, {})
vim.keymap.set('n','<C-e>',':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n','<C-t>',':Neotree toggle<CR>', {})
vim.keymap.set('n','<S-Tab>',':BufferLineCyclePrev<CR>',{})
vim.keymap.set('n','<Tab>',':BufferLineCycleNext<CR>', {})

local config = require("nvim-treesitter.configs")
config.setup({
     ensure_installed = {
          "lua",
          "javascript",
          "c_sharp",
          "c",
          "html",
          "sql",
          "java",
          "bash",
          "dart",
          "cmake",
          "cpp",
          "css",
          "csv",
          "diff",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "http",
          "json",
          "json5",
          "make",
          "markdown",
          "markdown_inline",
          "php",
          "powershell",
          "python",
          "regex",
          "sql",
          "tcl",
          "tmux",
          "vim",
          "yaml"
     },
     highlight = {
          enable = true
     },
     indent = {
          enable = true
     },
     rainbow = {
          enable = true
     }
})

require("lualine").setup()
require("mason").setup()
require("bufferline").setup()
-- Avaliable Color Schemes
-- 1. catppuccin
-- 2. gruvbox-material
-- 3. everforest
-- 4. github-theme
-- 5. solarized *

vim.cmd.colorscheme "solarized"
vim.o.background = "light"
vim.opt.termguicolors = true
vim.opt.laststatus = 3
