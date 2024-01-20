local Util = require("lazyvim.util")
return {
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    -- event = "BufEnter",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      local lualine = require("lualine")
      local lualine_require = require("lualine_require")
      local icons = require("lazyvim.config").icons
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      local function get_status_line()
        local current_file = vim.fn.expand("%:t")
        local icon, _ = require("nvim-web-devicons").get_icon(current_file, vim.fn.expand("%:e"))
        local file_icon = icon or ""

        local clients = vim.lsp.get_active_clients() or {}
        local lsp_status = ""
        if next(clients) ~= nil then
          local client_names = {}
          for _, client in pairs(clients) do
            table.insert(client_names, client.name)
          end
          lsp_status = "LSP: " .. table.concat(client_names, ", ")
        else
          lsp_status = "LSP: inactivo"
        end

        return lsp_status
      end

      local colors = {
        blue = "#176da8",
        green = "#869a00",
        violet = "#ff61ef",
        yellow = "#ae8200",
        red = "#ff4a4a",
        fg = "#94A3A3",
        bg = "#00161a",
        inactive_bg = "#2c3043",
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.bg, fg = colors.fg },
          z = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
          b = { bg = colors.fg, fg = colors.bg },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }
      -- configure lualine with modified theme
      lualine.setup({

        options = {
          globalstatus = true,
          theme = my_lualine_theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "lazy" } },
        },
        -- Sections
        sections = {

          -- A
          lualine_a = { { "mode", separator = "" } },

          -- B
          lualine_b = {
            {

              "branch",
              icon = { "󰊢" },
            },
          },

          -- C
          lualine_c = {

            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            get_status_line,
          },

          -- X
          lualine_x = {
          -- stylua: ignore
            --
            --
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = Util.ui.fg("Statement"),
            },
          -- stylua: ignore
            --
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = Util.ui.fg("Constant"),
            },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = Util.ui.fg("Special"),
            },
            {

              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },

            function()
              local fileformat = vim.bo.fileformat
              local icon = " " -- ícono de arch linux
              return icon .. " " .. fileformat:upper()
            end,

            require("lazyvim.util").lualine.cmp_source("codeium"),
          },

          -- Y
          lualine_y = {},

          -- Z
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = {},
      })
    end,
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  -- Notify
  {
    "nvim-notify",
    opts = {
      level = 2,
      render = "wrapped-compact",
      stages = "slide",
      timeout = 700,
      fps = 60,
    },
  },
  --SmoothCursor
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = function()
      require("smoothcursor").setup({
        type = "exp",
        fancy = {
          enable = false, -- enable fancy mode
          head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
          body = {
            { cursor = "●", texthl = "SmoothCursorAqua" },
            { cursor = "●", texthl = "SmoothCursorAqua" },
            { cursor = "•", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorAqua" },
          },
          tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
        },
      })
    end,
  },
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
	                                                                      
	       ████ ██████           █████      ██                     
	      ███████████             █████                             
	      █████████ ███████████████████ ███   ███████████   
	     █████████  ███    █████████████ █████ ██████████████   
	    █████████ ██████████ █████████ █████ █████ ████ █████   
	  ███████████ ███    ███ █████████ █████ █████ ████ █████  
	 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
  ]]

      logo = string.rep("\n", 6) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
