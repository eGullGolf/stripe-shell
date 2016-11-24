#!/bin/sh
# Create or link a merchant account to your platform account
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe Docs > Connect
#     > Connecting to Standalone Accounts
#     > Connect OAuth Reference
# https://stripe.com/docs/connect/reference#get-authorize
#
cd "$(dirname "$0")" && cd ..

. ./config.sh

if test -z "$stripeConnectClientId"
then
  echo 'Error: no stripeConnectClientId has been configured.' 1>&2
  exit 2
fi

printf '%s' 'https://connect.stripe.com/oauth/authorize'
printf '%s' "?client_id=$stripeConnectClientId"
printf '%s' '&response_type=code'
for stripeKeyValue in $*
do
  printf '%s' "&$stripeKeyValue"
done
echo
