#!/bin/bash
# Reads the same nvim_theme file used by WezTerm and updates Alacritty + tmux.
# Called by Neovim's ColorScheme autocmd.

THEME_FILE="${HOME}/.config/wezterm/nvim_theme"
ALACRITTY_THEMES="${HOME}/.config/alacritty/themes"
ALACRITTY_CURRENT="${HOME}/.config/alacritty/current_theme.toml"
TMUX_THEMES="${HOME}/.config/tmux/themes"
TMUX_CURRENT="${HOME}/.config/tmux/current_theme.conf"

theme=$(cat "$THEME_FILE" 2>/dev/null || echo "tokyonight")

case "$theme" in
  gruvbox)
    cp "$ALACRITTY_THEMES/gruvbox.toml" "$ALACRITTY_CURRENT"
    cp "$TMUX_THEMES/gruvbox.conf" "$TMUX_CURRENT"
    ;;
  ayu|ayu-mirage)
    cp "$ALACRITTY_THEMES/ayu_mirage.toml" "$ALACRITTY_CURRENT"
    cp "$TMUX_THEMES/ayu_mirage.conf" "$TMUX_CURRENT"
    ;;
  *)
    cp "$ALACRITTY_THEMES/tokyonight.toml" "$ALACRITTY_CURRENT"
    cp "$TMUX_THEMES/tokyonight.conf" "$TMUX_CURRENT"
    ;;
esac

# # Touch main config to trigger Alacritty live reload
# touch "${HOME}/.config/alacritty/alacritty.toml"

# Reload tmux theme live if a session is running
if tmux info &>/dev/null; then
  tmux source-file "$TMUX_CURRENT"
fi
