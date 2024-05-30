-- Color scheme
return {
    "catppuccin/nvim",
    lazy = false,
    priority = 10000,
    name = "catppuccin",
    config = function()
        vim.cmd([[colorscheme catppuccin-macchiato]])
        require("catppuccin").setup({
            integrations = {
                ts_rainbow = true,
                ts_rainbow2 = true,
                which_key = true,
                cmp = true,
                dap = true,
                gitsigns = true,
                mason = true,
                harpoon = true,
                treesitter = true,
                telescope = {
                    enabled = true,
                },
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            }
        })
    end,
}
