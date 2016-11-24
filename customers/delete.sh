#!/bin/sh
# Delete given customer
#
# Parameter:
#   customer - string, identifier of the customer
#
# Reference:
# [1] Stripe API > Core Resources > Customers > Delete a customer
# https://stripe.com/docs/api#delete_customer
#

stripeCustomerId="${1#customer=}"
if test -z "$stripeCustomerId"
then
  echo "Usage: $0 customer" 1>&2
  exit 1
fi

../request.sh DELETE "customers/$stripeCustomerId"
