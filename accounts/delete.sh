#!/bin/sh
# Delete a connected merchant account
# Note: only managed accounts can be deleted.
#
# Parameters:
#   account - string, identifier of the account
#            (this required parameter must be given first)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Connect > Account > Delete an account
# https://stripe.com/docs/api#delete_account
#
cd "$(dirname "$0")"

stripeAccountId="${1#account=}"
if test -z "$stripeAccountId"
then
  echo "Usage: $0 account" 1>&2
  exit 1
fi

../request.sh DELETE "accounts/$stripeAccountId"
