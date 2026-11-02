-- Options: m = math, t = text (neither = anywhere), A = auto-expand,
--          r = regex (Lua pattern, %1 = first capture), w = word boundary
-- Replacement: $1 $2 = tab stops, ${1:text} = default, $0 = final cursor

local snippets = {
  -- Math mode
  { trigger = "dm", replacement = "$$\n$1\n$$", options = "tAw" },

  -- Greek letters
  { trigger = "alpha", replacement = "\\alpha", options = "mAw" },
  { trigger = "beta", replacement = "\\beta", options = "mAw" },
  { trigger = "gamma", replacement = "\\gamma", options = "mAw" },
  { trigger = "Gamma", replacement = "\\Gamma", options = "mAw" },
  { trigger = "delta", replacement = "\\delta", options = "mAw" },
  { trigger = "Delta", replacement = "\\Delta", options = "mAw" },
  { trigger = "epsilon", replacement = "\\epsilon", options = "mAw" },
  { trigger = "varepsilon", replacement = "\\varepsilon", options = "mAw" },
  { trigger = "zeta", replacement = "\\zeta", options = "mAw" },
  { trigger = "eta", replacement = "\\eta", options = "mAw" },
  { trigger = "theta", replacement = "\\theta", options = "mAw" },
  { trigger = "vartheta", replacement = "\\vartheta", options = "mAw" },
  { trigger = "Theta", replacement = "\\Theta", options = "mAw" },
  { trigger = "iota", replacement = "\\iota", options = "mAw" },
  { trigger = "kappa", replacement = "\\kappa", options = "mAw" },
  { trigger = "lambda", replacement = "\\lambda", options = "mAw" },
  { trigger = "Lambda", replacement = "\\Lambda", options = "mAw" },
  { trigger = "mu", replacement = "\\mu", options = "mAw" },
  { trigger = "nu", replacement = "\\nu", options = "mAw" },
  { trigger = "xi", replacement = "\\xi", options = "mAw" },
  { trigger = "Xi", replacement = "\\Xi", options = "mAw" },
  { trigger = "pi", replacement = "\\pi", options = "mAw" },
  { trigger = "Pi", replacement = "\\Pi", options = "mAw" },
  { trigger = "rho", replacement = "\\rho", options = "mAw" },
  { trigger = "varrho", replacement = "\\varrho", options = "mAw" },
  { trigger = "sigma", replacement = "\\sigma", options = "mAw" },
  { trigger = "Sigma", replacement = "\\Sigma", options = "mAw" },
  { trigger = "tau", replacement = "\\tau", options = "mAw" },
  { trigger = "upsilon", replacement = "\\upsilon", options = "mAw" },
  { trigger = "phi", replacement = "\\phi", options = "mAw" },
  { trigger = "varphi", replacement = "\\varphi", options = "mAw" },
  { trigger = "Phi", replacement = "\\Phi", options = "mAw" },
  { trigger = "chi", replacement = "\\chi", options = "mAw" },
  { trigger = "psi", replacement = "\\psi", options = "mAw" },
  { trigger = "Psi", replacement = "\\Psi", options = "mAw" },
  { trigger = "omega", replacement = "\\omega", options = "mAw" },
  { trigger = "Omega", replacement = "\\Omega", options = "mAw" },

  -- Text environment
  { trigger = "text", replacement = "\\text{$1}", options = "mAw" },

  -- Basic operations
  { trigger = "sr", replacement = "^{2}", options = "mA" },
  { trigger = "cb", replacement = "^{3}", options = "mA" },
  { trigger = "inv", replacement = "^{-1}", options = "mA" },
  { trigger = "tp", replacement = "^{\\top}", options = "mA" },
  { trigger = "_", replacement = "_{$1}", options = "mA" },
  { trigger = "^", replacement = "^{$1}", options = "mA" },
  { trigger = "(%a)(%d)", replacement = "%1_{%2}", options = "rmA" },
  { trigger = "sq", replacement = "\\sqrt{$1}", options = "mAw" },
  { trigger = "ee", replacement = "e^{$1}", options = "mAw" },
  { trigger = "//", replacement = "\\frac{$1}{$2}", options = "mA" },
  { trigger = "([%w\\]+)/", replacement = "\\frac{%1}{$1}", options = "rmA" },
  { trigger = "%(([^()]*)%)/", replacement = "\\frac{%1}{$1}", options = "rmAw" },

  -- Fonts
  { trigger = "bf", replacement = "\\mathbf{$1}", options = "mAw" },
  { trigger = "cal", replacement = "\\mathcal{$1}", options = "mAw" },
  { trigger = "bb", replacement = "\\mathbb{$1}", options = "mAw" },
  { trigger = "rm", replacement = "\\mathrm{$1}", options = "mAw" },
  { trigger = "(%u)c", replacement = "\\mathcal{%1}", options = "rmAw" },
  { trigger = "(%u)b", replacement = "\\mathbb{%1}", options = "rmAw" },

  -- More operations
  { trigger = "hat", replacement = "\\hat{$1}", options = "mAw" },
  { trigger = "bar", replacement = "\\bar{$1}", options = "mAw" },
  { trigger = "vec", replacement = "\\vec{$1}", options = "mAw" },
  { trigger = "(%a)hat", replacement = "\\hat{%1}", options = "rmAw" },
  { trigger = "(%a)bar", replacement = "\\bar{%1}", options = "rmAw" },
  { trigger = "(%a)vec", replacement = "\\vec{%1}", options = "rmAw" },

  -- Symbols
  { trigger = "infty", replacement = "\\infty", options = "mAw" },
  { trigger = "sum", replacement = "\\sum", options = "mAw" },
  { trigger = "prod", replacement = "\\prod", options = "mAw" },
  { trigger = "lim", replacement = "\\lim_{${1:n} \\to ${2:\\infty}}", options = "mAw" },
  { trigger = "+-", replacement = "\\pm", options = "mA" },
  { trigger = "...", replacement = "\\dots", options = "mA" },
  { trigger = "nabla", replacement = "\\nabla", options = "mAw" },
  { trigger = "xx", replacement = "\\times", options = "mAw" },
  { trigger = "**", replacement = "\\cdot", options = "mA" },

  { trigger = "!=", replacement = "\\neq", options = "mA" },
  { trigger = ">=", replacement = "\\geq", options = "mA" },
  { trigger = "<=", replacement = "\\leq", options = "mA" },
  { trigger = "~~", replacement = "\\approx", options = "mA" },

  { trigger = "->", replacement = "\\to", options = "mA" },
  { trigger = "=>", replacement = "\\implies", options = "mA" },
  { trigger = "iff", replacement = "\\iff", options = "mAw" },

  { trigger = "inn", replacement = "\\in", options = "mAw" },
  { trigger = "AA", replacement = "\\forall", options = "mAw" },
  { trigger = "EE", replacement = "\\exists", options = "mAw" },

  -- Derivatives and integrals
  { trigger = "dd", replacement = "\\mathrm{d}", options = "mAw" },
  { trigger = "par", replacement = "\\partial", options = "mAw" },
  { trigger = "pd", replacement = "\\frac{\\partial $1}{\\partial $2}", options = "mAw" },
  { trigger = "int", replacement = "\\int", options = "mAw" },
  { trigger = "iint", replacement = "\\iint", options = "mAw" },
  { trigger = "oint", replacement = "\\oint", options = "mAw" },

  -- Quantum mechanics
  { trigger = "dg", replacement = "^{\\dagger}", options = "mA" },
  { trigger = "bra", replacement = "\\bra{$1}", options = "mAw" },
  { trigger = "ket", replacement = "\\ket{$1}", options = "mAw" },
  { trigger = "brk", replacement = "\\braket{$1}{$2}", options = "mAw" },

  -- Environments
  { trigger = "begin", replacement = "\\begin{$1}\n\t$0\n\\end{$1}", options = "Aw" },
  { trigger = "pmat", replacement = "\\begin{pmatrix}\n\t$1\n\\end{pmatrix}", options = "mAw" },
  { trigger = "cases", replacement = "\\begin{cases}\n\t$1\n\\end{cases}", options = "mAw" },

  -- Brackets
  { trigger = "lr(", replacement = "\\left( $1 \\right)", options = "mAw" },
  { trigger = "lr[", replacement = "\\left[ $1 \\right]", options = "mAw" },
  { trigger = "lr{", replacement = "\\left\\{ $1 \\right\\}", options = "mAw" },
  { trigger = "lr<", replacement = "\\left\\langle $1 \\right\\rangle", options = "mAw" },
  { trigger = "lr|", replacement = "\\left| $1 \\right|", options = "mAw" },
  { trigger = "<>", replacement = "\\langle $1 \\rangle", options = "mA" },
  { trigger = "abs", replacement = "\\lvert $1 \\rvert", options = "mAw" },
  { trigger = "norm", replacement = "\\lVert $1 \\rVert", options = "mAw" },
  { trigger = "set", replacement = "\\{ $1 \\}", options = "mAw" },
}

