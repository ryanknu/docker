#!/bin/sh

ARGS=""
# check if command requires config file
case $1 in
    breakpoint|create|migrate|rollback|status|seed:create|seed:run) ARGS="-c ${PHINX_CONFIG:-/phinx/phinx.php}";;
    *) ARGS="";;
esac

#run phinx
/phinx/vendor/bin/phinx $@ $ARGS