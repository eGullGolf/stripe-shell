#!/bin/sh
# Create an account for a merchant member of your platform
#
# Parameters:
#   email - string, the email address of the merchant
#   ... - see [1] for the list of optional parameters
#
# Output:
#   newly created account object, in JSON format
#
# References:
# [1] Stripe API > Connect > Account > Create an account
# https://stripe.com/docs/api#create_account

# [2] Stripe Docs > Deferred Account Activation > Creating a standalone account
# https://stripe.com/docs/connect/deferred-accounts
#
cd "$(dirname "$0")"

../request.sh POST accounts "$@"