local ls = require "luasnip"
local closing = { ["("] = ")", ["["] = "]", ["{"] = "}" }

-- Get the context of the cursor as "math", "text" or "code"
local function cursor_context()
  -- .tex: ask VimTeX
  if vim.bo.filetype == "tex" then return vim.fn["vimtex#syntax#in_mathzone"]() == 1 and "math" or "text" end

  -- .md: ask treesitter
  local parser = vim.treesitter.get_parser(0, nil, { error = false })
  if not parser then return "text" end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row, col = row - 1, math.max(col - 1, 0)
  parser:parse { row, row + 1 }
  local lang = parser:language_for_range({ row, col, row, col }):lang()

  if lang == "latex" then return "math" end
  if lang == "markdown" or lang == "markdown_inline" then return "text" end
  return "code"
end

local function to_snippet(s)
  local function has(letter) return s.options:find(letter, 1, true) ~= nil end
  local context = has "m" and "math" or has "t" and "text" or nil

  -- Expand only in the right context, and not after a typed backslash
  local function should_expand(line, match)
    if line:sub(-#match - 1, -#match - 1) == "\\" then return false end
    return context == nil or cursor_context() == context
  end

  -- Remove the trigger, plus the ")" autopairs added after "lr("
  local function remove_trigger(_, _, match)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local char_after = vim.api.nvim_get_current_line():sub(col + 1, col + 1)
    local stop = closing[match:sub(-1)] == char_after and col + 1 or col
    return { clear_region = { from = { row - 1, col - #match }, to = { row - 1, stop } } }
  end

  -- LuaSnip treats \ as an escape, so double it; %1 becomes the regex capture
  local body = s.replacement:gsub("\\", "\\\\"):gsub("%%(%d)", "${LS_CAPTURE_%1}")

  return ls.parser.parse_snippet({
    trig = s.trigger,
    trigEngine = has "r" and "pattern" or "plain",
    wordTrig = has "w",
    snippetType = has "A" and "autosnippet" or "snippet",
    hidden = has "A", -- autosnippets stay out of the completion menu
    condition = should_expand,
    resolveExpandParams = remove_trigger,
  }, body)
end

return vim.tbl_map(to_snippet, snippets)
