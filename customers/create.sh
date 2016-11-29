#!/bin/sh
# Create a customer
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# References:
# [1] Stripe API > Core Resources > Customers > Create a customer
# https://stripe.com/docs/api#create_customer
#
# [2] Stripe Docs > Sharing Customers
# https://stripe.com/docs/connect/shared-customers
#
cd "$(dirname "$0")"

../request.sh POST customers $*
