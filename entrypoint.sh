#!/bin/bash
#set -ex

RUN_FLUXBOX=${RUN_FLUXBOX:-yes}
RUN_XTERM=${RUN_XTERM:-yes}

case $RUN_FLUXBOX in
  false|no|n|0)
    rm -f /app/conf.d/fluxbox.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /app/conf.d/xterm.conf
    ;;
esac


echo
[[ -f /app/localSetup.sh ]] && source /app/localSetup.sh || echo "No localSetup.sh found"
echo
echo Browse to http://localhost:8080/vnc.html
echo
echoexec supervisord -c /app/supervisord.conf > /app/entrypoint.log 2>&1
