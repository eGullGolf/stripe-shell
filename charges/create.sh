#!/bin/sh
# Create a charge
#
# Parameters:
#   amount - number, positive value of the charge in the smallest currency unit
#            (e.g. cents). The minimum charge is $0.50 (or equivalent).
#   currency - string, 3-letter ISO code of the currency
#   customer - string, identifier of the customer that will be charged.
#              Use customer for multiple charges of the same customer.
#   source - string, identifier of the payment source that will be charged,
#            e.g. a credit card. Use source for single charges of a
#            credit card. One of customer or source must be provided.
#   ... - see [1] for details of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Charge > Create a charge
# https://stripe.com/docs/api/curl#create_charge
#
cd "$(dirname "$0")"

../request.sh POST charges "$@"
