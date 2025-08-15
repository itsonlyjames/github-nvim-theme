local C = require('github-theme.lib.color')

local M = {}

---@param spec GhTheme.Spec
---@param config GhTheme.Config.Options
---@param opts GhTheme.Config.Module
function M.get(spec, config, opts)
  local c = spec.palette

  local function blend(color, a)
    return C(spec.bg1):blend(C(color), a):to_css()
  end

  -- Get indent scope color from config if available, fallback to default
  local indent_scope_color = (opts and opts.indent_scope_color) or spec.syntax.builtin2

  -- stylua: ignore
  ---@type table<string, GhTheme.HighlightGroup>
  local hlgroups = {
    SnacksNormal = { link = "NormalFloat" },
    SnacksWinBar = { link = "Title" },
    SnacksBackdrop = { link = "FloatShadow" },
    SnacksNormalNC = { link = "NormalFloat" },
    SnacksWinBarNC = { link = "SnacksWinBar" },

    -- Notifier highlights
    SnacksNotifierInfo = { fg = c.blue.base },
    SnacksNotifierIconInfo = { fg = c.blue.base },
    SnacksNotifierTitleInfo = { fg = c.blue.base, style = { "italic" } },
    SnacksNotifierFooterInfo = { link = "DiagnosticInfo" },
    SnacksNotifierBorderInfo = { fg = c.blue.base },

    SnacksNotifierWarn = { fg = c.yellow.base },
    SnacksNotifierIconWarn = { fg = c.yellow.base },
    SnacksNotifierTitleWarn = { fg = c.yellow.base, style = { "italic" } },
    SnacksNotifierBorderWarn = { fg = c.yellow.base },
    SnacksNotifierFooterWarn = { link = "DiagnosticWarn" },

    SnacksNotifierDebug = { fg = c.orange },
    SnacksNotifierIconDebug = { fg = c.orange },
    SnacksNotifierTitleDebug = { fg = c.orange, style = { "italic" } },
    SnacksNotifierBorderDebug = { fg = c.orange },
    SnacksNotifierFooterDebug = { link = "DiagnosticHint" },

    SnacksNotifierError = { fg = c.red.base },
    SnacksNotifierIconError = { fg = c.red.base },
    SnacksNotifierTitleError = { fg = c.red.base, style = { "italic" } },
    SnacksNotifierBorderError = { fg = c.red.base },
    SnacksNotifierFooterError = { link = "DiagnosticError" },

    SnacksNotifierTrace = { fg = c.magenta.base },
    SnacksNotifierIconTrace = { fg = c.magenta.base },
    SnacksNotifierTitleTrace = { fg = c.magenta.base, style = { "italic" } },
    SnacksNotifierBorderTrace = { fg = c.magenta.base },
    SnacksNotifierFooterTrace = { link = "DiagnosticHint" },

    -- Dashboard highlights
    SnacksDashboardNormal = { link = "Normal" },
    SnacksDashboardDesc = { fg = c.blue.base },
    SnacksDashboardFile = { fg = c.blue.bright },
    SnacksDashboardDir = { link = "NonText" },
    SnacksDashboardFooter = { fg = c.yellow.base, style = { "italic" } },
    SnacksDashboardHeader = { fg = c.blue.base },
    SnacksDashboardIcon = { fg = c.magenta.base, bold = true },
    SnacksDashboardKey = { fg = c.orange },
    SnacksDashboardTerminal = { link = "SnacksDashboardNormal" },
    SnacksDashboardSpecial = { link = "Special" },
    SnacksDashboardTitle = { link = "Title" },

    -- Indent highlights
    SnacksIndent = { fg = spec.bg3 },
    SnacksIndentScope = { fg = indent_scope_color },

    -- Picker highlights
    SnacksPickerSelected = {
      fg = spec.fg1,
      bg = spec.sel0,
      style = { "bold" },
    },
    SnacksPickerMatch = { fg = c.blue.base },

    SnacksPicker = { link = "NormalFloat" },
    SnacksPickerBorder = { link = "FloatBorder" },
    SnacksPickerInputBorder = { link = "SnacksPickerBorder" },
    SnacksPickerInput = { link = "NormalFloat" },
    SnacksPickerPrompt = { fg = c.accent.fg },
  }

  -- Add solid background titles if transparent is disabled
  if config and config.options and not config.options.transparent then
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
