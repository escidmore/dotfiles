# Path to Oh My Fish install.
set -gx OMF_PATH "${HOME}/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "${HOME}/.config/omf"

set fish_greeting ""

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
