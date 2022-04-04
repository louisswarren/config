from platform import node as GETHOSTNAME
HOST = GETHOSTNAME()

config.load_autoconfig()

with open("/home/louis/.config/base16-qutebrowser/themes/default/base16-gruvbox-dark-hard.config.py") as f:
    exec(f.read())

for seltab in (c.colors.tabs.selected.even, c.colors.tabs.selected.odd):
    seltab.fg = base0D # base05
    seltab.bg = base03 # base02

c.colors.statusbar.private.bg = base02
c.colors.statusbar.private.fg = base0E

if HOST == 'turing':
    c.fonts.default_size = '12pt'
    c.fonts.web.size.default = 18
    c.fonts.web.size.minimum = 16
    c.qt.highdpi = True
