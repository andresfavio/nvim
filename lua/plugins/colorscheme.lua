return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("solarized-osaka").setup({
      transparent = true,
      on_highlights = function(hl, c)
        -- Illuminate
        hl.illuminatedWord = { underline = true }
        hl.illuminatedCurWord = { underline = true }
        hl.IlluminatedWordText = { underline = true }
        hl.IlluminatedWordRead = { underline = true }
        hl.IlluminatedWordWrite = { underline = true }

        --Flash
        --
        hl.FlashLabel = {
          bg = "#ff007c",
          bold = true,
          fg = "#cfc3e7",
        }
        -- LineNumber
        hl.LineNr = {
          fg = "#42516f",
        }
        hl.CursorLineNr = {
          fg = "#967000",
        }
        -- TELESCOPE
        hl.TelescopeNormal = {
          bg = "NONE",
        }
        hl.TelescopeBorder = {
          bg = "NONE",
          fg = "#7c8a8c",
        }
        hl.TelescopeSelection = {
          bg = "#001419",
        }
        hl.TelescopePromptNormal = {
          bg = "NONE",
          fg = "#808f91",
        }
        hl.TelescopePromptTitle = {
          bg = "NONE",
          fg = "#808f91",
        }
        hl.TelescopePreviewTitle = {
          bg = "NONE",
          fg = "#808f91",
        }
        hl.TelescopeResultsTitle = {
          bg = "NONE",
          fg = "#808f91",
        }

        --- FLOATS
        hl.NormalFloat = {
          bg = "NONE",
        }
        hl.FloatBorder = {
          fg = "#808f91",
          bg = "NONE",
        }
        hl.FloatTitle = {
          bg = "NONE",
        }
        hl.CursorLine = {
          -- bg = "#001419",
          bg = "#001317",
        }

        -- NeoTree
        hl.NeoTreeNormal = {
          bg = "NONE",
        }
        hl.NeoTreeNormalNC = {
          bg = "NONE",
        }
        hl.NeoTreeFloatNormal = {
          bg = "NONE",
        }

        --SmoothCursor
        hl.SmoothCursor = {
          fg = "#aaaaaa",
        }

        hl.IblIndent = {
          fg = "#111620",
          nocombine = true,
        }
        hl.DashboardHeader = {
          fg = "#608ebf",
        }
        hl.NoiceMini = {
          bg = "#00161a",
        }
      end,
    })
    vim.cmd([[colorscheme solarized-osaka]])
  end,
}
