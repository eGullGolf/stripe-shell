#!/bin/sh
# Revoke access to (unlink) a connected merchant account
#
# Parameter:
#   stripe_user_id - string, identifier of the connected merchant account
#
# Reference:
# [1] Stripe Docs > Connect
#     > Connecting to Standalone Accounts
#     > Connect OAuth Reference
# https://stripe.com/docs/connect/reference#post-deauthorize
#
cd "$(dirname "$0")" && cd ..

. ./config.sh

if test -z "$stripeSecretKey"
then
  echo "Error: the stripeSecretKey must be configured." 1>&2
  exit 1
fi

if test -z "$stripeConnectClientId"
then
  echo 'Error: no stripeConnectClientId has been configured.' 1>&2
  exit 2
fi

stripeUserId="${1#stripe_user_id=}"
if test -z "$stripeUserId"
then
  echo "Usage: $0 stripe_user_id" 1>&2
  exit 3
fi

curl --silent --show-error \
  -u "$stripeSecretKey:" \
  -d "client_id=$stripeConnectClientId" \
  -d "stripe_user_id=$stripeUserId" \
  'https://connect.stripe.com/oauth/deauthorize'
