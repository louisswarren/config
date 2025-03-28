include ~/.config/base16-sway/themes/base16-gruvbox-dark-hard.config

set $mod Mod3
set $super Mod3+Shift

HOST_EULER(`
set $sidemonitor DVI-I-1
set $monitor DP-0
output $sidemonitor transform 270
output $sidemonitor pos 0 0
output $monitor pos 1080 0
') HOST_TURING(`
set $monitor eDP-1
set $externalmonitor unknown
')

HOST_EULER(`
font pango:DejaVu Sans Mono 10
',`
font pango:DejaVu Sans Mono 11
')

set $left h
set $down j
set $up k
set $right l

set $term alacritty

### Startup
exec --no-startup-id gammastep

### Workspaces
HOST_EULER(`
set $ws1  "1:webbrowser"
set $ws2  "2:webbrowser"
set $ws3  "3:operations"
set $ws4  "4:operations"
set $ws5  "5:messengers"
set $ws6  "6:webbrowser"
set $ws7  "7:webbrowser"
set $ws8  "8:extraspace"
set $ws9  "9:background"
set $ws10 "10:maximised"
',`
set $ws1  "1:internet"
set $ws2  "2:internet"
set $ws3  "3:terminal"
set $ws4  "4:terminal"
set $ws5  "5:messages"
set $ws6  "6:anything"
set $ws7  "7:watching"
set $ws8  "8:watching"
set $ws9  "9:bglisten"
set $ws10 "10:fullmax"
')

# Your preferred application launcher
# Note: pass the final command to swaymsg so that the resulting window can be opened
# on the original workspace that the command was run on.
set $menu bemenu-run --nb=$base01 --nf=$base04 --sb=$base0D --sf=$base00 | xargs swaymsg exec --


### Output configuration
#output * bg /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill
output * bg ~/background.png fill
output * scale 1

### Idle configuration
#
# Example configuration:
#
# exec swayidle -w \
#          timeout 300 'swaylock -f -c 000000' \
#          timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
#          before-sleep 'swaylock -f -c 000000'
#
# This will lock your screen after 300 seconds of inactivity, then turn off
# your displays after another 300 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.

# Unclutter cursor
seat * hide_cursor 10000
seat * hide_cursor when-typing enable

### Input configuration
input "type:keyboard" {
	xkb_options caps:hyper
}

input "2:10:TPPS/2_IBM_TrackPoint" {
	accel_profile adaptive
	pointer_accel -0.2
}

### Key bindings

## General
bindsym XF86MonBrightnessUp   exec brightnessctl set +10%
bindsym XF86MonBrightnessDown exec brightnessctl set 10%-
bindsym Print                 exec grimshot copy area
bindsym Shift+Print           exec grimshot --notify save screen ~/screenshot.png

bindsym XF86AudioRaiseVolume  exec pamixer --increase 5 --allow-boost
bindsym XF86AudioLowerVolume  exec pamixer --decrease 5 --allow-boost
bindsym XF86AudioMute         exec pamixer --toggle-mute
bindsym Shift+XF86AudioMute   exec pavucontrol

bindsym XF86AudioPrev         exec playerctl previous
bindsym XF86AudioNext         exec playerctl next
bindsym XF86Audiostop         exec playerctl stop
bindsym XF86AudioPlay         exec playerctl play-pause

# T420 function keys on other devices using hyper
bindsym $mod+Left          exec playerctl previous
bindsym $mod+Right         exec playerctl next
bindsym $mod+Up            exec playerctl stop
bindsym $mod+Down          exec playerctl play-pause

## Sway
# Kill window
bindsym $mod+Shift+q      kill
# Scratchpad
bindsym $mod+grave        scratchpad show
bindsym $super+grave      move scratchpad
# Focus
bindsym $mod+$left        focus left
bindsym $mod+$down        focus down
bindsym $mod+$up          focus up
bindsym $mod+$right       focus right
# Move
bindsym $mod+Shift+$left  move left
bindsym $mod+Shift+$down  move down
bindsym $mod+Shift+$up    move up
bindsym $mod+Shift+$right move right
# Workspaces
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10
# move focused container to workspace
bindsym $super+1 move container to workspace $ws1
bindsym $super+2 move container to workspace $ws2
bindsym $super+3 move container to workspace $ws3
bindsym $super+4 move container to workspace $ws4
bindsym $super+5 move container to workspace $ws5
bindsym $super+6 move container to workspace $ws6
bindsym $super+7 move container to workspace $ws7
bindsym $super+8 move container to workspace $ws8
bindsym $super+9 move container to workspace $ws9
bindsym $super+0 move container to workspace $ws10
# Sway reload / exit
bindsym $mod+Shift+r      reload
bindsym $mod+Shift+e      exec swaynag -t warning -m 'Exit Sway?.' -b 'Yes ' 'swaymsg exit'

## Launchers
bindsym $mod+d exec       $menu
bindsym $mod+Return       exec $term
bindsym $mod+Shift+w      exec qutebrowser
bindsym $super+p          exec mediaplay
bindsym $super+c          exec configure

# Moving / resizing floading windows
floating_modifier $mod normal

focus_wrapping no

# Layout stuff:

# Layout
bindsym $mod+b splith
bindsym $mod+v splitv
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+f fullscreen
bindsym $super+f move container to workspace $ws10; workspace $ws10
bindsym $mod+u focus parent

# Floating
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle

# Resize mode
mode "resize" {
    bindsym $left resize shrink width 10px
    bindsym $down resize grow height 10px
    bindsym $up resize shrink height 10px
    bindsym $right resize grow width 10px

    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+a mode "resize"

#
# Status Bar:
#
# Read `man 5 sway-bar` for more information about this section.

bar {
	swaybar_command waybar
}

#bar {
#    position bottom
#
#    # When the status_command prints a new line to stdout, swaybar updates.
#    # The default just shows the current date and time.
#    status_command while date +'%Y-%m-%d %l:%M:%S %p'; do sleep 1; done
#
#    colors {
#        statusline #ffffff
#        background #323232
#        inactive_workspace #32323200 #32323200 #5c5c5c
#    }
#}

default_border pixel 3

gaps inner 20
gaps outer -4
smart_gaps on
smart_borders on

bindsym $mod+g   gaps inner current set 20; gaps outer current set -4
bindsym $super+g gaps inner current set 4;  gaps outer current set 0
bindsym $super+b gaps inner current set 0;  gaps outer current set 0

exec --no-startup-id "while true; do alacritty --class scratch; done"
for_window [app_id="scratch"]   move to scratchpad

for_window [instance="floating"]  floating enable
for_window [class="floating"]  floating enable
for_window [class="R_x11"]  floating enable
for_window [class="mpv" floating] border pixel 0
for_window [app_id="pavucontrol"]  floating enable
for_window [app_id="zoom"] floating enable

for_window [class="wlfreerdp"]   move to workspace $ws8
for_window [class="wlfreerdp"]   fullscreen enable

focus_follows_mouse no

HOST_EULER(`
workspace $ws1  output $sidemonitor
workspace $ws2  output $monitor
workspace $ws3  output $sidemonitor
workspace $ws4  output $monitor
workspace $ws5  output $sidemonitor
workspace $ws6  output $monitor
workspace $ws7  output $sidemonitor
workspace $ws8  output $monitor
workspace $ws9  output $sidemonitor
workspace $ws10 output $monitor
',`
workspace $ws1  output $monitor
workspace $ws2  output $monitor
workspace $ws3  output $monitor
workspace $ws4  output $monitor
workspace $ws5  output $monitor
workspace $ws6  output $monitor
workspace $ws7  output $monitor
workspace $ws8  output $externalmonitor
workspace $ws9  output $monitor
workspace $ws10 output $externalmonitor
')

focus_on_window_activation urgent

# Basic color configuration using the Base16 variables for windows and borders.
# Property Name         Border  BG      Text    Indicator Child Border
client.focused          $base05 $base0D $base00 $base0D $base0D
client.focused_inactive $base01 $base01 $base05 $base03 $base01
client.unfocused        $base01 $base00 $base05 $base01 $base01
client.urgent           $base08 $base08 $base00 $base08 $base08
client.placeholder      $base00 $base00 $base05 $base00 $base00
client.background       $base07

include /etc/sway/config.d/*
