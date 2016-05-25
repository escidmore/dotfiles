#!/usr/bin/env bash

set -e

# Place holder for status left/right
place_holder="\#{prefix_highlight}"

# Possible configurations
fg_color_config='@prefix_highlight_fg'
bg_color_config='@prefix_highlight_bg'
show_copy_config='@prefix_highlight_show_copy_mode'
copy_attr_config='@prefix_highlight_copy_mode_attr'

# Defaults
default_fg='colour231'
default_bg='colour04'
default_copy_attr='fg=default,bg=yellow'

tmux_option() {
    local -r value=$(tmux show-option -gqv "$1")
    local -r default="$2"

    if [ ! -z "$value" ]; then
        echo "$value"
    else
        echo "$default"
    fi
}

main() {
    local -r \
        prefix=$(tmux_option prefix) \
        show_copy_mode=$(tmux_option "$show_copy_config" "off") \
        copy_attr=$(tmux_option "$copy_attr_config" "$default_copy_attr")

    local -r short_prefix=$(
        echo "$prefix" | tr "[:lower:]" "[:upper:]" | sed 's/C-/\^/'
    )


    if [[ "on" = "$show_copy_mode" ]]; then
        local -r fallback="${copy_highlight}#{?pane_in_mode,Copy,}"
    else
        local -r fallback=""
    fi

	tmux display-message -p "${prefix_highlight}#{?client_prefix, $prefix ,$fallback}"

}

main
