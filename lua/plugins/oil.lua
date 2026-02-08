return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "<leader>pv", "<cmd>Oil<cr>", desc = "Open [P]roject [V]iew" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
}
