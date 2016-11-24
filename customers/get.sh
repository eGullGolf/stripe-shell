#!/bin/sh
# Get the customer with given id
#
# Parameter:
#   customer - string, identifier of the customer
#
# Reference:
# [1] Stripe API > Core Resources > Customers > Retrieve a customer
# https://stripe.com/docs/api#retrieve_customer
#
cd "$(dirname "$0")"

stripeCustomerId="${1#customer=}"
if test -z "$stripeCustomerId"
then
  echo "Usage: $0 customer" 1>&2
  exit 1
fi

../request.sh GET "customers/$stripeCustomerId"
