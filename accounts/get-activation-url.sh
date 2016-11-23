#!/bin/sh
# Get activation URL of given merchant account
#
# Parameter:
#   stripeUserId - string, the user_id identifier of the merchant account
#
# Output:
#   A URL to activate the merchant account.
#
# Note:
#   This URL only works until the account is activated.
#
# Reference:
# [1] Stripe Docs > Connect
#     > Deferred Account Activation
#     > Facilitating account activation
# https://stripe.com/docs/connect/deferred-accounts
#
cd "$(dirname "$0")" && cd ..

. ./config.sh

stripeConnectUserId="$1"
if test -z "$stripeConnectUserId"
then
  echo "Usage: $0 user_id" 1>&2
  exit 1
fi

if test -z "$stripeConnectClientId"
then
  echo 'Error: no stripeConnectClientId has been configured.' 1>&2
  exit 2
fi

stripeActivationUrl='https://dashboard.stripe.com/account/activate'
stripeActivationUrl="$stripeActivationUrl?client_id=$stripeConnectClientId"
stripeActivationUrl="$stripeActivationUrl&user_id=$stripeConnectUserId"

echo "$stripeActivationUrl"
