#!/bin/sh
# List all balance history
#
# Parameter:
#   limit - optional, integer, the maximum number of items to return,
#           between 1 and 100, defaults to 10.
#
cd "$(dirname "$0")"

../../request.sh GET 'balance/history' $*
