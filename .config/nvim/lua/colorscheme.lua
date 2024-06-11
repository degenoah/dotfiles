
-- 
-- A table containing our theme's color palette.
-- 
local colors = {
  foreground = "#F4CAC3",
  background = "#0D1B2A",
  
  cursor = "#E05674",

  black   = "#0D1B2A", black_bright   = "#1C3A4A",
  red     = "#E05674", red_bright     = "#E27B8B",
  green   = "#9FE098", green_bright   = "#B7EDB1",
  yellow  = "#F5D275", yellow_bright  = "#F0D387",
  blue    = "#557C9E", blue_bright    = "#739EBB",
  magenta = "#E05696", magenta_bright = "#E183AE",
  cyan    = "#66D6E1", cyan_bright    = "#88E0E8",
  white   = "#F5F5F5", white_bright   = "#FFFFFF"
}

-- Clear any existing syntax highlights.
vim.cmd([[
  highlight clear
  set t_Co=256
]])

-- Set our background type and theme name.
vim.o.background = "dark"
vim.g.colors_name = "bluecherry"

-- 
-- Simple helper function for constructing 
-- highlight commands from a table of definitions.
-- 
local function define_highlights(highlights)
  for group, opts in pairs(highlights) do
    local foreground = opts.fg or "NONE"
    local background = opts.bg or "NONE"
    local sp = opts.sp or "NONE"
    local style = opts.style or "NONE"

    vim.cmd(string.format(
      "highlight %s guifg=%s guibg=%s guisp=%s gui=%s", 
      group, foreground, background, sp, style
    ))
  end
end

-- 
-- Syntax highlighting rules are defined here.
-- 
define_highlights({
  Normal = { fg = colors.foreground, bg = colors.background },
  Cursor = { fg = colors.background, bg = colors.cursor },
  CursorLine = { bg = colors.black_bright },
  Visual = { fg = colors.blue },

  -- TODO: move to color table.
  Comment = { fg = "#4C6A7A", style = "italic" },

  Constant = { fg = colors.cyan },
  String = { fg = colors.green },
  Function = { fg = colors.blue },
  Identifier = { fg = colors.yellow },
  Statement = { fg = colors.red },
  Type = { fg = colors.magenta },
  Special = { fg = colors.red_bright },
  Error = { fg = colors.red },
  Todo = { fg = colors.yellow, style = "bold" },
  LineNr = { fg = colors.blue_bright },
  CursorLineNr = { fg = colors.yellow_bright },
  Pmenu = { fg = colors.foreground, bg = colors.black_bright },
  PmenuSel = { fg = colors.white_bright, bg = colors.black_bright },
  StatusLine = { fg = colors.white, bg = colors.black_bright },
  StatusLineNC = { fg = colors.white_bright, bg = colors.black },
  VertSplit = { fg = colors.black_bright, bg = colors.black },
  TabLine = { fg = colors.white, bg = colors.black_bright },
  TabLineFill = { fg = colors.white, bg = colors.black },
  TabLineSel = { fg = colors.black, bg = colors.blue_bright },

  -- TODO: Add more highlights.
})
