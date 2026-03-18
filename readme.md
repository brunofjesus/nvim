# NeoVim Configuration

## Warning
I'm trying new key combinations, so this might be outdated. `<leader>sk` will open all keybindings.

This NeoVim configuration is mostly used for GoLang coding.

## Keybindings

- NORMAL mode

```help
`<Esc>`        - Clear search highlights
`]b` / `L`     - Go to next buffer
`[b` / `H`     - Go to previous buffer
`<leader>tc`   - Create new tab
`<leader>tn`   - Go to next tab
`<leader>tp`   - Go to previous tab
`<leader>wv`   - Split window vertically
`<leader>wh`   - Split window horizontally
`<leader>we`   - Make splits equal size
`<leader>wd`   - Delete buffer
`<leader>wo`   - Delete other buffers
`<leader>wa`   - Delete all buffers
`<leader>wx`   - Close current split
`<C-Up>`       - Increase window height
`<C-Down>`     - Decrease window height
`<C-Left>`     - Decrease window width
`<C-Right>`    - Increase window width
`<A-h>`        - Go to far left split
`<A-l>`        - Go to far right split
`<C-h/j/k/l>`  - Navigate between splits (or Zellij panes when in Zellij)
`<leader>z`    - Toggle zen mode
`<leader>Z`    - Toggle zen zoom mode
`<leader>.`    - Toggle scratch buffer
`<leader>S`    - Select scratch buffer
`<leader>n`    - Notification history
`<leader>un`   - Dismiss all notifications
`<leader>cR`   - Rename file
`<leader>gB`   - Git browse
`<leader>gb`   - Git blame line
`<leader>gf`   - Lazygit current file history
`<leader>gg`   - Lazygit
`<leader>gl`   - Lazygit log
`<leader>gw`   - List GitHub workflows
`<C-/>`        - Toggle terminal
`<leader>us`   - Toggle spelling
`<leader>uw`   - Toggle wrap
`<leader>ul`   - Toggle line number
`<leader>uL`   - Toggle relative number
`<leader>uc`   - Toggle conceal
`<leader>uT`   - Toggle Treesitter highlight
`<leader>ub`   - Toggle dark mode
`<leader>uh`   - Toggle inlay hints
`<leader>ug`   - Toggle indent
`<leader>uD`   - Toggle dim
```

## Plugins

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

### Bufferline
[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
Shows buffers as "tabs" on the top portion of the editor.

#### Keybindings

- NORMAL mode

```help
`]b` / `L`   - Go to next buffer
`[b` / `H`   - Go to previous buffer
`<leader>tc` - Create new tab
`<leader>tn` - Go to next tab
`<leader>tp` - Go to previous tab
```

### Catppuccin
[catppuccin/nvim](https://github.com/catppuccin/nvim)
Applies the Catppuccin theme to NeoVim. Using the `frappe` flavor.

### GitSigns
[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Git decorations.

### Lualine
[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Status line.

### blink-cmp
[Saghen/blink.cmp](https://github.com/Saghen/blink.cmp)
Completion engine for neovim. Sources: copilot, LSP, path, snippets, buffer.

#### Keybindings

- INSERT mode

```help
`<Tab>`     - Accept completion
`<CR>`      - Accept completion
`<C-y>`     - Select and accept
`<C-space>` - Open menu / toggle docs
`<C-e>`     - Hide menu
`<C-n>` / `<C-j>` / `<Down>` - Select next item
`<C-p>` / `<C-k>` / `<Up>`   - Select previous item
`<C-b>`     - Scroll docs up
`<C-f>`     - Scroll docs down
`<C-l>`     - Toggle signature help
```

### copilot.lua
[zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
AI completion powered by GitHub Copilot. Uses `claude-sonnet-4` as the model.
Integrated into blink-cmp as the `copilot` source.

### claudecode.nvim
[coder/claudecode.nvim](https://github.com/coder/claudecode.nvim)
Claude Code integration for Neovim. Conditionally loaded.

#### Keybindings

- NORMAL mode

```help
`<C-.>`      - Toggle Claude
`<leader>ac` - Toggle Claude
`<leader>af` - Focus Claude
`<leader>ar` - Resume Claude
`<leader>aC` - Continue Claude
`<leader>am` - Select Claude model
`<leader>ab` - Add current buffer
`<leader>as` - Send selection to Claude (VISUAL) / Add file (file trees)
`<leader>aa` - Accept diff
```

### opencode.nvim
[NickvanDyke/opencode.nvim](https://github.com/NickvanDyke/opencode.nvim)
opencode AI integration for Neovim. Conditionally loaded.

#### Keybindings

- NORMAL/VISUAL mode

```help
`<C-a>`      - Ask opencode about current context
`<C-x>`      - Execute opencode action
`<leader>as` - Add current context to opencode
`<leader>ac` - Toggle opencode
`<C-.>`      - Toggle opencode
```

### nvim-treesitter
[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
Treesitter integration for Neovim.

#### Parsers
 - json
 - javascript
 - typescript
 - tsx
 - yaml
 - html
 - css
 - markdown
 - markdown_inline
 - graphql
 - bash
 - lua
 - vim
 - dockerfile
 - gitignore
 - query
 - go
 - templ
 - gomod
 - just
 - helm
 - proto
 - mermaid

### vim-zellij-navigator
[swaits/zellij-nav.nvim](https://github.com/swaits/zellij-nav.nvim)
Seamless navigation between Neovim splits and Zellij panes. Conditionally loaded when running inside Zellij (replaces the plain `<C-h/j/k/l>` window navigation).

#### Keybindings

- NORMAL mode

```help
`<C-h>` - Navigate left (or to left Zellij pane/tab)
`<C-j>` - Navigate down
`<C-k>` - Navigate up
`<C-l>` - Navigate right (or to right Zellij pane/tab)
```

### which-key.nvim
[folke/which-key.nvim](https://github.com/folke/which-key.nvim)
Displays a popup with possible key bindings of the command you started typing.

### nvim-lspconfig
[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
Official Neovim LSP Config.

#### Other dependencies
- antosha417/nvim-lsp-file-operations

#### LSP configurations
- html
- ts_ls
- cssls
- graphql
- emmet_ls
- lua_ls
- gopls
- templ

#### Keybindings

- NORMAL mode

```help
`gra`        - Code action
`grd`        - Go to definition
`grn`        - Smart rename
`grr`        - Show references
`gri`        - Go to implementation
`grt`        - Go to type definition
`gO` / `<leader>o` - LSP symbols
`gf`         - Format current file
`[d`         - Go to previous diagnostic
`]d`         - Go to next diagnostic
`K`          - Show documentation for what is under cursor
`<leader>rs` - Restart LSP
```

### mason
[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
Package manager for neovim.

Installs the following tools:

- LSP
   - ts_ls
   - html
   - cssls
   - lua_ls
   - graphql
   - emmet_ls
- Tools
   - prettier
   - stylua
   - eslint_d
   - gopls
   - gofumpt
   - golines
   - gotests
   - delve
   - golangci-lint
   - templ
   - mmdc

### nvim-lint
[mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
Linter integration for Neovim. Lints JavaScript/TypeScript with `eslint_d` and Go with `golangci-lint`.

#### Keybindings

- NORMAL mode

```help
`<leader>li` - Trigger linting for current file
`<leader>ui` - Toggle auto-linting
```

### godoc.nvim
[fredrikaverpil/godoc.nvim](https://github.com/fredrikaverpil/godoc.nvim)
Go documentation picker using snacks.nvim.

#### Keybindings

- NORMAL mode

```help
`<leader>sG` - Open GoDoc picker
```

### render-markdown.nvim
[MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
Renders markdown in Neovim buffers.

### snacks.nvim
[folke/snacks.nvim](https://github.com/folke/snacks.nvim)
A collection of small QoL plugins for Neovim. Handles file picking, terminal, notifications, git integration, zen mode, scratch buffers, LSP pickers, file explorer, and more.

#### Keybindings

- NORMAL mode

```help
`<leader><space>` - Find files
`<leader>,`       - Buffers
`<leader>/`       - Grep
`<leader>:`       - Command history
`<leader>e`       - File explorer
`<leader>ff`      - Find files
`<leader>fg`      - Find git files
`<leader>fr`      - Recent files
`<leader>fb`      - Buffers
`<leader>fc`      - Find config file
`<leader>fs`      - Grep
`<leader>sb`      - Buffer lines
`<leader>sB`      - Grep open buffers
`<leader>sw`      - Grep word / visual selection
`<leader>s"`      - Registers
`<leader>sa`      - Autocmds
`<leader>sc`      - Command history
`<leader>sC`      - Commands
`<leader>sd`      - Buffer diagnostics
`<leader>sD`      - Workspace diagnostics
`<leader>sh`      - Help pages
`<leader>sj`      - Jumps
`<leader>sk`      - Keymaps
`<leader>sl`      - Location list
`<leader>sM`      - Man pages
`<leader>sm`      - Marks
`<leader>sR`      - Resume last picker
`<leader>sq`      - Quickfix list
`<leader>sx`      - Smart pick
`<leader>sG`      - GoDoc picker
`<leader>uC`      - Colorschemes
`<leader>qp`      - Projects
`[[` / `]]`       - Prev/Next word reference
`K`               - Show image under cursor
-- LSP (via snacks picker)
`gra`             - Code action
`grd`             - Go to definition
`grn`             - Rename
`grr`             - References
`gri`             - Go to implementation
`grt`             - Go to type definition
`gO` / `<leader>o` - LSP symbols
```

### OSC11.nvim
[afonsofrancof/OSC11.nvim](https://github.com/afonsofrancof/OSC11.nvim)
Automatically switches between dark and light Catppuccin themes based on the terminal's background color (OSC 11 response). Conditionally loaded.

### nvim-dap
[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
Debug Adapter Protocol (DAP) client for Neovim.

#### Keybindings

- NORMAL mode

```help
`<F5>`        - DAP Continue
`<F2>`        - DAP Step Over
`<F3>`        - DAP Step Into
`<F4>`        - DAP Step Out
`<F8>`        - DAP Run To Cursor
`<F10>`       - DAP Terminate
`<leader>db`  - DAP Toggle Breakpoint
`<leader>dB`  - DAP Set Breakpoint
```

### nvim-dap-ui
[rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
UI for `nvim-dap`.

### nvim-dap-go
[leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
Extension to `nvim-dap` providing compatibility with the `go debugger` (`delve`).

#### Keybindings

- NORMAL mode

```help
`<leader>dgt` - Debug Test
`<leader>dgl` - Debug Last Test
```
