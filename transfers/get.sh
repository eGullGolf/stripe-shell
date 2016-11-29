#!/bin/sh
# Get the transfer with given id
#
# Parameter:
#   id - string, identifier of the transfer
#
# Reference:
# [1] Stripe API > Core Resources > Transfers > Retrieve a transfer
# https://stripe.com/docs/api#retrieve_transfer
#
cd "$(dirname "$0")"

stripeTransferId="${1#id=}"
if test -z "$stripeTransferId"
then
  echo "Usage: $0 id ..." 1>&2
  exit 1
fi

../request.sh GET "transfers/$stripeTransferId"
