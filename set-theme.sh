#!/bin/sh

DIR="$(dirname "$0")"
THEME_FILE="$DIR/theme.txt"

set_theme() {
  local theme="$1"
  case "$theme" in
    dark)
      echo "dark" > $THEME_FILE
      ;;
    light)
      echo "light" > $THEME_FILE
      ;;
     *)
      echo "Unknown theme: $theme"
      return 1
      ;;
  esac
}

set_theme "$1"
