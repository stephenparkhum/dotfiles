-- Color scheme
return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme catppuccin-macchiato]])
        require("catppuccin").setup({
            integrations = {
                ts_rainbow = true,
                which_key = true,
                ts_rainbow2 = true,
                coc_nvim = true,
                cmp = true,
                dap = true,
                gitsigns = true,
                nvimtree = true,
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
