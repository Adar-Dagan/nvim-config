return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ lsp_format = "never" }, function(err, did_edit)
					if err then
						print("Error: " .. err)
					else
						print("Formatted: " .. (did_edit and "yes" or "no"))
					end

					local mode = vim.api.nvim_get_mode().mode
					if vim.startswith(string.lower(mode), "v") then
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "[F]ormat",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "black" },
			json = { "clang-format" },
			opencl = { "clang-format" },
			zig = { "zigfmt" },
			rust = { "rustfmt" },
			markdown = { "prettier" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--prose-wrap", "always" },
			},
		},
	},
}
