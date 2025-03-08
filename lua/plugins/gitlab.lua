return {
	"harrisoncramer/gitlab.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	build = function()
		require("gitlab.server").build(true)
	end, -- Builds the Go binary
	opts = function()
        local gitlab = require("gitlab")
        vim.keymap.set("n", "<leader>glr", function() gitlab.choose_merge_request({}) end, { desc = "[A]ppend to Harpoon" })

		return {
			keymaps = {
				disable_all = true, -- Disable all mappings created by the plugin
				-- help = "g?", -- Open a help popup for local keymaps when a relevant view is focused (popup, discussion panel, etc)
				-- global = {
				-- 	disable_all = false, -- Disable all global mappings created by the plugin
				-- 	add_assignee = "glaa",
				-- 	delete_assignee = "glad",
				-- 	add_label = "glla",
				-- 	delete_label = "glld",
				-- 	add_reviewer = "glra",
				-- 	delete_reviewer = "glrd",
				-- 	approve = "glA", -- Approve MR
				-- 	revoke = "glR", -- Revoke MR approval
				-- 	merge = "glM", -- Merge the feature branch to the target branch and close MR
				-- 	create_mr = "glC", -- Create a new MR for currently checked-out feature branch
				-- 	choose_merge_request = "glc", -- Chose MR for review (if necessary check out the feature branch)
				-- 	start_review = "glS", -- Start review for the currently checked-out branch
				-- 	summary = "gls", -- Show the editable summary of the MR
				-- 	copy_mr_url = "glu", -- Copy the URL of the MR to the system clipboard
				-- 	open_in_browser = "glo", -- Openthe URL of the MR in the default Internet browser
				-- 	create_note = "gln", -- Create a note (comment not linked to a specific line)
				-- 	pipeline = "glp", -- Show the pipeline status
				-- 	toggle_discussions = "gld", -- Toggle the discussions window
				-- 	toggle_draft_mode = "glD", -- Toggle between draft mode (comments posted as drafts) and live mode (comments are posted immediately)
				-- 	publish_all_drafts = "glP", -- Publish all draft comments/notes
				-- },
				-- popup = {
				-- 	disable_all = false, -- Disable all default mappings for the popup windows (comments, summary, MR creation, etc.)
				-- 	next_field = "<Tab>", -- Cycle to the next field. Accepts |count|.
				-- 	prev_field = "<S-Tab>", -- Cycle to the previous field. Accepts |count|.
				-- 	perform_action = "ZZ", -- Once in normal mode, does action (like saving comment or applying description edit, etc)
				-- 	perform_linewise_action = "ZA", -- Once in normal mode, does the linewise action (see logs for this job, etc)
				-- 	discard_changes = "ZQ", -- Quit the popup discarding changes, the popup content is not saved to the `temp_registers` (see `:h gitlab.nvim.temp-registers`)
				-- },
				-- discussion_tree = {
				-- 	disable_all = false, -- Disable all default mappings for the discussion tree window
				-- 	add_emoji = "Ea", -- Add an emoji to the note/comment
				-- 	delete_emoji = "Ed", -- Remove an emoji from a note/comment
				-- 	delete_comment = "dd", -- Delete comment
				-- 	edit_comment = "e", -- Edit comment
				-- 	reply = "r", -- Reply to comment
				-- 	toggle_resolved = "-", -- Toggle the resolved status of the whole discussion
				-- 	jump_to_file = "o", -- Jump to comment location in file
				-- 	jump_to_reviewer = "a", -- Jump to the comment location in the reviewer window
				-- 	open_in_browser = "b", -- Jump to the URL of the current note/discussion
				-- 	copy_node_url = "u", -- Copy the URL of the current node to clipboard
				-- 	switch_view = "c", -- Toggle between the notes and discussions views
				-- 	toggle_tree_type = "i", -- Toggle type of discussion tree - "simple", or "by_file_name"
				-- 	publish_draft = "P", -- Publish the currently focused note/comment
				-- 	toggle_draft_mode = "D", -- Toggle between draft mode (comments posted as drafts) and live mode (comments are posted immediately)
				-- 	toggle_sort_method = "st", -- Toggle whether discussions are sorted by the "latest_reply", or by "original_comment", see `:h gitlab.nvim.toggle_sort_method`
				-- 	toggle_node = "t", -- Open or close the discussion
				-- 	toggle_all_discussions = "T", -- Open or close separately both resolved and unresolved discussions
				-- 	toggle_resolved_discussions = "R", -- Open or close all resolved discussions
				-- 	toggle_unresolved_discussions = "U", -- Open or close all unresolved discussions
				-- 	refresh_data = "<C-R>", -- Refresh the data in the view by hitting Gitlab's APIs again
				-- 	print_node = "<leader>p", -- Print the current node (for debugging)
				-- },
				-- reviewer = {
				-- 	disable_all = false, -- Disable all default mappings for the reviewer windows
				-- 	create_comment = "c", -- Create a comment for the lines that the following {motion} moves over. Repeat the key(s) for creating comment for the current line
				-- 	create_suggestion = "s", -- Create a suggestion for the lines that the following {motion} moves over. Repeat the key(s) for creating comment for the current line
				-- 	move_to_discussion_tree = "a", -- Jump to the comment in the discussion tree
				-- },
			},
		}
	end,
}
