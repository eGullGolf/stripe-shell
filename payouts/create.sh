#!/bin/sh
# Create a payout
#
# Parameters:
#   amount - integer, amount in fractional units of the currency (e.g. cents)
#   currency - string, 3-letter ISO code of the currency (e.g. USD)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Payouts > Create a payout
# https://stripe.com/docs/api#create_payout
#
cd "$(dirname "$0")"

../request.sh POST payouts "$@"
