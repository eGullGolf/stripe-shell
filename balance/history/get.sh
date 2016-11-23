#!/bin/sh
# Get the balance transaction with given id
#
# Parameter:
#   id - string, the identifier of the balance transaction
#
# Reference:
# [1] Stripe API > Core Resources > Balance > Retrieve a balance transaction
# https://stripe.com/docs/api/curl#retrieve_balance_transaction
#
cd "$(dirname "$0")"

stripeTransactionId="${1#id=}"
if test -z "$stripeTransactionId"
then
  echo "Usage: $0 id" 1>&2
  exit 1
fi

shift 1
../../request.sh GET "balance/history/$stripeTransactionId" $*
