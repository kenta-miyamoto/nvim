# nvim

Go、Vue.js、JavaScript、TypeScript、Markdownをよく使うためのNeovim設定です。

## 環境

- Neovim: 0.12+（プラグイン管理に組み込みの `vim.pack` を使用）
- Node.js: JavaScript / TypeScript / VueのLSPやformatterで必要
- Go: GoのLSPやformatterで必要
- ripgrep: Telescopeの全文検索で必要
- tree-sitter CLI: nvim-treesitter（mainブランチ）がparserをコンパイルするのに必要
- im-select: macOSで入力ソースを切り替えるために使用

プラグインは `vim.pack`（Neovim 0.12 組み込み）で管理しており、Packerは不要です。
初回起動時に `~/.local/share/nvim/site/pack/core/opt` へ自動でインストールされます。

## セットアップ

基本的には以下だけでセットアップできます。

```bash
make setup
```

個別に実行したい場合:

```bash
make deps
make plugins
make tools
make treesitter
make check
```

Mason toolのインストール待ち時間を増やしたい場合:

```bash
make tools MASON_INSTALL_WAIT=180
```

手動でセットアップする場合は以下を実行します。

1. Neovimをインストールします。

    ```bash
    brew install neovim
    ```

2. 外部コマンドをインストールします。

    ```bash
    brew install ripgrep
    brew install tree-sitter-cli
    brew tap daipeihust/tap
    brew install im-select
    ```

3. Neovimを開きます。プラグインは `vim.pack` により初回起動時に自動でインストールされます。

    ```bash
    nvim
    ```

4. Masonのツールを確認します。

    ```vim
    :Mason
    ```

    必要なツール:

    - `lua-language-server`
    - `gopls`
    - `rust-analyzer`
    - `vtsls`
    - `vue-language-server`
    - `ruby-lsp`
    - `prettier`
    - `biome`
    - `vale`
    - `golangci-lint`
    - `golines`

    LSP serverは `mason-lspconfig.nvim` により、可能なものは自動でインストールされます
    （headlessの `make tools` では上記を明示的にインストールします）。

5. 環境を確認します。

    ```vim
    :checkhealth
    ```

    Treesitterのqueryやparserエラーが出る場合は、parserを更新します。

    ```vim
    :TSUpdate
    ```

## Makefile targets

| Target | 内容 |
| --- | --- |
| `make setup` | 依存関係、plugin、Mason tool、Treesitter parserを入れて確認まで実行する |
| `make deps` | Homebrewが使える場合にNeovim、ripgrep、tree-sitter CLI、im-selectを入れる |
| `make plugins` | `vim.pack` でpluginをインストールする |
| `make tools` | Masonで必要なLSP / formatter / linterを入れる |
| `make treesitter` | Treesitter parserをインストールする |
| `make smoke` | Go / JavaScript / Markdownの簡易起動確認をする |
| `make health` | `:checkhealth` を実行し、結果を `/tmp/nvim-health.txt` に出力する |
| `make check` | `make smoke` と `make health` を実行する |

## 対応言語

- Go: `gopls`
- JavaScript / TypeScript: `vtsls`
- Vue.js: `vue_ls` + `vtsls`
- Lua: `lua_ls`
- Rust: `rust_analyzer`
- Ruby: `ruby_lsp`
- Markdown: Treesitter highlight、Prettier format、Vale lint

補完は `blink.cmp`（LSP / path / snippets / buffer）を使用します。

## 基本操作

### サイドバー

