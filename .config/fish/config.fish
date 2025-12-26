if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH $HOME/.composer/vendor/bin:$PATH
set --export EDITOR nvim

set --export ANDROID_SDK_ROOT $HOME/Library/Android/sdk
fish_add_path $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/platform-tools
set --export PATH "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin:$PATH"
set --export PATH "/Users/Shared/DBngin/mysql/8.2/bin:$PATH:$PATH"
set --export HOMEBREW_NO_AUTO_UPDATE 1
set --export PATH "$PATH":"$HOME/.maestro/bin"
set --export BAT_PAGING never

alias config="$EDITOR ~/.config/fish/config.fish"
alias reload="source ~/.config/fish/config.fish"
alias a="php artisan"
alias dep='./vendor/bin/dep'
alias mfs='php artisan migrate:fresh --seed'
alias vim="$EDITOR"
alias v="$EDITOR"
alias ls='eza'
alias cat='bat'
alias ca='cursor agent'
alias wip='git add -A && git commit -m "chore: wip"'
alias takeout="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --add-host=host.docker.internal:host-gateway -it tighten/takeout:latest"

eval "$(/opt/homebrew/bin/brew shellenv)"
set PATH "$PATH":"$HOME/.local/scripts/"
bind \cf tmux-sessionizer

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
fish_add_path $HOME/.local/bin
zoxide init fish | source

# opencode
fish_add_path /Users/joel/.opencode/bin

# pnpm
set -gx PNPM_HOME "/Users/joel/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
