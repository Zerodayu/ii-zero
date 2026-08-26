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

alias oc opencode
alias fish-reload 'source ~/.config/fish/config.fish && source ~/.config/ii-zero/configs/fish/@config.fish'
set -gx EDITOR nvim

source ~/.config/fish/auto-Hypr.fish
