return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mollerhoj/telescope-recent-files.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("recent-files")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]iles" })
		vim.keymap.set("n", "<leader>pa", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "[P]project [A]ll files" })
		vim.keymap.set("n", "<leader>pl", builtin.live_grep, { desc = "[P]roject [L]ive grep" })
		vim.keymap.set({ "n", "v" }, "<leader>gw", builtin.grep_string, { desc = "[G]rep [W]ord" })
		vim.keymap.set("n", "<leader>po", function()
			require("telescope").extensions["recent-files"].recent_files({})
		end, { desc = "[P]roject [O]ld files" })

		return {
			defaults = {
				layout_config = {
					height = 0.9999,
					width = 0.9999,
					preview_width = 0.47,
				},
			},
		}
	end,
}
