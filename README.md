
<h3 align="center">sarnai.nvim</h3>
<h6 align="center">ᠰᠠᠷᠠᠨᠠᠢ</h6>
<br/>
<p align="center">
  <a href="https://github.com/titembaatar/sarnai.nvim"><img src="https://img.shields.io/badge/SARNAI-NEOVIM-c7958d?style=for-the-badge&logo=github"></a>
  <a href="https://github.com/titembaatar/sarnai/blob/main/LICENSE"><img src="https://img.shields.io/badge/LICENSE-MIT-9d4a40?style=for-the-badge"></a>
</p>

---

> **This is the Neovim colorscheme repository for `sarnai`.**  
> The theme repository (including palettes, integrations, etc...) is at:  
> 👉 **[titembaatar/sarnai](https://github.com/titembaatar/sarnai)**  

---

## **🌿 About**
`sarnai.nvim` is a **pastel, nature-inspired Neovim colorscheme** inspired by **Mongolia's Nature**.  
It is **WCAG contrast-compliant**, with soft yet readable colors. 

---

## 📸 Screenshots
Coming soon !
- 🌑 Shono (Dark)
- 🌆 Udesh (Bright)
- 🌄 Olgoo (Light)

---

## ✨ Features
- **Neovim 0.8+** compatibility 
- **Three variants**:  
  - 🌑 `shono` (dark)  
  - 🌆 `udesh` (bright)  
  - 🌄 `olgoo` (light)  
- **LSP & Treesitter support** for better syntax highlighting
- **Integrations** with:
  - Telescope
  - blink.cmp 
  - LSP diagnostics
  - Oil.nvim
  - mini.nvim
  - and more...
- **Full Truecolor support** for both **GUI & TUI Neovim**

---

## 📦 Installation

### **lazy.nvim**
```lua
{
    "titembaatar/sarnai.nvim",
    name = "sarnai",
    config = function()
        require("sarnai").setup({
            variant = "shono", -- Options: "shono" | "udesh" | "olgoo"
        })
    end,
}
```

### **Packer.nvim** 
```lua
use {
  "titembaatar/sarnai.nim",
  config = function()
    require("sarnai").setup({
      variant = "shono", -- Options: "shono" | "udesh" | "olgoo"
    })
  end
}
```
> **🛠️ Note**: this should work, but I don't use Packer, so idk 🫥

---

## 🛠️ Configuration

You can customize `sarnai.nvim` using the `setup()` function.

### **Default Settings**
```lua
require("sarnai").setup({
    variant = "shono", -- Options: "shono" | "udesh" | "olgoo"

    styles = {
        bold = true,
        italic = true,
        underline = false,
        transparent = false,
    },

    filetypes = { -- Improve syntax highlighting for:
        lua = true,
        shell = true,
        markdown = true,
    },

    integrations = {
        treesitter = true,
        telescope = true,
        cmp = true,
        lsp = true,
        oil = true,
        mini = true,
    },

    highlight_groups = {
        Comment = { fg = "#FFD700", italic = false }, -- Example override
    },
})
```

---

## 🫱🏼‍🫲🏽 Contributing
PRs are welcome! If you'd like to help:
1. Fork the repository
2. Make changes and test
3. Open a pull request
Feel free to report any issues, suggest features, or submit fixes. Especially for `Olgoo`, I am not quite sure if I hit the mark with the colors.
