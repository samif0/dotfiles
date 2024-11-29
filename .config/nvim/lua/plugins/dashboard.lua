return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      theme = "doom",
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      config = {
        header = {
          "                                                  ",
          "                                                  ",
          "           ╔═══╗         ┌─┐                     ",
          "           ║███║ ╔═══╗   │╔╧╗                    ",
          "      ╔════╝███║ ║███╠═══╧╝█║                    ",
          "      ║██████████████████████╠┐                  ",
          "      ║████╔═══███████╔═══███║│    neovim       ",
          "   ┌──╢████║██████████║██████║└┐                 ",
          "   │  ║████║██████████║██████║ │                 ",
          "   │  ║████║██████████║██████║ │                 ",
          "   │  ║██████████████████████║ │                 ",
          "   │  ╚══════════════════════╝ │                 ",
          "   │     [system ready...]     │                 ",
          "   └─────────────────────────┘                   ",
          "                                                  ",
          "          [ ./init sequence ]                     ",
          "                                                  ",
        },
        center = {
          { icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "New File", key = "n", action = "ene | startinsert" },
          { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Find Text", key = "g", action = "Telescope live_grep" },
          { icon = "  ", desc = "Config", key = "c", action = "e $MYVIMRC" },
          { icon = "  ", desc = "Lazy", key = "l", action = "Lazy" },
          { icon = "  ", desc = "Quit", key = "q", action = "qa" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { " " .. stats.loaded .. "/" .. stats.count .. " modules loaded in " .. ms .. "ms" }
        end,
      },
    },
  },
}
