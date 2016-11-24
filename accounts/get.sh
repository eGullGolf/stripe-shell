#!/bin/sh
# Get connected merchant account with given id
#
# Parameter:
#   account - string, the account identifier
#
# Reference:
# [1] Stripe API > Connect > Account > Retrieve account details
#
cd "$(dirname "$0")"

stripeAccountId="${1#account=}"
if test -z "$stripeAccountId"
then
  echo "Usage: $0 account" 1>&2
  exit 1
fi

../request.sh GET "accounts/$stripeAccountId"
