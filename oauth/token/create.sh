#!/bin/sh
# Create a new token from an authorization code or a refresh token
#
# The authorization code is provided in the `code` parameter to the
# configured redirect URL following successful account creation or login
# of the user during the OAuth connection flow.
#
# The refresh token is found in the refresh_token property of the created
# token, and can be used to get a new access token of the same (live from live
# or test from test) or a lesser scope (test from live).
#
# Parameters:
#   code - string, value of the authorization code
#   refresh_token - string, value of the refresh token
#   grant_type - enum, one of 'authorization_code' (for an authorization code)
#                or 'refresh_token', for a refresh token
#   scope - optional, enum, one of 'read_write' or 'read_only',
#           defaults to the scope of the authorize request
#           or the scope of the refresh token.
#
# Note:
#   One of 'code' or 'refresh_token' must be provided,
#   and the 'grant_type' must be set accordingly.
#
# References:
# [1] Stripe Docs > Connect
#     > Connecting to Standalone Accounts
#     > Connect OAuth Reference
# https://stripe.com/docs/connect/reference#post-token
#
# [2] Stripe Docs > Connect
#     > Testing with Connect
#     > Generating test keys for live mode applications
# https://stripe.com/docs/connect/testing#test-keys-for-livemode-applications
#
cd "$(dirname "$0")" && cd ../..

. ./config.sh

if test -z "$stripeSecretKey"
then
  echo "Error: the stripeSecretKey must be configured." 1>&2
  exit 1
fi

{
  for stripeKeyValue in $*
  do
    echo "-d $stripeKeyValue"
  done
} | xargs curl --silent --show-error \
  'https://connect.stripe.com/oauth/token' \
  -d client_secret="$stripeSecretKey" \
  -d grant_type=authorization_code
