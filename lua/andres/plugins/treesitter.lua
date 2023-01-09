-- local status, ts = pcall(require, "nvim-treesitter.configs")
-- if not status then
--   return
-- end
--
-- ts.setup({
--   highlight = {
--     enable = true,
--     disable = {},
--   },
--   indent = {
--     enable = true,
--     disable = {},
--   },
--   ensure_installed = {
--     "tsx",
--     "toml",
--     "fish",
--     "php",
--     "json",
--     "yaml",
--     "swift",
--     "css",
--     "html",
--     "lua",
--   },
--   autotag = {
--     enable = true,
--   },
-- })
--
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

---------------------------------------------------------------------------------------
-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  context_commentstring = {
    enable = true,
  },
  -- auto install above language parsers
  auto_install = true,
})
