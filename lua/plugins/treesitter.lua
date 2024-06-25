local M = { "nvim-treesitter/nvim-treesitter" }

M.dependencies = {
  "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cmake",
      "cpp",
      --     "css",
      "gitignore",
      "go",
      "http",
      --    "scss",
      --   "sql",
      --   "tsx",
      --   "typescript",
      --   "javascript",
      --   "html",
      "lua",
      --   "astro",
      "asm",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
