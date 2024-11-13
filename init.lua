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
     {
          "catppuccin/nvim",
          name = "catppuccin",
          priority = 1000
     },
     {
          "sainnhe/gruvbox-material",
          lazy = false
     },
     {
          "sainnhe/everforest",
          lazy = false
     },
     {
          "projekt0n/github-nvim-theme",
          name = "github-theme"
     },
	{
          "nvim-telescope/telescope.nvim",
          tag="0.1.8",
          dependencies = {
               "nvim-lua/plenary.nvim"
          }
     },
     {
          "nvim-treesitter/nvim-treesitter", 
          build = ":TSUpdate"
     },
     {
          "nvim-neo-tree/neo-tree.nvim",
          branch = "v3.x",
          dependencies = { 
               "nvim-lua/plenary.nvim",
               "nvim-tree/nvim-web-devicons", 
               "MunifTanjim/nui.nvim"
          }
     },
     {
          "nvim-lualine/lualine.nvim",
          dependencies = { 
               "nvim-tree/nvim-web-devicons" 
          }
     },
     {
          "williamboman/mason.nvim"
     }
}

local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-f>', builtin.find_files, {})
vim.keymap.set('n','<C-g>', builtin.live_grep, {})
vim.keymap.set('n','<C-e>',':Neotree filesystem reveal left<CR>', {})

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
     }
})

require("lualine").setup({
     options = {
          theme = 'dracula'
     }
})

require("mason").setup()

-- Avaliable Color Schemes
-- 1. catppuccin
-- 2. gruvbox-material
-- 3. everforest
-- 4. github-theme

vim.cmd.colorscheme "catppuccin"
--vim.o.background = "light"
--require("catppuccin").setup()
--vim.g.gruvbox_material_background = "hard"
--vim.cmd("colorscheme gruvbox-material")