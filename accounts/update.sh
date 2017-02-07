#!/bin/sh
# Update a connected merchant account
# Note: only managed accounts can be updated.
#
# Parameters:
#   account - string, identifier of the account
#            (this required parameter must be given first)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Connect > Account > Update an account
# https://stripe.com/docs/api#update_account
#
cd "$(dirname "$0")"

stripeAccountId="${1#account=}"
if test -z "$stripeAccountId"
then
  echo "Usage: $0 account" 1>&2
  exit 1
fi

shift 1
../request.sh POST "accounts/$stripeAccountId" "$@"
