return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			auto_trigger = false,
			keymap = {
				accept = "<C-s>",
			},
		},
	},
}
