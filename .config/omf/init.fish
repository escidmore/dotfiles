set -g tab_iterm_profile "Default"

# Expand plugin configurations.  Expand-word definitions, then functions
expand-word -p '^s/..*/.*$' -e 'echo -n "$history[1]" | sed -e (commandline -t)/g'
# End Expand plugin configurations