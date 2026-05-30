# nvim

## Environment

- Neovim: 0.11.0+
- Node.js: required for JavaScript / TypeScript / Vue tooling
- Go: required for Go LSP and formatting

## Supported languages

- Go
- Vue.js
- JavaScript
- TypeScript
- Markdown

Go, JavaScript, TypeScript, and Vue use Neovim's built-in LSP client.

Default LSP keymaps:

- `gd`: go to definition
- `gD`: go to declaration
- `gr`: references
- `gi`: implementation
- `K`: hover
- `<leader>rn`: rename
- `<leader>ca`: code action

## Installation
- [参考](https://namileriblog.com/mac/neovim/)

1. **Install neovim with homebrew**

    ```bash
    brew install neovim
    ```

2. **Install Package Manager**

    ```bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

    Then install plugins:

    ```vim
    :PackerSync
    ```

3. **Install im-select**

    ```bash
    brew tap daipeihust/tap
    brew install im-select
    ```

    ```
    which im-select
    ```

    以下のように出力されればインストールは完了です。
    ```
    /opt/homebrew/bin/im-select
    ```

    以下を実行して、init.luaに記載します。
    ```
    im-select
    ```

    `lua/plugins.lua`
    ```lua
    use 'keaising/im-select.nvim'
    ```

    ```commands
    :PackerInstall
    ```

    `init.lua`
    ```bash
    require('im_select').setup {
        default_im_select = "${im-selectの実行結果}"
    }
    ```


4. **Setup copilot**

    ```
    :Copilot setup
    ```

5. **Install RipGrep**

    ```bash
    brew install ripgrep
    ```

5. **Install tools with Mason**

    Open Mason:

    ```vim
    :Mason
    ```

    Required tools:

    - `gopls`
    - `vtsls`
    - `vue-language-server`
    - `prettier`
    - `biome`
    - `vale`
    - `golangci-lint`
    - `golines`

    `mason-lspconfig.nvim` installs the configured LSP servers automatically when possible.

6. **Health check**

    ```vim
    :checkhealth
    ```

    If Treesitter reports query or parser errors, update parsers:

    ```vim
    :TSUpdate
    ```


7. **Setup pug highlight**

    ```
    set ft=pug
    ```
