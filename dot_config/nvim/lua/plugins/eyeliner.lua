return {
    'jinh0/eyeliner.nvim',
    config = function()
        require 'eyeliner'.setup {
            dim = true,
            highlight_on_key = true
        }
        vim.api.nvim_create_autocmd('ColorScheme', {
            pattern = '*',
            callback = function()
                vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
            end,
        })
    end
}
