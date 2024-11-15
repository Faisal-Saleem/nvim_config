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

vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set nowrap")

vim.keymap.set('v','J',":m '>+1<CR>gv=gv")
vim.keymap.set('v','K',":m '<-2<CR>gv=gv")

vim.g.mapleader = " "

-- vim.o.background = "light"

vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.backup = false

require('lazy').setup('plugins')

vim.cmd.colorscheme "catppuccin"
