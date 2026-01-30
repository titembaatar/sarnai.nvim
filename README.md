<h3 align="center">sarnai.nvim</h3>
<h6 align="center">ᠰᠠᠷᠠᠨᠠᠢ</h6>
<br/>
<p align="center">
  <a href="https://codeberg.org/titembaatar/sarnai.nvim"><img src="https://img.shields.io/badge/SARNAI-NEOVIM-c7958d?style=for-the-badge&logo=github"></a>
  <a href="https://codeberg.org/titembaatar/sarnai/blob/main/LICENSE"><img src="https://img.shields.io/badge/LICENSE-MIT-9d4a40?style=for-the-badge"></a>
</p>

> **This is the Neovim colorscheme repository for `sarnai`.**
> The theme repository (including palettes, integration, etc...) is at:
> **[titembaatar/sarnai](https://codeberg.org/titembaatar/sarnai)**

## Features

- Dark `Khavar` and light `Ovol` variants
- Aim to reduce eye strain
- Treesitter integration
- Some plugin compatibility
- Customisable
- Caching

## Installation
### Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  url = "https://codeberg.org/titembaatar/sarnai.nvim.git",
  lazy = false,
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- leave it empty to use the default settings
    style = "khavar",    -- khavar or ovol
    transparent = false, -- true enables transparent background
  },
}
```

## Screenshots
### Dark `Khavar`
![Khavar Theme](assets/khavar.png)

### Light `Ovol`
![Ovol Theme](assets/ovol.png)

## Usage
After installation, you can set the colorscheme using in your `init.lua`

```lua
vim.cmd.colorscheme("sarnai")        -- Default (follows `vim.o.background`)
vim.cmd.colorscheme("sarnai-khavar") -- Explicitly dark theme
vim.cmd.colorscheme("sarnai-ovol")   -- Light theme
```

## Configuration
`sarnai.nvim` comes with these defaults:

```lua
require("sarnai").setup({
  -- The theme style: "khavar" (dark) or "ovol" (light)
  style = "khavar",

  -- Enable transparent background
  transparent = false,

  -- Set terminal colors
  terminal_colors = true,

  -- Configure syntax highlighting styles
  styles = {
    -- Set to false to disable a style globally
    italic = true,
    bold = true,
    underline = true,
    undercurl = true,
    strikethrough = true,

    -- Specific syntax elements
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },

  -- Plugin integration
  plugins = {
    -- Enable all plugins by default (when not using lazy.nvim)
    all = true,

    -- Auto-detect plugins via lazy.nvim
    auto = true,

    -- Override specific plugins
    -- trouble = false,
  },

  -- Enable caching for better performance
  cache = true,

  -- Override colors
  on_colors = function(colors)
    -- Example: Customize the pink palette colors
    -- colors.palette.sarnai = "#e5a3ab"
    -- Example: Customize the syntax boolean elements
    -- colors.syntax.boolean = "#ff0000"
  end,

  -- Override highlights groups
  on_highlights = function(groups, colors)
    -- Example: Custom comment styling
    -- groups.Comment = { fg = colors.palette.muted, italic = true }
    -- Example: Custom mini.statusline highlights
    -- groups.MiniStatuslineModeInsert  = { bg = colors.palette.yargui },
  end,
})
```

## Supported Plugins
`sarnai.nvim` provides highlighting for the following plugins.

### Up to date
- [blink.cmp](https://github.com/saghen/blink.cmp) (completion)
- [trouble.nvim](https://github.com/folke/trouble.nvim) (diagnostics viewer)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) (markdown)
- [snacks.nvim](https://github.com/folke/snacks.nvim) (collection of QoL plugins)
  - snacks.dashboard
  - snacks.notifier
- [mini.nvim](https://github.com/echasnovski/mini.nvim) (collection of modules)
  - mini.surround
  - mini.diff
  - mini.files
  - mini.cursorword
  - mini.hipatterns
  - mini.indentscope
  - mini.statusline
  - mini.tabline

### No longer maintained
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (fuzzy finder)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) (fuzzy finder)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (git integration)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) (debugging)
- [which-key.nvim](https://github.com/folke/which-key.nvim) (keybindings)

## Contributing
This theme is personal so I will not contribute to add highlights to plugins
I do not use. However, feel free to make a pull request for that.
Regarding issues, report them, and I will take a look into it if time allows.

