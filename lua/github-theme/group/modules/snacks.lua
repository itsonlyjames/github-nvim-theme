-- https://github.com/folke/snacks.nvim/

local M = {}

---@param spec GhTheme.Spec
---@param config GhTheme.Config.Options
---@param opts GhTheme.Config.Module
function M.get(spec, config, opts)
  local c = spec.palette

  -- Map catppuccin colors to github theme equivalents
  local C = {
    blue = c.blue.base,
    yellow = c.yellow.base,
    peach = c.orange,
    red = c.red.base,
    rosewater = c.magenta.base,
    lavender = c.blue.bright,
    pink = c.magenta.base,
    flamingo = c.accent.fg,
    surface0 = spec.bg3,
    text = spec.fg1,
    none = 'NONE',
    crust = spec.bg0,
    mauve = c.magenta.base,
    green = c.green.base,
  }

  -- Handle configuration options
  local indent_scope_color = (opts and opts.indent_scope_color) or 'text'
  local float_transparent = config and config.options and config.options.transparent
  local float_solid = config and config.options and not config.options.transparent

  local hlgroups = {
    SnacksNormal = { link = 'NormalFloat' },
    SnacksWinBar = { link = 'Title' },
    SnacksBackdrop = { link = 'FloatShadow' },
    SnacksNormalNC = { link = 'NormalFloat' },
    SnacksWinBarNC = { link = 'SnacksWinBar' },

    SnacksNotifierInfo = { fg = C.blue },
    SnacksNotifierIconInfo = { fg = C.blue },
    SnacksNotifierTitleInfo = { fg = C.blue, style = 'italic' },
    SnacksNotifierFooterInfo = { link = 'DiagnosticInfo' },
    SnacksNotifierBorderInfo = { fg = C.blue },

    SnacksNotifierWarn = { fg = C.yellow },
    SnacksNotifierIconWarn = { fg = C.yellow },
    SnacksNotifierTitleWarn = { fg = C.yellow, style = 'italic' },
    SnacksNotifierBorderWarn = { fg = C.yellow },
    SnacksNotifierFooterWarn = { link = 'DiagnosticWarn' },

    SnacksNotifierDebug = { fg = C.peach },
    SnacksNotifierIconDebug = { fg = C.peach },
    SnacksNotifierTitleDebug = { fg = C.peach, style = 'italic' },
    SnacksNotifierBorderDebug = { fg = C.peach },
    SnacksNotifierFooterDebug = { link = 'DiagnosticHint' },

    SnacksNotifierError = { fg = C.red },
    SnacksNotifierIconError = { fg = C.red },
    SnacksNotifierTitleError = { fg = C.red, style = 'italic' },
    SnacksNotifierBorderError = { fg = C.red },
    SnacksNotifierFooterError = { link = 'DiagnosticError' },

    SnacksNotifierTrace = { fg = C.rosewater },
    SnacksNotifierIconTrace = { fg = C.rosewater },
    SnacksNotifierTitleTrace = { fg = C.rosewater, style = 'italic' },
    SnacksNotifierBorderTrace = { fg = C.rosewater },
    SnacksNotifierFooterTrace = { link = 'DiagnosticHint' },

    SnacksDashboardNormal = { link = 'Normal' },
    SnacksDashboardDesc = { fg = C.blue },
    SnacksDashboardFile = { fg = C.lavender },
    SnacksDashboardDir = { link = 'NonText' },
    SnacksDashboardFooter = { fg = C.yellow, style = 'italic' },
    SnacksDashboardHeader = { fg = C.blue },
    SnacksDashboardIcon = { fg = C.pink, style = 'bold' },
    SnacksDashboardKey = { fg = C.peach },
    SnacksDashboardTerminal = { link = 'SnacksDashboardNormal' },
    SnacksDashboardSpecial = { link = 'Special' },
    SnacksDashboardTitle = { link = 'Title' },

    SnacksIndent = { fg = C.surface0 },
    SnacksIndentScope = { fg = C[indent_scope_color] or C.text },

    SnacksPickerSelected = {
      fg = float_transparent and C.flamingo or C.text,
      bg = float_transparent and C.none or C.surface0,
      style = 'bold',
    },
    SnacksPickerMatch = { fg = C.blue },

    SnacksPicker = { link = 'NormalFloat' },
    SnacksPickerBorder = { link = 'FloatBorder' },
    SnacksPickerInputBorder = { link = 'SnacksPickerBorder' },
    SnacksPickerInput = { link = 'NormalFloat' },
    SnacksPickerPrompt = { fg = C.flamingo },
  }

  if float_solid then
    hlgroups['SnacksPickerTitle'] = {
      fg = C.crust,
      bg = C.mauve,
    }
    hlgroups['SnacksPickerPreviewTitle'] = {
      fg = C.crust,
      bg = C.green,
    }
    hlgroups['SnacksPickerInputTitle'] = {
      fg = C.crust,
      bg = C.red,
    }
    hlgroups['SnacksPickerListTitle'] = {
      fg = C.crust,
      bg = C.lavender,
    }
  end

  return hlgroups
end

return M
