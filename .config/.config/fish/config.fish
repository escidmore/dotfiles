# Path to Oh My Fish install.
set -gx OMF_PATH "/home/eve/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "/home/eve/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g theme_color_scheme dark
set -g default_user eve
set -g theme_display_user no

set fish_greeting ""

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#alias vi "mvim -g -c 'au VimLeave * !open -a iTerm'"
#alias vim "mvim -g -c 'au VimLeave * !open -a iTerm'"
#alias vi "vim -v"
#alias vim "vim-v"

# Set $FILTER
set FILTER percol

# Init jenv
set PATH $HOME/.jenv/bin $HOME/.jenv/shims $PATH
