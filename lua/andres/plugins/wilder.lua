local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

-- wilder.set_option(
--   "renderer",
--   wilder.popupmenu_renderer({
--     -- highlighter applies highlighting to the candidates
--     highlighter = wilder.basic_highlighter(),
--   })
-- )

local gradient = {
  "#f4468f",
  "#fd4a85",
  "#ff507a",
  "#ff566f",
  "#ff5e63",
  "#ff6658",
  "#ff704e",
  "#ff7a45",
  "#ff843d",
  "#ff9036",
  "#f89b31",
  "#efa72f",
  "#e6b32e",
  "#dcbe30",
  "#d2c934",
  "#c8d43a",
  "#bfde43",
  "#b6e84e",
  "#aff05b",
}
-- --
for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
end

wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
    highlights = {
      border = "Normal", -- highlight to use for the border
      gradient = gradient,
    },
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(),
    }),

    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = "rounded",
  }))
)
