{config, pkgs,...}:{

  wayland.windowManager.hyprland  = {
    extraConfig = ''
      monitor=,preferred,1920x1080,1
      monitor=eDP-1, 1920x1080@144, 0x0, 1
      monitor=HDM1-1-A, 1920x1080@144, 1920x0, 1
      # monitor=eDP-1,disable

      # exec-once = $terminal
      # exec-once = nm-applet &
      # exec-once = waybar & hyprpaper & firefox
      exec-once = waybar & randwall & dunst

      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      general { 
          gaps_in = 1
          gaps_out = 1

          border_size = 1

          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          resize_on_border = false 

          allow_tearing = false

          layout = dwindle
      }

      decoration {
          rounding = 10

          active_opacity = 1.0
          inactive_opacity = 1.0

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)

          blur {
              enabled = true
              size = 3
              passes = 1
              
              vibrancy = 0.1696
          }
      }

      animations {
          enabled = false

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      master {
          new_is_master = true
      }

      misc { 
          force_default_wallpaper = 0
          disable_hyprland_logo = true 
      }

      input {
          kb_layout = us, br
          kb_variant =
          kb_model =
          kb_options = grp:alt_shift_toggle
          kb_rules =

          follow_mouse = 1

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = true
          }
      }

      gestures {
          workspace_swipe = false
      }

      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

      # windowrule = float, ^(kitty)$
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

      $mainMod = ALT 

      bind = $mainMod, Return, exec, wezterm start --always-new-process
      bind = $mainMod, Q, killactive,
      # bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, killall .thunar-wrapped || thunar
      bind = $mainMod, R, exec, killall .anyrun-wrapped || anyrun
      # bind = $mainMod, P, pseudo, # dwindle
      # bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, F, fullscreen
      bind = SUPER_SHIFT, P, exec, randwall
      bind = SUPER_SHIFT, Q, exec, wlogout
      bind = $mainMod, SPACE, togglefloating
      bind = ALT, W, exec, killall .waybar-wrapped || waybar

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = SUPER_SHIFT, 1, movetoworkspace, 1
      bind = SUPER_SHIFT, 2, movetoworkspace, 2
      bind = SUPER_SHIFT, 3, movetoworkspace, 3
      bind = SUPER_SHIFT, 4, movetoworkspace, 4
      bind = SUPER_SHIFT, 5, movetoworkspace, 5
      bind = SUPER_SHIFT, 6, movetoworkspace, 6
      bind = SUPER_SHIFT, 7, movetoworkspace, 7
      bind = SUPER_SHIFT, 8, movetoworkspace, 8
      bind = SUPER_SHIFT, 9, movetoworkspace, 9
      bind = SUPER_SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = ALT CTRL, left, resizeactive, -50 0
      bind = ALT CTRL, right, resizeactive, 50 0
      bind = ALT CTRL, up, resizeactive, 0 -50
      bind = ALT CTRL, down, resizeactive, 0 50

      bind = ALT, Tab, cyclenext,
      bind = ALT, Tab, bringactivetotop,

      windowrulev2 = float, class:^(org.wezfurlong.wezterm)$
      windowrulev2 = tile, class:^(org.wezfurlong.wezterm)$
    '';
  };
}
