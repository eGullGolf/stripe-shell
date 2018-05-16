#!/bin/sh
# Get the list of payouts sent from your Stripe account to bank accounts
#
# Parameters:
#    ... - see [1] for the list of optional parameters used for filtering
#
# Reference:
# [1] Stripe API > Core Resources > Payouts > List all payouts
# https://stripe.com/docs/api#list_payouts
#
cd "$(dirname "$0")"

../request.sh GET payouts "$@"
