# Sarnai.nvim Configuration Guide

This document provides detailed information about the configuration options available in Sarnai.nvim.

## Basic Configuration

Here's a complete example of all available configuration options with their default values:

```lua
require("sarnai").setup({
  -- Theme style: "khavar" (dark) or "ovol" (light)
  style = "khavar",

  -- Enable transparent background
  transparent = false,

  -- Set terminal colors
  terminal_colors = true,

  -- Style options for different syntax elements
  styles = {
    -- Style for comments
    comments = { italic = true },

    -- Style for keywords
    keywords = { italic = true },

    -- Style for functions
    functions = {},

    -- Style for variables
    variables = {},
  },

  -- Plugin-specific configuration
  plugins = {
    -- Enable all plugins when not using lazy.nvim
    all = true,

    -- Auto-detect plugins with lazy.nvim
    auto = true,

    -- Individual plugin overrides
    mini = true,       -- mini.nvim modules
    trouble = true,    -- trouble.nvim
    which_key = true,  -- which-key.nvim
    telescope = true,  -- telescope.nvim
    fzf_lua = true,    -- fzf-lua
    git = true,        -- gitsigns.nvim and git integration
    zen_mode = true,   -- zen-mode.nvim
    nvim_dap = true,   -- nvim-dap
    blink_cmp = true,  -- blink.cmp
    snacks = true,     -- snacks.nvim
  },

  -- Enable caching (recommended for performance)
  cache = true,

  -- Function to override colors
  on_colors = function(colors)
    -- Example: Override pink accent color
    -- colors.sarnai = "#ffc0cb"

    -- Example: Make error color more visible
    -- colors.anis = "#ff0000"
  end,

  -- Function to override highlight groups
  on_highlights = function(highlights, colors)
    -- Example: Make comments more visible
    -- highlights.Comment = { fg = colors.subtle, style = { italic = true } }

    -- Example: Change the style of function calls
    -- highlights["@function.call"] = { fg = colors.bright, style = { bold = true } }
  end,
})
```

## Style Options

The `styles` option allows you to customize the appearance of different syntax elements. Available style properties:

- `italic` (boolean): Enable italic style
- `bold` (boolean): Enable bold style
- `underline` (boolean): Enable underline
- `undercurl` (boolean): Enable undercurl (usually for diagnostics)
- `strikethrough` (boolean): Enable strikethrough

Example:

```lua
styles = {
  comments = { italic = true },
  keywords = { bold = true, italic = true },
  functions = { bold = true },
  variables = {},
}
```

## Plugin Detection

Sarnai.nvim can automatically detect and apply highlights for supported plugins. It works in three ways:

1. **Auto Detection**: When `plugins.auto = true`, it uses lazy.nvim to automatically detect installed plugins.

2. **Manual Configuration**: You can explicitly enable or disable specific plugin highlights:

   ```lua
   plugins = {
     trouble = true,
     mini = false,
     -- other plugins...
   }
   ```

3. **All Plugins**: When `plugins.all = true` and you're not using lazy.nvim, all plugin highlights are enabled by default.

## Customizing Colors

The `on_colors` function allows you to override any colors in the palette:

```lua
on_colors = function(colors)
  -- Modify core palette colors
  colors.base = "#0f1419"  -- Darker background
  colors.text = "#ffffff"  -- Brighter text

  -- Modify accent colors
  colors.sarnai = "#ffa0a0"  -- Lighter pink
  colors.nuur = "#00a0ff"    -- Brighter blue
end
```

Available color keys:

**Base Colors:**
- `depth`: Deepest background
- `shadow`: Dark background
- `base`: Main background
- `surface`: Lighter background for UI elements
- `overlay`: Background for highlighted items
- `muted`: Subdued text (comments)
- `faded`: Faded text
- `subtle`: Secondary text
- `text`: Primary text
- `bright`: Bright text
- `none`: Special value for transparency

**Accent Colors:**
- `sarnai`: Soft pink accent (primary accent)
- `anis`: Red (errors)
- `chatsalgan`: Orange (warnings)
- `els`: Yellow (numbers, constants)
- `uvs`: Green (strings, success)
- `nuur`: Blue (functions)
- `mus`: Cyan (types)
- `yargui`: Purple (keywords)

## Customizing Highlights

The `on_highlights` function lets you override any highlight group:

```lua
on_highlights = function(highlights, colors)
  -- Change Normal text color and background
  highlights.Normal = { fg = colors.bright, bg = colors.depth }

  -- Make function calls bold
  highlights["@function.call"] = { fg = colors.nuur, style = { bold = true } }

  -- Custom highlight for TODO comments
  highlights["@comment.todo"] = { fg = "#ffffff", bg = colors.sarnai, style = { bold = true } }
end
```

## Caching

Sarnai.nvim uses caching to improve performance. If you're making frequent changes to the configuration during development, you may want to disable it temporarily:

```lua
cache = false
```

You can also clear the cache programmatically:

```lua
require("sarnai").clear_cache()
```

## Transparent Background

Enable transparent background with:

```lua
transparent = true
```

This will remove backgrounds from most UI elements, allowing your terminal background to show through.

## Terminal Colors

Sarnai.nvim sets terminal colors by default. You can disable this with:

```lua
terminal_colors = false
```
