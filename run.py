import gnucash_web.wsgi
import signal
import sys
import waitress

def handle_sigterm(_signal, _frame):
    sys.exit()

signal.signal(signal.SIGTERM, handle_sigterm)

waitress.serve(gnucash_web.wsgi.app, ident=None)
