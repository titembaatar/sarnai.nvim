# TODO.md

- [X] **Project Setup**
  - [X] **Initialize GitHub Repository**
    - [X] Create a new GitHub repository for the project.
    - [X] Add a proper LICENSE, README.md, and .gitignore file.
  - [X] **Directory Structure**
    - [X] Create a root directory named `mycolorscheme/` with the following structure:
      ```
      mycolorscheme/
      ├── lua/
      │   └── mycolorscheme/
      │       ├── init.lua
      │       ├── config.lua
      │       ├── palettes/
      │       │   ├── shono.lua
      │       │   ├── udesh.lua
      │       │   └── ogloo.lua
      │       └── highlights/
      │           ├── core.lua
      │           └── plugins/
      │               ├── plugin1.lua
      │               ├── plugin2.lua
      │               └── … (one file per supported plugin)
      └── README.md
      ```

- [x] **Palette Definition**
  - [x] **Create Palette Files**
    - [x] Create a `palettes/` directory under `lua/mycolorscheme/`.
    - [x] Create three Lua files: `shono.lua`, `udesh.lua`, and `ogloo.lua`.
    - [x] Paste the provided color tables into the respective files.

- [x] **Core Plugin Code**
  - [x] **Main Initialization File (`init.lua`)**
    - [x] Load the user configuration from `config.lua`.
    - [x] Allow selection of the palette variant (e.g., via a config option).
    - [x] Load the chosen palette from the `palettes/` directory.
    - [x] Set up Neovim’s highlight groups using the colors from the palette.
  - [x] **Configuration File (`config.lua`)**
    - [x] Define default settings (e.g., default palette variant, highlight overrides).
    - [x] Provide a mechanism for users to override these defaults easily.

- [x] **Highlight Groups**
  - [x] **Core Highlights**
    - [x] Create `highlights/core.lua`.
    - [x] Define functions to set Neovim’s built-in highlight groups using the palette.
  - [x] **Plugin-Specific Highlights**
    - [x] Create a `highlights/plugins/` directory.
    - [x] For each supported plugin, create a Lua file (e.g., `plugin1.lua`, `plugin2.lua`) that defines its specific highlights.
    - [x] Ensure that each plugin highlight file is modular for easier maintenance.

- [x] **Auto-loading of Plugin Highlights**
  - [x] **Detection Logic**
    - [x] Add logic in the core initialization to detect if a supported plugin is installed.
    - [x] Automatically load the corresponding plugin highlight file if the plugin is detected.
  - [x] **Lazy Loading Compatibility**
    - [x] Integrate auto-loading with `folke/lazy.nvim` by following its best practices.

- [ ] **Integration with folke/lazy.nvim**
  - [ ] **Lazy Plugin Specification**
    - [ ] Create a specification table in your plugin (or in a separate file) that complies with `folke/lazy.nvim` standards.
    - [ ] Ensure the colorscheme can be lazy-loaded and configured per the [folke/lazy.nvim developers guidelines](https://lazy.folke.io/developers).
  - [ ] **Modular Configuration**
    - [ ] Design the plugin configuration so that lazy-loading of plugin highlights and additional features is seamless and modular.

- [ ] **Testing and Iteration**
  - [ ] **Local Testing**
    - [ ] Test the colorscheme by loading it in Neovim and switching between palette variants.
    - [ ] Verify that Neovim’s core highlights and the additional plugin highlights load correctly.
  - [ ] **User Customization Testing**
    - [ ] Test customization options by overriding defaults in the configuration file.
  - [ ] **Iterate**
    - [ ] Refine the code structure and highlight definitions based on test results.

- [ ] **Documentation and Open Sourcing**
  - [ ] **Documentation**
    - [ ] Update the README.md with installation instructions, usage examples, configuration options, and guidance on extending highlights.
    - [ ] Document how the auto-loading of plugin highlights works and how users can add support for additional plugins.
  - [ ] **Contribution Guidelines**
    - [ ] Provide guidelines for contributions, bug reports, and feature requests.
  - [ ] **Final Repository Setup**
    - [ ] Ensure all code is committed.
    - [ ] Push the repository to GitHub and add any relevant tags or releases.
