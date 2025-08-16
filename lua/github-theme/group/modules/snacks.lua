-- https://github.com/folke/snacks.nvim/

local M = {}

---@param spec GhTheme.Spec
---@param config GhTheme.Config.Options
---@param opts GhTheme.Config.Module
function M.get(spec, config, opts)
  local c = spec.palette

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

    SnacksNotifierInfo = { fg = c.blue.base },
    SnacksNotifierIconInfo = { fg = c.blue.base },
    SnacksNotifierTitleInfo = { fg = c.blue.base, style = 'italic' },
    SnacksNotifierFooterInfo = { link = 'DiagnosticInfo' },
    SnacksNotifierBorderInfo = { fg = c.blue.base },

    SnacksNotifierWarn = { fg = c.yellow.base },
    SnacksNotifierIconWarn = { fg = c.yellow.base },
    SnacksNotifierTitleWarn = { fg = c.yellow.base, style = 'italic' },
    SnacksNotifierBorderWarn = { fg = c.yellow.base },
    SnacksNotifierFooterWarn = { link = 'DiagnosticWarn' },

    SnacksNotifierDebug = { fg = c.orange },
    SnacksNotifierIconDebug = { fg = c.orange },
    SnacksNotifierTitleDebug = { fg = c.orange, style = 'italic' },
    SnacksNotifierBorderDebug = { fg = c.orange },
    SnacksNotifierFooterDebug = { link = 'DiagnosticHint' },

    SnacksNotifierError = { fg = c.red.base },
    SnacksNotifierIconError = { fg = c.red.base },
    SnacksNotifierTitleError = { fg = c.red.base, style = 'italic' },
    SnacksNotifierBorderError = { fg = c.red.base },
    SnacksNotifierFooterError = { link = 'DiagnosticError' },

    SnacksNotifierTrace = { fg = c.magenta.base },
    SnacksNotifierIconTrace = { fg = c.magenta.base },
    SnacksNotifierTitleTrace = { fg = c.magenta.base, style = 'italic' },
    SnacksNotifierBorderTrace = { fg = c.magenta.base },
    SnacksNotifierFooterTrace = { link = 'DiagnosticHint' },

    SnacksDashboardNormal = { link = 'Normal' },
    SnacksDashboardDesc = { fg = c.fg.default },
    SnacksDashboardFile = { fg = c.blue.bright },
    SnacksDashboardDir = { link = 'NonText' },
    SnacksDashboardFooter = { fg = c.yellow.base, style = 'italic' },
    SnacksDashboardHeader = { fg = c.magenta.bright },
    SnacksDashboardIcon = { fg = c.orange, style = 'bold' },
    SnacksDashboardKey = { fg = c.yellow.bright },
    SnacksDashboardTerminal = { link = 'SnacksDashboardNormal' },
    SnacksDashboardSpecial = { fg = c.fg.default },
    SnacksDashboardTitle = { link = 'Title' },

    SnacksIndent = { fg = spec.bg3 },
    SnacksIndentScope = {
      fg = indent_scope_color == 'text' and spec.fg1
          or c[indent_scope_color] and c[indent_scope_color].base
          or spec.fg1,
    },

    SnacksPickerSelected = {
      fg = float_transparent and c.accent.fg or spec.fg1,
      bg = float_transparent and 'NONE' or spec.bg3,
      style = 'bold',
    },
    SnacksPickerMatch = { fg = c.yellow.bright },

    SnacksPicker = { link = 'NormalFloat' },
    SnacksPickerBorder = { link = 'FloatBorder' },
    SnacksPickerInputBorder = { link = 'SnacksPickerBorder' },
    SnacksPickerInput = { link = 'NormalFloat' },
    SnacksPickerPrompt = { fg = c.accent.fg },
  }

  if float_solid then
    hlgroups['SnacksPickerTitle'] = {
      fg = spec.bg0,
      bg = c.magenta.base,
    }
    hlgroups['SnacksPickerPreviewTitle'] = {
      fg = spec.bg0,
      bg = c.green.base,
    }
    hlgroups['SnacksPickerInputTitle'] = {
      fg = spec.bg0,
      bg = c.red.base,
    }
    hlgroups['SnacksPickerListTitle'] = {
      fg = spec.bg0,
      bg = c.blue.bright,
    }
  end

  return hlgroups
end

return M