| キー | 操作 |
| --- | --- |
| `<C-e>` | ファイルサイドバーを開く / 閉じる |
| `<C-b>` | buffer一覧のサイドバーを開く |
| `\` | 現在開いているファイルをサイドバー上で表示する |

サイドバー内の操作:

| キー | 操作 |
| --- | --- |
| `<Enter>` | ファイルまたはディレクトリを開く |
| `S` | 横分割で開く |
| `s` | 縦分割で開く |
| `t` | 新しいtabで開く |
| `a` | ファイルを追加する |
| `A` | ディレクトリを追加する |
| `r` | 名前を変更する |
| `d` | 削除する |
| `q` | サイドバーを閉じる |

### 検索

| キー | 操作 |
| --- | --- |
| `<C-f>` | Git管理下のファイルを検索する |
| `<C-g>` | ripgrepで文字列検索する |
| `<leader>gs` | Git statusを開く |
| `<leader>gl` | Git commit logを開く |

`<leader>` はspaceです。

### tabとwindow

| キー | 操作 |
| --- | --- |
| `<C-t>` | 新しいtabを開く |
| `<C-n>` | 次のtabへ移動する |
| `<C-p>` | 前のtabへ移動する |
| `<C-q>` | 現在のtabを閉じる |
| `gh` | 左のwindowへ移動する |
| `gj` | 下のwindowへ移動する |
| `gk` | 上のwindowへ移動する |
| `gl` | 右のwindowへ移動する |
| `<C-,>` | windowの横幅を広げる |
| `<C-<>` | windowの横幅を狭める |
| `<C-.>` | windowの高さを広げる |
| `<C->>` | windowの高さを狭める |

### 編集

| キー | 操作 |
| --- | --- |
| `jj` | insert modeからnormal modeへ戻る |
| `っｊ` | 日本語入力中にinsert modeからnormal modeへ戻る |
| `<C-a>` | 全選択する |
| `x` | yankせずに1文字削除する |
| `;` | command modeに入る |

## コードジャンプ

LSPのkeymapは、LSP serverが現在のbufferにattachした後に有効になります。

| キー | 操作 |
| --- | --- |
| `gd` | 定義へ移動する |
| `gD` | 宣言へ移動する |
| `gr` | 参照一覧を表示する |
| `gi` | 実装へ移動する |
| `K` | hover documentを表示する |
| `<leader>rn` | symbol名を変更する |
| `<leader>ca` | code actionを表示する |
| `[d` | 前のdiagnosticへ移動する |
| `]d` | 次のdiagnosticへ移動する |

現在のbufferにattachしているLSP clientを確認するには、以下を実行します。

```vim
:LspInfo
```

期待するclient:

- Go: `gopls`
- JavaScript / TypeScript: `vtsls`
- Vue.js: `vue_ls` と `vtsls`
- Lua: `lua_ls`
- Rust: `rust_analyzer`
- Ruby: `ruby_lsp`

## 補完

補完エンジンは `blink.cmp` です（`default` preset）。insert mode中に動作します。

| キー | 操作 |
| --- | --- |
| `<C-Space>` | 補完メニューを開く / documentを表示する |
| `<C-y>` | 補完候補を確定する |
| `<C-n>` / `<C-p>` | 次 / 前の候補を選択する |
| `<C-e>` | 補完メニューを閉じる |
| `<C-k>` | signature help（引数ヒント）を表示する |

## formatとlint

現在のbufferをformatします。

```vim
:Format
```

lintは設定済みのfiletypeで保存時に実行されます。

formatter:

- JavaScript / TypeScript / Vue / Markdown: `prettier`
- Go: `golines`
- Lua: `stylua`
- JSON: `jq`
- Ruby: `rubocop`
- Rust: `rustfmt`
- SQL: `sql-formatter`

linter:

- JavaScript / TypeScript: `biome`
- Markdown: `vale`
- Go: `golangci-lint`
- Ruby: `rubocop`

## 動作確認

通常は対象ファイルをNeovimで開けば確認できます。

```bash
nvim test_contents/test.go
nvim test_contents/test.js
nvim README.md
```

TypeScriptやVueは、任意の `.ts` / `.vue` ファイルを開いて確認します。

ファイルを開いたら、以下でLSPのattach状態を確認します。

```vim
:LspInfo
```

headlessで簡易確認する場合:

```bash
nvim --headless test_contents/test.go +'qa'
nvim --headless test_contents/test.js +'qa'
nvim --headless README.md +'qa'
```

## Pug highlight

Pugファイルの場合:

```vim
:set ft=pug
```
