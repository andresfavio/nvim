local status, n = pcall(require, "neosolarized")
if not status then
  return
end

n.setup({
  comment_italics = true,
})

local cb = require("colorbuddy.init")
local colors = cb.colors
local Group = cb.Group
local styles = cb.styles

Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.NONE, styles.bold, colors.base1)
Group.new("Visual", colors.none, colors.base03, styles.reverse)
Group.new("Operator", colors.yellow, colors.none, styles.italic)
