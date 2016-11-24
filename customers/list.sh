#!/bin/sh
# List all customers
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Customers > List all customers
# https://stripe.com/docs/api#list_customers
#
cd "$(dirname "$0")"

../request.sh GET customers
