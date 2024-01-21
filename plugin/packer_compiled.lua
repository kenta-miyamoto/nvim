-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/kentamiyamoto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/kentamiyamoto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/kentamiyamoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/kentamiyamoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/kentamiyamoto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nz\0\2\6\0\6\0\r6\2\0\0009\2\1\2\18\4\0\0'\5\2\0B\2\3\2\14\0\2\0X\3\5�6\2\3\0009\2\4\0026\4\5\0\18\5\1\0B\2\3\2L\2\2\0\23default_mru_ignore\17tbl_contains\bvim\19COMMIT_EDITMSG\tfind\vstring�\20\1\0\n\0\"\1E6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\2'\4\5\0B\2\2\0029\3\6\0019\3\a\0035\4\t\0=\4\b\0036\3\n\0009\3\v\0039\5\6\0019\5\a\0059\5\b\5\18\6\2\0B\3\3\0019\3\6\0019\3\f\0034\4\3\0009\5\r\1'\a\14\0'\b\15\0'\t\16\0B\5\4\0?\5\0\0=\4\b\0039\3\6\0019\3\17\0034\4\3\0005\5\18\0>\5\1\4=\4\b\0039\3\6\0019\3\19\0034\4\3\0005\5\20\0>\5\1\4=\4\b\0039\3\21\1+\4\1\0=\4\22\0039\3\6\0019\3\23\0034\4\3\0009\5\r\1'\a\24\0'\b\25\0'\t\26\0B\5\4\0?\5\0\0=\4\b\0039\3\6\0019\3\27\0034\4\3\0005\5\28\0>\5\1\4=\4\b\0039\3\29\0013\4\31\0=\4\30\0039\3 \0009\5!\1B\3\2\1K\0\1\0\vconfig\nsetup\0\vignore\rmru_opts\1\0\2\ttype\ttext\bval1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\vfooter\f:qa<CR>\20󰅚  Quit NVIM\6q\19bottom_buttons\fenabled\22nvim_web_devicons\1\0\2\ttype\fpadding\bval\3\0\fmru_cwd\1\0\2\ttype\fpadding\bval\3\0\bmru :ene <BAR> startinsert <CR>\18  New file\6e\vbutton\16top_buttons\vinsert\ntable\1\14\0\0�\1  　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 ,. -― ､                                                  �\1　　　　　　　　　　　　　　　　　　　___,､_,,.. -:::::‐^:::ｰ:::::::- ..／ 三 三 ヽ                                           �\1　　　　　　　　　　　　　　_,, -::::''´:::::::::::::::::^::::::::::::::^:::::::::::::::::｀ヽ､三三.|                         �\1　　　　　　　　　　　　 ／:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >::::::::::ヽ_三｣ 　 ／.三ヽ      �\1　　　　　　　,ｨ===＝ﾆﾆ):::::::::::::::::::::::::: >::::::::: >::::::::::::: >:::::::::::::: >::｀''::::::-.< 三 三 |         �\1　　　　　 ／　　　 ノ::::::::::::::::::::::::o:::::::::::::::.>::::::: >::::::::::::::::::: >::::::: >::::::: >::::l 三 三 | �\1　　　　／　　　　 (ニﾆヽ､::::::::::::::::::::ヽ:::: >:::::::::::::::::::::::: >::::::::::::: >:::::::::::::::ノ.三 三/       �\1　　　f非ﾐi　　　　 ヾ' ' 'ヽヽ::::::::::::::::::::ヽ､:__:::::::::: >:::::::::::::::: >:::::::::::f.彡「｀ヾ 三 ／            �\1　　　|从ﾒl　　　　ノ, , , , ,! l:::::::::::::::::::::::l:::::::ヽ三ヽ::::::: >:::::::::::: >:::/.三 |　　｀ｰ''               �\1　　 ﾉ|ﾒ从ﾄ､　　（二ニニ､ﾉ::::::::::::::::::::ﾉ::::::::::l 三 |::::::::::::::: >:::::::::ﾉ 三 /                               �\1　　/人|ﾒ ! .!　 　l::::::::::::::::::::::::::::::::::::/ヽ､::::ノ.三./::::::: >::: >::::::／ｰ-‐´                             �\1　　/　 ﾄ ﾉ　!　　 ゝ.::::::::::::::::::::::::::;::':::::::::::｀ヾミ／:::::: >::::::::::,,ゞ                                 �\1　　　　　　　　　　　 ￣￣｀''' ー'‐‐--‐v‐-二v--vｰゝ‐''´                                                                     \bval\vheader\fsection\22%Y-%m-%d %H:%M:%S\tdate\aos\26alpha.themes.startify\nalpha\frequire\3����\4\0" },
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.indentscope"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/mini.indentscope",
    url = "https://github.com/echasnovski/mini.indentscope"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n� \0\0\b\0v\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\3=\3*\0024\3\0\0=\3+\0025\3,\0005\4-\0=\4.\0035\0040\0005\5/\0=\0051\0045\0052\0005\0063\0=\0064\5=\0055\0045\0056\0005\0067\0=\0064\5=\0058\4=\0049\3=\3:\0024\3\0\0=\3;\0025\3B\0005\4<\0004\5\0\0=\5=\0044\5\0\0=\5>\0044\5\0\0=\5?\0044\5\0\0=\5@\0044\5\0\0=\5A\4=\4C\0035\4D\0=\4E\0035\4X\0005\5F\0005\6G\0005\aH\0=\a4\6=\6I\0055\6J\0=\6K\0055\6L\0=\6M\0055\6N\0=\6O\0055\6P\0=\6Q\0055\6R\0=\6S\0055\6T\0=\6U\0055\6V\0=\6W\5=\0059\0045\5Y\0=\5Z\4=\4:\0034\4\0\0=\4+\3=\3[\0025\3]\0005\4\\\0=\4E\0035\4g\0005\5^\0005\6_\0005\a`\0=\a4\6=\6I\0055\6a\0=\6K\0055\6b\0=\6M\0055\6c\0=\6Q\0055\6d\0=\6S\0055\6e\0=\6U\0055\6f\0=\6W\5=\0059\4=\4:\3=\3h\0025\3s\0005\4i\0005\5j\0005\6k\0005\al\0=\a4\6=\6I\0055\6m\0=\6K\0055\6n\0=\6M\0055\6o\0=\6Q\0055\6p\0=\6S\0055\6q\0=\6U\0055\6r\0=\6W\5=\0059\4=\4:\3=\3\31\2B\0\2\0016\0\0\0009\0t\0'\2u\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\a\agp\rgit_push\agc\15git_commit\agr\20git_revert_file\aga\17git_add_file\agu\21git_unstage_file\6A\16git_add_all\agg\24git_commit_and_push\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\2\18show_unloaded\2\21group_empty_dirs\2\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\1\0\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\n\6H\18toggle_hidden\a]g\22next_git_modified\a[g\22prev_git_modified\n<c-x>\17clear_filter\6/\17fuzzy_finder\6D\27fuzzy_finder_directory\6.\rset_root\6#\17fuzzy_sorter\t<bs>\16navigate_up\6f\21filter_on_submit\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\3\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\20hide_gitignored\2\18hide_dotfiles\2\fvisible\1\16hide_hidden\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\2\19use_image_nvim\2\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\24\6t\16open_tabnew\n<esc>\vcancel\6S\15open_split\6c\tcopy\6q\17close_window\6R\frefresh\6>\16next_source\6s\16open_vsplit\t<cr>\topen\18<2-LeftMouse>\topen\6<\16prev_source\6w\28open_with_window_picker\6x\21cut_to_clipboard\6m\tmove\6?\14show_help\6p\25paste_from_clipboard\6i\22show_file_details\6l\18focus_preview\6y\22copy_to_clipboard\6r\vrename\6d\vdelete\6A\18add_directory\6z\20close_all_nodes\6C\15close_node\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\2\nwidth\3(\rposition\tleft\rcommands\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\fenabled\2\19required_width\3n\18last_modified\1\0\2\fenabled\2\19required_width\3X\ttype\1\0\2\fenabled\2\19required_width\3z\14file_size\1\0\2\fenabled\2\19required_width\3@\15git_status\fsymbols\1\0\0\1\0\t\rmodified\5\fignored\b\frenamed\t󰁕\fdeleted\b✖\nadded\5\14untracked\b\rconflict\b\vstaged\b\runstaged\t󰄱\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\16folder_open\b\17folder_empty\t󰜌\fdefault\6*\18folder_closed\b\vindent\1\0\t\23expander_highlight\20NeoTreeExpander\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\fpadding\3\1\22expander_expanded\b\23expander_collapsed\b\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\6\23popup_border_style\frounded\25close_if_last_window\1\26sort_case_insensitive\1\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\t󰌵\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["scope.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "https://github.com/tiagovla/scope.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/kentamiyamoto/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nz\0\2\6\0\6\0\r6\2\0\0009\2\1\2\18\4\0\0'\5\2\0B\2\3\2\14\0\2\0X\3\5�6\2\3\0009\2\4\0026\4\5\0\18\5\1\0B\2\3\2L\2\2\0\23default_mru_ignore\17tbl_contains\bvim\19COMMIT_EDITMSG\tfind\vstring�\20\1\0\n\0\"\1E6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\2'\4\5\0B\2\2\0029\3\6\0019\3\a\0035\4\t\0=\4\b\0036\3\n\0009\3\v\0039\5\6\0019\5\a\0059\5\b\5\18\6\2\0B\3\3\0019\3\6\0019\3\f\0034\4\3\0009\5\r\1'\a\14\0'\b\15\0'\t\16\0B\5\4\0?\5\0\0=\4\b\0039\3\6\0019\3\17\0034\4\3\0005\5\18\0>\5\1\4=\4\b\0039\3\6\0019\3\19\0034\4\3\0005\5\20\0>\5\1\4=\4\b\0039\3\21\1+\4\1\0=\4\22\0039\3\6\0019\3\23\0034\4\3\0009\5\r\1'\a\24\0'\b\25\0'\t\26\0B\5\4\0?\5\0\0=\4\b\0039\3\6\0019\3\27\0034\4\3\0005\5\28\0>\5\1\4=\4\b\0039\3\29\0013\4\31\0=\4\30\0039\3 \0009\5!\1B\3\2\1K\0\1\0\vconfig\nsetup\0\vignore\rmru_opts\1\0\2\ttype\ttext\bval1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\vfooter\f:qa<CR>\20󰅚  Quit NVIM\6q\19bottom_buttons\fenabled\22nvim_web_devicons\1\0\2\ttype\fpadding\bval\3\0\fmru_cwd\1\0\2\ttype\fpadding\bval\3\0\bmru :ene <BAR> startinsert <CR>\18  New file\6e\vbutton\16top_buttons\vinsert\ntable\1\14\0\0�\1  　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 ,. -― ､                                                  �\1　　　　　　　　　　　　　　　　　　　___,､_,,.. -:::::‐^:::ｰ:::::::- ..／ 三 三 ヽ                                           �\1　　　　　　　　　　　　　　_,, -::::''´:::::::::::::::::^::::::::::::::^:::::::::::::::::｀ヽ､三三.|                         �\1　　　　　　　　　　　　 ／:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >::::::::::ヽ_三｣ 　 ／.三ヽ      �\1　　　　　　　,ｨ===＝ﾆﾆ):::::::::::::::::::::::::: >::::::::: >::::::::::::: >:::::::::::::: >::｀''::::::-.< 三 三 |         �\1　　　　　 ／　　　 ノ::::::::::::::::::::::::o:::::::::::::::.>::::::: >::::::::::::::::::: >::::::: >::::::: >::::l 三 三 | �\1　　　　／　　　　 (ニﾆヽ､::::::::::::::::::::ヽ:::: >:::::::::::::::::::::::: >::::::::::::: >:::::::::::::::ノ.三 三/       �\1　　　f非ﾐi　　　　 ヾ' ' 'ヽヽ::::::::::::::::::::ヽ､:__:::::::::: >:::::::::::::::: >:::::::::::f.彡「｀ヾ 三 ／            �\1　　　|从ﾒl　　　　ノ, , , , ,! l:::::::::::::::::::::::l:::::::ヽ三ヽ::::::: >:::::::::::: >:::/.三 |　　｀ｰ''               �\1　　 ﾉ|ﾒ从ﾄ､　　（二ニニ､ﾉ::::::::::::::::::::ﾉ::::::::::l 三 |::::::::::::::: >:::::::::ﾉ 三 /                               �\1　　/人|ﾒ ! .!　 　l::::::::::::::::::::::::::::::::::::/ヽ､::::ノ.三./::::::: >::: >::::::／ｰ-‐´                             �\1　　/　 ﾄ ﾉ　!　　 ゝ.::::::::::::::::::::::::::;::':::::::::::｀ヾミ／:::::: >::::::::::,,ゞ                                 �\1　　　　　　　　　　　 ￣￣｀''' ー'‐‐--‐v‐-二v--vｰゝ‐''´                                                                     \bval\vheader\fsection\22%Y-%m-%d %H:%M:%S\tdate\aos\26alpha.themes.startify\nalpha\frequire\3����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n� \0\0\b\0v\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\3=\3*\0024\3\0\0=\3+\0025\3,\0005\4-\0=\4.\0035\0040\0005\5/\0=\0051\0045\0052\0005\0063\0=\0064\5=\0055\0045\0056\0005\0067\0=\0064\5=\0058\4=\0049\3=\3:\0024\3\0\0=\3;\0025\3B\0005\4<\0004\5\0\0=\5=\0044\5\0\0=\5>\0044\5\0\0=\5?\0044\5\0\0=\5@\0044\5\0\0=\5A\4=\4C\0035\4D\0=\4E\0035\4X\0005\5F\0005\6G\0005\aH\0=\a4\6=\6I\0055\6J\0=\6K\0055\6L\0=\6M\0055\6N\0=\6O\0055\6P\0=\6Q\0055\6R\0=\6S\0055\6T\0=\6U\0055\6V\0=\6W\5=\0059\0045\5Y\0=\5Z\4=\4:\0034\4\0\0=\4+\3=\3[\0025\3]\0005\4\\\0=\4E\0035\4g\0005\5^\0005\6_\0005\a`\0=\a4\6=\6I\0055\6a\0=\6K\0055\6b\0=\6M\0055\6c\0=\6Q\0055\6d\0=\6S\0055\6e\0=\6U\0055\6f\0=\6W\5=\0059\4=\4:\3=\3h\0025\3s\0005\4i\0005\5j\0005\6k\0005\al\0=\a4\6=\6I\0055\6m\0=\6K\0055\6n\0=\6M\0055\6o\0=\6Q\0055\6p\0=\6S\0055\6q\0=\6U\0055\6r\0=\6W\5=\0059\4=\4:\3=\3\31\2B\0\2\0016\0\0\0009\0t\0'\2u\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\a\agp\rgit_push\agc\15git_commit\agr\20git_revert_file\aga\17git_add_file\agu\21git_unstage_file\6A\16git_add_all\agg\24git_commit_and_push\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\2\18show_unloaded\2\21group_empty_dirs\2\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\1\0\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\1\0\14show_help\vnowait\1\1\0\n\6H\18toggle_hidden\a]g\22next_git_modified\a[g\22prev_git_modified\n<c-x>\17clear_filter\6/\17fuzzy_finder\6D\27fuzzy_finder_directory\6.\rset_root\6#\17fuzzy_sorter\t<bs>\16navigate_up\6f\21filter_on_submit\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\3\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\20hide_gitignored\2\18hide_dotfiles\2\fvisible\1\16hide_hidden\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\2\19use_image_nvim\2\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\24\6t\16open_tabnew\n<esc>\vcancel\6S\15open_split\6c\tcopy\6q\17close_window\6R\frefresh\6>\16next_source\6s\16open_vsplit\t<cr>\topen\18<2-LeftMouse>\topen\6<\16prev_source\6w\28open_with_window_picker\6x\21cut_to_clipboard\6m\tmove\6?\14show_help\6p\25paste_from_clipboard\6i\22show_file_details\6l\18focus_preview\6y\22copy_to_clipboard\6r\vrename\6d\vdelete\6A\18add_directory\6z\20close_all_nodes\6C\15close_node\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\2\nwidth\3(\rposition\tleft\rcommands\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\fenabled\2\19required_width\3n\18last_modified\1\0\2\fenabled\2\19required_width\3X\ttype\1\0\2\fenabled\2\19required_width\3z\14file_size\1\0\2\fenabled\2\19required_width\3@\15git_status\fsymbols\1\0\0\1\0\t\rmodified\5\fignored\b\frenamed\t󰁕\fdeleted\b✖\nadded\5\14untracked\b\rconflict\b\vstaged\b\runstaged\t󰄱\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\16folder_open\b\17folder_empty\t󰜌\fdefault\6*\18folder_closed\b\vindent\1\0\t\23expander_highlight\20NeoTreeExpander\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\fpadding\3\1\22expander_expanded\b\23expander_collapsed\b\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\6\23popup_border_style\frounded\25close_if_last_window\1\26sort_case_insensitive\1\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\t󰌵\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\2\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
