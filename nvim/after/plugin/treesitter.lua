require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "query", "python", "javascript", "typescript", "html", "css", "json", "markdown", "cpp"},

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = true,
  }
}
