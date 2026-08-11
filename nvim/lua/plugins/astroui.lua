
-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- TokyoNight remains the base, while we push the highlights toward Blood Moon
    colorscheme = "tokyonight",

    
  highlights = {
    init = function()
      -- Blood Moon palette
      local moon = {
        red       = "#ff3b4f",
        bright    = "#ff6675",
        darkred   = "#8f2635",
        maroon    = "#6e1f2b",
        pink      = "#e89aa5",
        moon      = "#e6c8cc",
        muted     = "#8f6b71",
        orange    = "#d99a5e",
        purple    = "#b58bbd",
        green     = "#9fba8b",
        blue      = "#9faec7",
      }

      -- Keep these groups' original backgrounds
      local keep_names = {
        "Visual",
        "VisualNOS",
        "ColorColumn",
        "PmenuSel",
        "MatchParen",
        "QuickFixLine",
      }

      local saved = {}

      for _, name in ipairs(keep_names) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
          name = name,
          link = false,
        })

        if ok and hl and next(hl) ~= nil then
          saved[name] = hl
        end
      end

      -- Make everything transparent
      for _, name in ipairs(vim.fn.getcompletion("", "highlight")) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
          name = name,
          link = false,
        })

        if ok and hl and next(hl) ~= nil then
          hl.bg = "none"
          hl.ctermbg = "none"

          vim.api.nvim_set_hl(0, name, hl)
        end
      end

      -- Restore useful UI groups
      for name, hl in pairs(saved) do
        vim.api.nvim_set_hl(0, name, hl)
      end

      -- ═══════════════════════════════════════
      --              BLOOD MOON
      -- ═══════════════════════════════════════

      local syntax = {
        -- Keywords / control flow
        ["@keyword"] = { fg = moon.red, bold = true },
        ["@keyword.function"] = { fg = moon.red, bold = true },
        ["@keyword.return"] = { fg = moon.bright, bold = true },
        ["@keyword.operator"] = { fg = moon.red },

        -- Functions
        ["@function"] = { fg = moon.bright, bold = true },
        ["@function.call"] = { fg = moon.pink },
        ["@function.builtin"] = { fg = moon.red },

        -- Variables
        ["@variable"] = { fg = moon.moon },
        ["@variable.builtin"] = { fg = moon.pink },

        -- Constants
        ["@constant"] = { fg = moon.bright },
        ["@constant.builtin"] = { fg = moon.red },

        -- Strings
        ["@string"] = { fg = moon.pink },
        ["@string.escape"] = { fg = moon.red, bold = true },
        ["@string.special"] = { fg = moon.red },

        -- Numbers / booleans
        ["@number"] = { fg = moon.orange },
        ["@boolean"] = { fg = moon.orange },

        -- Types
        ["@type"] = { fg = moon.moon, bold = true },
        ["@type.builtin"] = { fg = moon.red },

        -- Properties / fields
        ["@property"] = { fg = moon.pink },
        ["@field"] = { fg = moon.pink },

        -- Operators
        ["@operator"] = { fg = moon.red },

        -- Punctuation
        ["@punctuation.bracket"] = { fg = moon.muted },
        ["@punctuation.delimiter"] = { fg = moon.muted },
        ["@punctuation.special"] = { fg = moon.red },

        -- Comments
        ["@comment"] = {
          fg = moon.muted,
          italic = true,
        },

        -- Tags
        ["@tag"] = { fg = moon.red },
        ["@tag.attribute"] = { fg = moon.pink },
        ["@tag.delimiter"] = { fg = moon.muted },

        -- Markdown
        ["@markup.heading"] = {
          fg = moon.red,
          bold = true,
        },

        ["@markup.strong"] = {
          fg = moon.bright,
          bold = true,
        },

        ["@markup.italic"] = {
          fg = moon.pink,
          italic = true,
        },

        -- LSP semantic tokens
        ["@lsp.type.function"] = { fg = moon.bright },
        ["@lsp.type.method"] = { fg = moon.pink },
        ["@lsp.type.variable"] = { fg = moon.moon },
        ["@lsp.type.parameter"] = { fg = moon.moon },
        ["@lsp.type.keyword"] = { fg = moon.red },
        ["@lsp.type.type"] = { fg = moon.moon },
        ["@lsp.type.property"] = { fg = moon.pink },
        ["@lsp.type.namespace"] = { fg = moon.red },
      }

      for group, opts in pairs(syntax) do
        vim.api.nvim_set_hl(0, group, opts)
      end

      -- Search
      vim.api.nvim_set_hl(0, "Search", {
        fg = moon.red,
        bg = "none",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "IncSearch", {
        fg = moon.bright,
        bg = "none",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "CurSearch", {
        fg = moon.red,
        bg = "none",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "Substitute", {
        fg = moon.red,
        bg = "none",
        bold = true,
      })

      -- Line numbers
      vim.api.nvim_set_hl(0, "LineNr", {
        fg = moon.darkred,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = moon.red,
        bg = "none",
        bold = true,
      })

      -- Diagnostics
      vim.api.nvim_set_hl(0, "DiagnosticError", {
        fg = moon.red,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "DiagnosticWarn", {
        fg = moon.orange,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "DiagnosticInfo", {
        fg = moon.moon,
        bg = "none",
      })

      -- ═══════════════════════════════════════
      --           BLOOD MOON UI
      -- ═══════════════════════════════════════

      local blood = "#ff3347"
      local blood2 = "#c92f40"
      local dark = "#6e2630"
      local moon = "#e6c8cc"
      local muted = "#80565d"
      local glow = "#ff6675"

      -- General UI
      vim.api.nvim_set_hl(0, "Normal", {
        fg = moon,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "NormalFloat", {
        fg = moon,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = blood,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = dark,
        bg = "none",
      })

      -- Cursor
      vim.api.nvim_set_hl(0, "CursorLine", {
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = blood,
        bold = true,
      })

      vim.api.nvim_set_hl(0, "LineNr", {
        fg = muted,
      })

      -- Statusline
      vim.api.nvim_set_hl(0, "StatusLine", {
        fg = moon,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "StatusLineNC", {
        fg = muted,
        bg = "none",
      })

      -- Tabs
      vim.api.nvim_set_hl(0, "TabLine", {
        fg = muted,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "TabLineSel", {
        fg = blood,
        bg = "none",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "TabLineFill", {
        bg = "none",
      })

      -- Popup menus
      vim.api.nvim_set_hl(0, "Pmenu", {
        fg = moon,
        bg = "none",
      })

      vim.api.nvim_set_hl(0, "PmenuSel", {
        fg = blood,
        bg = "none",
        bold = true,
      })

      -- Visual selection
      vim.api.nvim_set_hl(0, "Visual", {
        fg = moon,
        bg = "#3a141a",
      })

      -- Search
      vim.api.nvim_set_hl(0, "Search", {
        fg = blood,
        bg = "none",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "IncSearch", {
        fg = glow,
        bg = "none",
        bold = true,
      })

      -- Diagnostics
      vim.api.nvim_set_hl(0, "DiagnosticError", {
        fg = blood,
      })

      vim.api.nvim_set_hl(0, "DiagnosticWarn", {
        fg = "#d99a5e",
      })

      vim.api.nvim_set_hl(0, "DiagnosticInfo", {
        fg = moon,
      })

      vim.api.nvim_set_hl(0, "DiagnosticHint", {
        fg = "#b58bbd",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
        fg = "#c92f40",
        bg = "none",
        bold = true,
      })
    return {}
    end,
  },


    -- Icons
    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

