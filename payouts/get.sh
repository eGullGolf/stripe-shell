#!/bin/sh
# Get the payout with given id
#
# Parameter:
#   id - string, identifier of the payout
#
# Reference:
# [1] Stripe API > Core Resources > Payouts > Retrieve a payout
# https://stripe.com/docs/api#retrieve_payout
#
cd "$(dirname "$0")"

stripePayoutId="${1#id=}"
if test -z "$stripePayoutId"
then
  echo "Usage: $0 id ..." 1>&2
  exit 1
fi

../request.sh GET "payouts/$stripePayoutId"
