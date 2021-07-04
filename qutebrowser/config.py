config.load_autoconfig()

with open("/home/louis/.config/base16-qutebrowser/themes/default/base16-gruvbox-dark-hard.config.py") as f:
    exec(f.read())

c.colors.statusbar.private.bg = base02
c.colors.statusbar.private.fg = base0E
