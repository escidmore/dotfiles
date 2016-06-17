# Path to Oh My Fish install.
<<<<<<< HEAD
set -gx OMF_PATH "/Users/scidmev/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "/Users/scidmev/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_greeting ""

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#alias vi "mvim -g -c 'au VimLeave * !open -a iTerm'"
#alias vim "mvim -g -c 'au VimLeave * !open -a iTerm'"
alias vi "mvim -v"
alias vim "mvim -v"

# Set $FILTER
set FILTER percol

# Init jenv
set PATH $HOME/.jenv/bin $HOME/.jenv/shims $PATH
=======
set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "$HOME/.config/omf"

set fish_greeting ""

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
>>>>>>> b11dfbb17755f04a4c1b9c00d92b742bb744a8d6
