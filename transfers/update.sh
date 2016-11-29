#!/bin/sh
# Update a transfer
#
# Parameters:
#   id - string, identifier of the transfer
#        (this required parameter must be given first)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Transfers > Update a transfer
# https://stripe.com/docs/api#update_transfer
#
cd "$(dirname "$0")"

stripeTransferId="${1#id=}"
if test -z "$stripeTransferId"
then
  echo "Usage: $0 id ..." 1>&2
  exit 1
fi

shift 1
../request.sh POST "transfers/$stripeTransferId" $*
