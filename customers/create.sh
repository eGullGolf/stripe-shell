#!/bin/sh
# Create a customer
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Customers > Create a customer
# https://stripe.com/docs/api#create_customer
#
cd "$(dirname "$0")"

../request.sh POST customers
