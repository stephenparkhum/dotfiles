return {
    'stevearc/oil.nvim',
    opts = {
        delete_to_trash = true, -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        show_hidden = true,
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
