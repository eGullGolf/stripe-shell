#!/bin/sh
# Get the list of transfers sent from or to your Stripe account
#
# Parameters:
#    ... - see [1] for the list of optional parameters used for filtering
#
# Reference:
# [1] Stripe API > Core Resources > Transfers > List all transfers
# https://stripe.com/docs/api#list_transfers
#
cd "$(dirname "$0")"

../request.sh GET transfers "$@"
