return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "luau_lsp", "omnisharp", "html", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local os_name = vim.loop.os_uname().sysname
			local omnisharp_cmd = ""

			if os_name == "Windows_NT" then
				omnisharp_cmd = "C:\\omnisharp\\omnisharp.exe" -- Path for Windows
			else
				omnisharp_cmd = "/mnt/c/omnisharp-linux-x64/omnisharp/omnisharp.exe" -- Path for Linux
			end
			lspconfig.luau_lsp.setup({})
			lspconfig.omnisharp.setup({
				cmd = {
					omnisharp_cmd,
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				},
				root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
			})
			lspconfig.html.setup({})
			lspconfig.ts_ls.setup({})
		end,
	},
}
