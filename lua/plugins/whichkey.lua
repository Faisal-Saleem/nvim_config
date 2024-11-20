return {
	"folke/which-key.nvim",
	config = function()
		local whickKey = require("which-key")
--[[		whickKey.add({
			{ "<leader>tp", desc = "Telescope Git Files" },
			{ "<leader>tf", desc = "Telescope Find Files" },
			{ "<leader>tg", desc = "Telescope Grep" },
			{ "<leader>gp", desc = "Git Preview" },
			{ "<Tab>", desc = "Tab Navigation Next" },
			{ "<S-Tab>", desc = "Tab Navigation Prev" },
			{ "J", desc = "Move Line Up" },
			{ "K", desc = "Move Line Down" },
		})]]--
	end,
}
