{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = lib.mkForce "JetBrains Mono";
      size = 12.0;
    };

    settings = {
      # Cursor
      cursor_shape = "block";
      cursor_blink_interval = 0;

      # Scrollback
      scrollback_lines = 10000;

      # Mouse
      mouse_hide_wait = "3.0";
      url_color = "#0087bd";
      url_style = "curly";

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      # Window Layout
      remember_window_size = true;
      initial_window_width = 640;
      initial_window_height = 400;
      window_padding_width = 4;
      enabled_layouts = "splits,stack";

      # Tab Bar
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Color Scheme (One Dark)
      foreground = "#abb2bf";
      background = "#282c34";
      selection_foreground = "#282c34";
      selection_background = "#abb2bf";

      # Black
      color0 = "#282c34";
      color8 = "#545862";

      # Red
      color1 = "#e06c75";
      color9 = "#e06c75";

      # Green
      color2 = "#98c379";
      color10 = "#98c379";

      # Yellow
      color3 = "#e5c07b";
      color11 = "#e5c07b";

      # Blue
      color4 = "#61afef";
      color12 = "#61afef";

      # Magenta
      color5 = "#c678dd";
      color13 = "#c678dd";

      # Cyan
      color6 = "#56b6c2";
      color14 = "#56b6c2";

      # White
      color7 = "#abb2bf";
      color15 = "#c8ccd4";

      # Advanced
      shell = ".";
      editor = ".";
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";

      # Clipboard
      clipboard_control = "write-clipboard write-primary read-clipboard-ask read-primary-ask";

      # Background opacity (uncomment to enable)
      # background_opacity = "0.95";
      # dynamic_background_opacity = true;
    };

    keybindings = {
      # Clipboard
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";

      # New window/tab
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+t" = "new_tab";

      # Window navigation
      "ctrl+shift+[" = "previous_window";
      "ctrl+shift+]" = "next_window";

      # Tab navigation
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+right" = "next_tab";

      # Font size
      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";

      # Layouts
      "ctrl+shift+l" = "next_layout";
    };
  };
}
