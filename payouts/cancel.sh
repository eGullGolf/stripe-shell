#!/bin/sh
# Cancel a payout
#
# Parameters:
#   id - string, identifier of the payout
#        (this required parameter must be given first)
#
# Reference:
# [1] Stripe API > Core Resources > Payouts > Cancel a payout
# https://stripe.com/docs/api#cancel_payout
#
cd "$(dirname "$0")"

stripePayoutId="${1#id=}"
if test -z "$stripePayoutId"
then
  echo "Usage: $0 id ..." 1>&2
  exit 1
fi

shift 1
../request.sh POST "payouts/$stripePayoutId/cancel" "$@"
