#!/bin/sh
# Create a transfer
#
# Parameters:
#   amount - integer, amount in fractional units of the currency (e.g. cents)
#   currency - string, 3-letter ISO code of the currency (e.g. USD)
#   destination - string, identifier of the destination bank account, card,
#                 or connected merchant account (with Stripe Connect);
#                 the string 'default_for_currency' can be use to refer to
#                 your default external account in the given currency
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Transfers > Create a transfer
# https://stripe.com/docs/api#create_transfer
#
cd "$(dirname "$0")"

../request.sh POST transfers $*
