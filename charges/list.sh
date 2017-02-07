#!/bin/sh
# List all charges
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Charges > List all charges
# https://stripe.com/docs/api/curl#list_charges
#
cd "$(dirname "$0")"

../request.sh GET charges "$@"
