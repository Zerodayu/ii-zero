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

---

### — Installations

#### `Clone`

```bash
git clone https://github.com/Zerodayu/ii-zero.git ~/.config/ii-zero
```

### — Usage

#### `Hyprland configs`

```bash
# backup existing
mv ~/.config/hypr/custom ~/.config/hypr/custom.bak

ln -s ~/.config/ii-zero/hyprland/ ~/.config/hypr/custom
hyprctl reload
```

#### `App configs`

add this line to `~/.config/fish/config.fish`
> source ~/.config/ii-zero/configs/fish/@config.fish

```bash
# nvim/LazyVim dynamic theme
mv ~/.config/nvim/lua/plugins ~/.config/nvim/lua/plugins.bak
ln -s ~/.config/ii-zero/configs/nvim-plugin/ ~/.config/nvim/lua/plugins

# Tmux laoyut and dynamyc theme
ln -s ~/.config/ii-zero/configs/tmux/ ~/.config/tmux

# Opencode rules & dynamic theme
ln -s ~/.config/ii-zero/configs/opencode/ ~/.config/opencode

# Fastfetch layout
ln -s ~/.config/ii-zero/configs/fastfetch/ ~/.config/fastfetch

# XCompose (copy, not symlink — user edits are preserved)
# Assumes fish config is sourced (includes install-xcompose function)
install-xcompose

# Edit ~/.Xcompose and replace placeholders with your actual values:
#   NAME_PLACEHOLDER → your name
#   EMAIL_PLACEHOLDER → your email
#   PASSWORD_PLACEHOLDER → your password

# Then relogin (needs full relogin every time you change ~/.Xcompose)
```
