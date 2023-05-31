import gnucash_web.wsgi
import notch
import signal
import sys
import waitress

log = notch.make_log('docker_gnucash_web')

def handle_sigterm(_signal, _frame):
    sys.exit()

signal.signal(signal.SIGTERM, handle_sigterm)

waitress.serve(gnucash_web.wsgi.app, ident=None)
