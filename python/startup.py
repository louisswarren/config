import atexit
import os
import readline

# Can do away with this once
# https://github.com/python/cpython/pull/13208
# is merged (any day now ...)

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
