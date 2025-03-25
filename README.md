# 🌸 Sarnai.nvim

A simple yet elegant Neovim colorscheme inspired by Mongolian nature's.

## ✨ Features

- Two variants: 🌙 **Khavar** (dark) and ☀️ **Ovol** (light)
- Aim to reduced eye strain
- Highlights support
- Fully configurable

## 📥 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "titembaatar/sarnai.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "khavar", -- khavar or ovol
    transparent = false, -- true enables transparent background
  },
}
```

## 📸 Screenshots

### Khavar (Dark Theme)
![Khavar Theme](assets/khavar.png)

### Ovol (Light Theme)
![Ovol Theme](assets/ovol.png)

## 🎨 Usage

After installation, you can set the colorscheme using:

```lua
-- In your init.lua
vim.cmd.colorscheme("sarnai")       -- Default (khavar/dark)
-- or
vim.cmd.colorscheme("sarnai-khavar") -- Explicitly dark theme
-- or
vim.cmd.colorscheme("sarnai-ovol")   -- Light theme
```

## ⚙️ Configuration

Sarnai.nvim comes with the following defaults:

```lua
require("sarnai").setup({
  style = "khavar", -- The theme comes in 2 styles: "khavar" (dark) and "ovol" (light)
  transparent = false, -- Enable transparent background
  terminal_colors = true, -- Set terminal colors
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
  plugins = {
    -- Enable all plugins when not using lazy.nvim
    -- Set to false to manually enable/disable plugins
    all = true,
    -- Uses your plugin manager to automatically enable needed plugins
    -- Currently only lazy.nvim is supported
    auto = true,
    -- Override specific plugins here
    -- mini = true,
    -- trouble = true,
    -- etc.
  },
  cache = true, -- Enable caching by default
  -- Override colors
  on_colors = function(colors)
    -- Change any colors here
    -- colors.sarnai = "#f0c3cb"
  end,
  -- Override highlights
  on_highlights = function(highlights, colors)
    -- Change any highlight groups here
    -- highlights.Comment = { fg = colors.muted, bg = colors.none, style = { italic = true } }
  end,
})
```

## 🌟 Supported Plugins

Sarnai.nvim provides enhanced highlighting for:

- [mini.nvim](https://github.com/echasnovski/mini.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [blink.cmp](https://github.com/saghen/blink.cmp)

## 🎭 Color Palette

### Khavar (Dark Theme)
- **Base Colors**
  - shadow: Deep background
  - base: Main background
  - surface: Slightly lighter background
  - overlay: Background for highlighted items
  - muted: Subdued text (comments)
  - subtle: Secondary text
  - text: Primary text

- **Accent Colors**
  - sarnai: "#f0c3cb" (Soft pink accent)
  - anis: "#ff6b6b" (Error, warnings)
  - chatsalgan: "#e5951a" (Warnings)
  - els: "#cca24d" (Numbers, constants)
  - uvs: "#80b946" (Strings, success)
  - nuur: "#2b879e" (Functions)
  - mus: "#9deaea" (Types)
  - yargui: "#d5b3e5" (Keywords)

### Ovol (Light Theme)
- Automatically derived from Khavar with intelligent color inversions and contrast adjustments

## 🤝 Contributing

Contributions are welcome! Feel free to report issues, suggest features, or submit pull requests.

## 📜 License

MIT License
