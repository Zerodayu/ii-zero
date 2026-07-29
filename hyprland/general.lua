hl.config({
  decoration = {
    rounding_power = 2.5,
    rounding = 18,

    active_opacity = 0.90,
    inactive_opacity = 0.75,

    blur = {
      enabled = true,
      xray = true,
      special = true,
      new_optimizations = true,
      size = 4,
      passes = 4,
      brightness = 1,
      noise = 0.05,
      contrast = 0.89,
      vibrancy = 0.5,
      vibrancy_darkness = 0.5,
      popups = false,
      popups_ignorealpha = 0.6,
      input_methods = true,
      input_methods_ignorealpha = 0.8
    },
    dim_inactive = true,
    dim_strength = 0.05,
    dim_special = 0.2
  },
  cursor = {
    zoom_factor = 1,
    zoom_rigid = false,
    zoom_disable_aa = true,
    hotspot_padding = 1,
    hide_on_key_press = true
  },
})

hl.curve("easing", {
  type = "bezier",
  points = { { 0.25, 1 }, { 0.5, 1 } }
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 6,
  bezier = "easing",
  style = "slide"
})

hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 6,
  bezier = "easing"
})
