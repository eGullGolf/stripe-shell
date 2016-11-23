#!/bin/sh
# List all balance history
#
# Parameter:
#   limit - optional, integer, the maximum number of items to return,
#           between 1 and 100, defaults to 10.
#
# Reference:
# [1] Stripe API > Core Resources > Balance > List all balance history
# https://stripe.com/docs/api/curl#balance_history
#
cd "$(dirname "$0")"

../../request.sh GET 'balance/history' $*
