return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		options = {
			colorblind = {
				enable = true, -- Enable colorblind support
				simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
				severity = {
					protan = 0.8, -- Severity [0,1] for protan (red)
					deutan = 0.4, -- Severity [0,1] for deutan (green)
					tritan = 0, -- Severity [0,1] for tritan (blue)
				},
			},
		},
	},
	config = function(_, opts)
		require("nightfox").setup(opts)
		vim.cmd([[colorscheme nightfox]])
	end,
}
