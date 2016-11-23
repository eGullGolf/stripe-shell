#!/bin/sh
# List of all connected merchant accounts
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Connect > Account > List all connected accounts
# https://stripe.com/docs/api/curl#list_accounts
#
cd "$(dirname "$0")"

../request.sh GET accounts
