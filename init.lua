local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

--vim.cmd("set expandtab")
--vim.cmd("set softtabstop=4")
--vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set nowrap")

vim.g.mapleader = " "

-- vim.o.background = "light"

vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.backup = false

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin")

local telescopeBuiltin = require("telescope.builtin")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move selection up'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection down' }) 
vim.keymap.set("n", "<leader>tp", telescopeBuiltin.git_files, { desc = "Find git files" })
vim.keymap.set("n", "<leader>tf", telescopeBuiltin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>tg", telescopeBuiltin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "Knowledge base" })
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Method declaration" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Method definition" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Method implementation" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Move to previous tab" })
vim.keymap.set("n", "<C-X>", ":bd<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { desc = "Toggle explorer" })
vim.keymap.set("n", "<C-r>", ":Neotree filesystem reveal left<CR>", { desc = "Reveal file in explorer" })
