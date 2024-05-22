return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = 'catppuccin',
      sections = {
        lualine_x = { 'fileformat', 'filetype' },
      },
    }
  }
}
