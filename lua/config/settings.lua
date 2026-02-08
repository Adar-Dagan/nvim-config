vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.spell = true
vim.opt.list = true

vim.opt.clipboard = "unnamedplus"

-- Better diff settings
vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("indent-heuristic")

vim.filetype.add({
	extension = {
		cl = "opencl",
		ll = "llvm",
	},
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		-- Check if the filetype is 'conf' or empty (indicating not recognized)
		if vim.bo.filetype == "conf" or vim.bo.filetype == "" then
			-- Read the first line of the buffer
			local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

			-- Check if the first line starts with a bash shebang
			if first_line and first_line:match("^#![ \t]*/?usr/(local/)?bin/env[ \t]+bash") then
				vim.bo.filetype = "bash"
			elseif first_line and first_line:match("^#![ \t]*/?bin/bash") then
				vim.bo.filetype = "bash"
			end
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cl", "cpp" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cl", "cpp", "tablegen" },
	callback = function()
		vim.opt_local.commentstring = "// %s"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "llvm" },
	callback = function()
		vim.opt_local.commentstring = "; %s"
	end,
})

-- Disable folding in diff mode
-- Handle multiple scenarios: nvim -d, :diffthis, and window switching
local function disable_diff_folding()
	if vim.wo.diff then
		vim.wo.foldenable = false
	end
end

-- When nvim starts with -d flag
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Check all windows for diff mode
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.wo[win].diff then
				vim.wo[win].foldenable = false
			end
		end
	end,
})

-- When entering a window in diff mode
vim.api.nvim_create_autocmd("WinEnter", {
	callback = disable_diff_folding,
})

-- When diff mode is toggled on/off during session
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "diff",
	callback = disable_diff_folding,
})
