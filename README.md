# Illogical Impulse([end4](https://github.com/end-4/dots-hyprland)) dots with my Hyprland configs

### — Contents

* [Features](#-features)
* [Installation](#-installations)
* [Usage](#-usage)

---

### — Features

#### `Hyprland configs`

| | end4 | ii-zero |
| -- | ------ | --------- |
| **Windows** | solid | translucent |
| **Animations** | many curves & effects | simple easing |
| **Blur** | minimal | strong |
| **Keybinds** | default end4 | defaults + extras (see below) |
| **Scratchpad** | default | tighter gaps |

#### `Added / changed keybinds`

| Keybind | Action |
| --------- | -------- |
| `SUPER + ALT + Return` | Launch tmux |
| `SUPER + SHIFT + [1-0]` | Send window to workspace |
| `CAPS + Space + Space` | emdash "—" |
| `CAPS + Space + n` | Insert name |
| `CAPS + Space + e` | Insert email |
| `CAPS + Space + p` | Insert password |

> `SUPER+SHIFT+num` replaces end4's `SUPER+ALT+num` for sending windows to workspaces.
> Numpad variants also bound.

#### `App configs`

| App | Config |
| ----- | -------- |
| **Opencode** | `"theme": "system"` — follows illogical impulse light/dark theme |
| **LazyVim** | Reads generated colors from `~/.local/state/quickshell/user/generated/colors.json` — dynamic Material You palette |
| **Tmux** | Fish shell, vi keys, prefix `C-Space`, window management via `M-[1-9]`, dynamic status bar |
| **Fish** | Custom utility functions — see below |
| **XCompose** | Custom autofill for name/email/password (user preference) |

#### `Fish commands`

| Command | Action |
| ------- | ------ |
| `n <file-or-dir>` | Quick nvim open (with cd for directories) |
| `gclone <url> [dir]` | Git clone into ~/Projects |
| `ttyedit` | Edit and reload <getty@tty1.service>(for auto-login using tty) |
| `install-xcompose` | Copy .XCompose and set XCOMPOSEFILE |
| `matugen-patch` | Patch matugen config with nvim/opencode templates |

---

### — Installation

```bash
# Clone
git clone https://github.com/Zerodayu/ii-zero.git ~/.config/ii-zero

# Install all configs
bash ~/.config/ii-zero/install.sh
```

#### `Selective install`

```bash
bash ~/.config/ii-zero/install.sh --fish
bash ~/.config/ii-zero/install.sh --nvim-plugin
bash ~/.config/ii-zero/install.sh --tmux
bash ~/.config/ii-zero/install.sh --opencode
bash ~/.config/ii-zero/install.sh --fastfetch
bash ~/.config/ii-zero/install.sh --xcompose
bash ~/.config/ii-zero/install.sh --matugen
bash ~/.config/ii-zero/install.sh --hyprland

# multiple at once
bash ~/.config/ii-zero/install.sh --fish --tmux
```

#### `What it does`

| Config | Method | Backup? |
| ------ | ------ | ------- |
| hyprland | symlink → `~/.config/hypr/custom` | yes |
| fish | append source line to `config.fish` | no |
| nvim-plugin | symlink → `~/.config/nvim/lua/plugins` | yes |
| tmux | symlink → `~/.config/tmux` | no |
| opencode | symlink → `~/.config/opencode` | no |
| fastfetch | symlink → `~/.config/fastfetch` | no |
| xcompose | copy `.XCompose` to `~/.XCompose` | no |
| matugen | copies templates + patches config.toml | no |

#### `Post-install`

1. **Hyprland**: run `hyprctl reload`
2. **XCompose**: edit `~/.XCompose` and replace placeholders (`NAME_PLACEHOLDER`, `EMAIL_PLACEHOLDER`, `PASSWORD_PLACEHOLDER`), then relogin
3. **Matugen**: run `matugen-patch` in fish to apply nvim/opencode templates
