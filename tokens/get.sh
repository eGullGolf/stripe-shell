#!/bin/sh
# Get the token with given id
#
# Parameter:
#   token - string, identifier of the token
#
# Reference:
# [1] Stripe API > Core Resources > Tokens > Retrieve a token
# https://stripe.com/docs/api#retrieve_token
#
cd "$(dirname "$0")"

stripeTokenId="${1#token=}"
if test -z "$stripeTokenId"
then
  echo "Usage: $0 token" 1>&2
  exit 1
fi

../request.sh GET "tokens/$stripeTokenId"
