function n
    if test (count $argv) -eq 0
        echo "Usage: n <file-or-directory>"
        return 1
    end
    if test -d $argv[1]
        cd $argv[1]
        nvim .
    else
        cd (dirname $argv[1])
        nvim (basename $argv[1])
    end
end

function ttyedit
    sudo -E systemctl edit getty@tty1.service
    and sudo systemctl daemon-reload
    and sudo systemctl restart getty@tty1.service
    and echo "getty@tty1 reloaded and restarted successfully"
    or echo "no changes made"
end

function install-xcompose
    cp ~/.config/ii-zero/configs/xcompose/.XCompose ~/.XCompose
    and set -Ux XCOMPOSEFILE ~/.XCompose
    and echo "XCompose installed and XCOMPOSEFILE set"
    or echo "failed to install XCompose"
end

function matugen-patch
    bash ~/.config/ii-zero/configs/matugen/matugen-patch.sh
end

function install-end4-pC
    set -l target ~/.config/quickshell/end4-pC
    if [ -d "$target" ]
        echo "end4-pC already installed, skipping."
        return 1
    end
    git clone https://github.com/pctrade/end4-pC.git "$target"
    killall qs 2>/dev/null
    qs -c end4-pC > /dev/null 2>&1 & disown
    echo "end4-pC installed and started."

    read -P "Set end4-pC as default shell? [y/N] " -l confirm
    if test "$confirm" = "y" -o "$confirm" = "Y"
        sed -i 's/hl.env("qsConfig", "ii")/hl.env("qsConfig", "end4-pC")/' \
            ~/.config/hypr/hyprland/variables.lua
        echo "Default shell set to end4-pC. Run 'hyprctl reload' to apply."
    end
end

alias oc opencode
alias fish-reload 'source ~/.config/fish/config.fish && source ~/.config/ii-zero/configs/fish/@config.fish'
set -gx EDITOR nvim

source ~/.config/fish/auto-Hypr.fish
