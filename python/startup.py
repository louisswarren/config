################################################################################
# Set up history
# Can do away with this once
# https://github.com/python/cpython/pull/13208
# is merged (any day now ...)

import atexit #Required
import os #Required
import readline #Required

if 'PYTHONHISTORY' in os.environ:
    histfile = os.path.expanduser(os.environ['PYTHONHISTORY'])
elif 'XDG_STATE_HOME' in os.environ:
    histfile = os.path.join(os.path.expanduser(os.environ['XDG_STATE_HOME']), 'python', 'python_history')
else:
    histfile = os.path.join(os.path.expanduser("~"), ".python_history")

try:
    readline.read_history_file(histfile)
    h_len = readline.get_current_history_length()
except FileNotFoundError:
    open(histfile, 'wb').close()
    h_len = 0

def save(prev_h_len, histfile):
    new_h_len = readline.get_current_history_length()
    readline.set_history_length(1000)
    readline.append_history_file(new_h_len - prev_h_len, histfile)
atexit.register(save, h_len, histfile)


################################################################################
# Other libraries I want in my REPL

import datetime
import re
import sys
import itertools
import pprint

sys.displayhook = pprint.pprint

################################################################################
# Automatically save/load globals to/from shelf

import atexit
import shelve
import xdg.BaseDirectory

def _auto_shelve_globals(globals_initial):
    keys = set(globals().keys()) - globals_initial
    path = xdg.BaseDirectory.xdg_state_home + '/python-interactive-shelf.db'
    with shelve.open(path) as db:
        for key in db:
            if key not in keys:
                del db[key]
        for key in keys:
            db[key] = globals()[key]
        if keys:
            print("Shelved", ", ".join(sorted(keys)))

def _auto_load_shelf():
    path = xdg.BaseDirectory.xdg_state_home + '/python-interactive-shelf.db'
    with shelve.open(path) as db:
        for key in db:
            globals()[key] = db[key]
        if db:
            print("Loaded", ", ".join(sorted(db)))

atexit.register(_auto_shelve_globals, set(globals().keys()))
_auto_load_shelf()
del _auto_shelve_globals
del _auto_load_shelf

# NOTE: Do not define anything below this section
