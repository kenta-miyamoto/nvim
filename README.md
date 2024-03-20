# nvim

## enviroment
- node versions : 18.12.1

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


6. **Setup pug highlight**

    ```
    set ft=pug
    ```

