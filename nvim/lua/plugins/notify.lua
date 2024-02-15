return {
 'rcarriga/nvim-notify',
 opts = {
  background_colour = "NotifyBackground",
  fps = 60,
  icons = {
   DEBUG = "",
   ERROR = "",
   INFO = "",
   TRACE = "✎",
   WARN = ""
  },
  level = 2,
  minimum_width = 100,
  render = "compact",
  stages = "no_animation", --slide staric fade fade_in_slide_out no_animation
  timeout = 2000,
  top_down = false,
 },
}
