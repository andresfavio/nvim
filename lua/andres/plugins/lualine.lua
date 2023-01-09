require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "solarized_dark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

-- local colors = {
--   base03  =  '#002b36',
--   base02  =  '#073642',
--   base01  =  '#586e75',
--   base00  =  '#657b83',
--   base0   =  '#839496',
--   base1   =  '#93a1a1',
--   base2   =  '#eee8d5',
--   base3   =  '#fdf6e3',
--   yellow  =  '#b58900',
--   orange  =  '#cb4b16',
--   red     =  '#dc322f',
--   magenta =  '#d33682',
--   violet  =  '#6c71c4',
--   blue    =  '#268bd2',
--   cyan    =  '#2aa198',
--   green   =  '#859900',
-- }
--
-- return {
--   normal = {
--     a = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
--     b = { fg = colors.base03, bg = colors.base1 },
--     c = { fg = colors.base1, bg = colors.base02 },
--   },
--   insert = { a = { fg = colors.base03, bg = colors.green, gui = 'bold' } },
--   visual = { a = { fg = colors.base03, bg = colors.magenta, gui = 'bold' } },
--   replace = { a = { fg = colors.base03, bg = colors.red, gui = 'bold' } },
--   inactive = {
--     a = { fg = colors.base0, bg = colors.base02, gui = 'bold' },
--     b = { fg = colors.base03, bg = colors.base00 },
--     c = { fg = colors.base01, bg = colors.base02 },
--   },
-- }
-----------------------------------------------------------------------------------
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }

-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.black },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }
--
-- require('lualine').setup {
--   options = {
--     theme = bubbles_theme,
--     component_separators = '|',
--     section_separators = { left = '', right = '' },
--   },
--   sections = {
--     lualine_a = {
--       { 'mode', separator = { left = '' }, right_padding = 2 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', separator = { right = '' }, left_padding = 2 },
--     },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {},
-- }
