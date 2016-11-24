#!/bin/sh
# Reject a connected merchant account
# Note: only managed accounts can be rejected.
#
# Parameters:
#   account - string, identifier of the account
#            (this required parameter must be given first)
#   reason - optional, enum, the reason for rejecting the account,
#            one of 'fraud', 'terms_of_service', or 'other',
#            defaults to 'other'
#
# Reference:
# [1] Stripe API > Connect > Account > Delete an account
# https://stripe.com/docs/api#delete_account
#
cd "$(dirname "$0")"

stripeAccountId="${1#account=}"
if test -z "$stripeAccountId"
then
  echo "Usage: $0 account reason" 1>&2
  exit 1
fi

stripeReason="${2:-'other'}"

shift 1
../request.sh POST "accounts/$stripeAccountId/reject" reason="$stripeReason"
