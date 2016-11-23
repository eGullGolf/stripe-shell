#!/bin/sh
# List all balance history
#
# Parameter:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Balance > List all balance history
# https://stripe.com/docs/api/curl#balance_history
#
cd "$(dirname "$0")"

../../request.sh GET 'balance/history' $*
