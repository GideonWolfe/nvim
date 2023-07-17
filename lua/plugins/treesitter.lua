require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "arduino",
    "bash",
    "bibtex",
    "c",
    "cpp",
    "c_sharp",
    "clojure",
    "cmake",
    "comment",
    "commonlisp",
    "css",
    "dockerfile",
    "diff",
    "fish",
    "go",
    "graphql",
    "html",
    "ini",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "julia",
    "kotlin",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "matlab",
    "nix",
    "pascal",
    "perl",
    "php",
    "python",
    "puppet",
    "regex",
    "rust",
    "ruby",
    "r",
    "racket",
    "scss",
    "scheme",
    "sql",
    "swift",
    "toml",
    "terraform",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  sync_install = true,
  auto_install = true,
  -- TS Rainbow module config here
  rainbow = {
      enable = true,
      query = 'rainbow-parens',
      strategy = require('ts-rainbow').strategy.global,
    }
}
