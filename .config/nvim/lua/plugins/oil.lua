return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true, -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
		view_options = {
			default_file_explorer = true,
			show_hidden = true,
			skip_confirm_for_simple_edits = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
