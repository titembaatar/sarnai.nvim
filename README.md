
<h3 align="center">sarnai</h3>
<h6 align="center">ᠰᠠᠷᠠᠨᠠᠢ</h6>
<br/>
<p align="center">
  <a href="https://github.com/titembaatar/sarnai.nvim"><img src="https://img.shields.io/badge/SARNAI-NEOVIM-c7958d?style=for-the-badge&logo=github"></a>
  <a href="https://github.com/titembaatar/sarnai/blob/main/LICENSE"><img src="https://img.shields.io/badge/LICENSE-MIT-9d4a40?style=for-the-badge"></a>
</p>

sarnai (ᠰᠠᠷᠠᠨᠠᠢ) means "rose" in Mongolian, my favourite colour, but most of all, the name of my beloved wife.
She's the one who made the logo, helped find colors name, refined the palette to be more authentic. 

## 🇲🇳 Philosophy  
- **Readability First**: Good contrast for clarity, but soft enough for long sessions.  
- **Minimalist Spirit**: Sticking with terminal 16 colors and some variants for bgs and fgs.  
- **Green Tints**: Because I love green, and I'm tired of blues.

sarnai.nvim is a **soft colorscheme** inspired by **Mongolian nature and traditions** that my wife made me discovered and inspired me for this colorscheme.  

It features **three variants**:
- **🌑 Shono** (Night)
- **🌆 Udesh** (Evening)
- **🌄 Olgoo** (Morning)

> 🎨 **Soft contrasts • WCAG contrast compliance**

---

## ✨ Features
- **Pastel, nature-inspired palette**
- **Three variations**: `shono` (dark), `udesh` (bright), `olgoo` (light)
- **Soft contrasts for readability**
- **Supports treesitter, LSP, and statuslines**
- **Truecolor support for both GUI & TUI Neovim**
- **Terminal 16-ANSI color support** 🎨

---

## 📦 Installation

### **Lazy.nvim**
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

### **Packer** (untested)
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

### Manual Installation
Clone the repository into your Neovim config:
```sh
git clone https://github.com/titembaatar/sarnai.nvim ~/.config/nvim/pack/plugins/start/sarnai.nvim
```
Then, in your `init.lua`:
```lua
require("sarnai").setup({ variant = "shono" })
```

---

## 🚀 Usage
Sarnai automatically applies the colorscheme when loaded.
If you need to manually switch variants, use:
```lua
require("sarnai").setup({ variant = "udesh" })
```
or
```vim
:colorscheme sarnai
```

---

## 📸 Screenshots
🌑 Shono (Dark)

🌆 Udesh (Bright)

🌄 Olgoo (Light)

---

## 🛠️ Contributing
PRs are welcome! If you'd like to help:
1. Fork the repository 🍴
2. Make changes & test in Neovim 🛠️
3. Open a pull request 🚀
