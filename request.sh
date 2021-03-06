#!/bin/sh
# Send a generic request to Stripe API using cUrl
#
# Parameters:
#   $1 - string, name of the HTTP method: 'GET', 'POST', 'DELETE',...
#        or 'FILE' to upload a file as multipart/form-data
#   $2 - string, name of the API end-point
#   ... - API parameters in the form name='value',
#         where the value is URL-encoded and quoted if needed for safety
#
# Environment:
#   stripeConnectAs - string, identifier of a connected merchant account,
#                     to send an API request on its behalf; see [1].
#
# Reference:
# [1] Stripe Docs > Connect > Authentication with Connect
# https://stripe.com/docs/connect/authentication
#
cd "$(dirname "$0")"

. ./config.sh

httpMethod="$1"
stripeApiName="$2"
if test -z "$httpMethod" -o -z "$stripeApiName"
then
  echo "Usage: $0 httpMethod stripeApiName [param='value']..." 1>&2
  exit 1
fi

if test -z "$stripeSecretKey"
then
  echo "Error: the stripeSecretKey must be configured." 1>&2
  exit 2
fi

if test "$stripeApiName" = 'files'
then
  stripeApiBaseUrl='https://files.stripe.com/v1'
else
  stripeApiBaseUrl='https://api.stripe.com/v1'
fi

if test "$httpMethod" = 'FILE'
then
  httpMethod='POST'
  field='--form'
else
  field='--data'
fi

{
  echo "$stripeApiBaseUrl/$stripeApiName"
  echo "-u '$stripeSecretKey:'"

  if test -n "$stripeConnectAs"
  then
    echo "-H 'Stripe-Account: $stripeConnectAs'"
  fi

  shift 2
  for stripeKeyValue
  do
    echo "$field \"$stripeKeyValue\""
  done
} | xargs curl --silent --show-error --request "$httpMethod"
