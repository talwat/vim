return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  callback = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "rust",
          "lua",
          "vim",
          "vimdoc",
          "c",
          "python",
          "query"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },
      })
  end
}
