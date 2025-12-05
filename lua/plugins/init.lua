vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files({})
		end
	end,
})

return {
	require("plugins.telescope"),
	require("plugins.harpoon"),
	require("plugins.oil"),
	require("plugins.conform"),
	require("plugins.lsp"),
	require("plugins.treesitter"),
	{ "mason-org/mason-lspconfig.nvim", opts = {} },
	{ "mason-org/mason.nvim", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo tree" })
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
