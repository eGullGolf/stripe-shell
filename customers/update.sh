#!/bin/sh
# Update a customer
#
# Parameters:
#   customer - string, identifier of the customer to modify
#            (this required parameter must be given first)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Customers > Update a customer
# https://stripe.com/docs/api#update_customer
#
cd "$(dirname "$0")"

stripeCustomerId="${1#customer=}"
if test -z "$stripeCustomerId"
then
  echo "Usage: $0 customer" 1>&2
  exit 1
fi

shift 1
../request.sh POST "customers/$stripeCustomerId" $*
