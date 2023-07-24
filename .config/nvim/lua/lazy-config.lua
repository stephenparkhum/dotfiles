require("lazy").setup("plugins", {
 defaults = { lazy = true },
 install = { colorscheme = { "tokyonight" } },
 checker = { enabled = true },
 change_detection = {
  notify = false,
 },
 performance = {
  rtp = {
   disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
   },
  },
 },
})
