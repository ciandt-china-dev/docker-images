#!/bin/sh

set -e

# this will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- varnishd \
	    -F \
	    -f /etc/varnish/default.vcl \
	    -a http=:80,HTTP \
	    -a proxy=:8443,PROXY \
	    -p feature=+http2 \
	    -s malloc,$VARNISH_SIZE \
	    "$@"
fi

exec "$@" &

if [ "${VARNISHNCSA}" = "true" ]; then
   VARNISHD_NCSA="exec varnishncsa -F '${VARNISHNCSA_FORMAT}'"
	 eval "${VARNISHD_NCSA}"
else
	wait
fi
