return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      on_colors = function(colors)
        -- illogical impulse generated colors
        local path = vim.fn.expand("~/.local/state/quickshell/user/generated/colors.json")
        local f = io.open(path, "r")
        if not f then return end
        local ok, c = pcall(vim.json.decode, f:read("*a"))
        f:close()
        if not ok then return end

        -- Backgrounds
        colors.bg = c.surface
        colors.bg_dark = c.surface_dim
        colors.bg_dark1 = c.surface_container_lowest
        colors.bg_float = c.surface_container
        colors.bg_highlight = c.surface_container_high
        colors.bg_popup = c.surface_container_low
        colors.bg_search = c.primary_container
        colors.bg_sidebar = c.surface_container_low
        colors.bg_statusline = c.surface_container_low
        colors.bg_visual = c.secondary_container
        colors.black = c.surface_container_lowest

        -- Foregrounds / borders
        colors.fg = c.on_surface
        colors.fg_dark = c.on_surface_variant
        colors.fg_float = c.on_surface
        colors.fg_gutter = c.outline_variant
        colors.fg_sidebar = c.on_surface_variant
        colors.comment = c.outline
        colors.border = c.outline_variant
        colors.border_highlight = c.primary

        -- Core accents
        colors.blue = c.primary_fixed
        colors.blue0 = c.primary
        colors.blue1 = c.primary_fixed
        colors.blue2 = c.tertiary_fixed_dim
        colors.blue5 = c.tertiary_fixed
        colors.blue6 = c.tertiary_fixed
        colors.blue7 = c.primary_container
        colors.cyan = c.tertiary_fixed
        colors.green = c.primary_fixed
        colors.green1 = c.tertiary_fixed_dim
        colors.green2 = c.tertiary_container
        colors.magenta = c.secondary_container
        colors.purple = c.tertiary_container
        colors.orange = c.tertiary
        colors.yellow = c.secondary_fixed
        colors.red = c.error
        colors.red1 = c.error_container
        colors.dark3 = c.outline
        colors.dark5 = c.on_surface_variant
        colors.error = c.on_error

        -- Diff / git
        colors.diff = {
          add = c.primary_fixed,
          change = c.tertiary_fixed,
          delete = c.error,
          text = c.on_primary,
        }
        colors.git = {
          add = c.primary,
          change = c.tertiary,
          delete = c.error,
          ignore = c.outline,
        }
      end,

    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
}
