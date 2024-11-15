local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
     local lazyrepo = "https://github.com/folke/lazy.nvim.git"
     local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })  
     if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
               { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
               { out, "WarningMsg" },
               { "\nPress any key to exit..." },}, true, {})
          vim.fn.getchar()
          os.exit(1)
     end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
     { 'HiPhish/rainbow-delimiters.nvim' },
     { 'lukas-reineke/lsp-format.nvim' }
}, {})

require("telescope.builtin")
require('lualine').setup()
require('mason').setup()
require('bufferline').setup()
require('lsp-format').setup() 

local telescopeBuiltin = require("telescope.builtin")
local treesitterConfig = require("nvim-treesitter.configs")
local whickKey = require('which-key')

treesitterConfig.setup({
     ensure_installed = { 'lua','javascript','c_sharp','c','html','sql','java','bash','dart','cmake','cpp','css','csv','diff','git_config','git_rebase','gitattributes','gitcommit','gitignore','http','json','json5','make','markdown','markdown_inline','php','powershell','python','regex','sql','tcl','tmux','vim','yaml' },
     highlight = { enable = true },
     indent = { enable = true },
     rainbow = { enable = true }
})

whickKey.add({
     { '<leader>p', desc = 'Git Files' },
     { '<leader>f', desc = 'Find Files' },
     { '<leader>g', desc = 'Grep' },
     { '<leader>e', desc = 'Locate File in Explorer' },
     { '<leader>t', desc = 'Toggle Explorer' },
     { '<Tab>', desc = 'Tab Navigation Next' },
     { '<S-Tab>', desc = 'Tab Navigation Prev' },
     { 'J', desc = 'Move Line Up' },
     { 'K', desc = 'Move Line Down' }
})


vim.cmd("set expandtab")
vim.cmd("set softtabstop=5")
vim.cmd("set shiftwidth=5")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.cmd.colorscheme "solarized"
vim.g.mapleader = " "
vim.o.background = "light"
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.backup = false

vim.keymap.set('n','<leader>p',telescopeBuiltin.git_files, {})
vim.keymap.set('n','<leader>f', telescopeBuiltin.find_files, {})
vim.keymap.set('n','<leader>g', telescopeBuiltin.live_grep, {})
vim.keymap.set('n','<leader>e',':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n','<leader>t',':Neotree toggle<CR>', {})
vim.keymap.set('n','<Tab>',':BufferLineCycleNext<CR>', {})
vim.keymap.set('n','<S-Tab>',':BufferLineCyclePrev<CR>',{})
vim.keymap.set('v','J',":m '>+1<CR>gv=gv")
vim.keymap.set('v','K',":m '<-2<CR>gv=gv")
