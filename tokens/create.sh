#!/bin/sh
# Create a token which stands for a payment source (credit card, ...)
# for a single use (payment or creation of a customer or managed account)
#
# Parameters:
#   ... - see [1], [2], [3] for the list of parameters available,
#         depending on the type of payment source.
#         A card, bank_account or pii identifier or details must be provided.
#
# References:
# [1] Stripe API > Core Resources > Tokens > Create a card token
# https://stripe.com/docs/api#create_card_token
#
# [2] Stripe API > Core Resources > Tokens > Create a bank account token
# https://stripe.com/docs/api#create_bank_account_token
#
# [3] Stripe API > Core Resources > Tokens > Create a PII token
# (PII: personally identifiable information)
# https://stripe.com/docs/api#create_pii_token
#
cd "$(dirname "$0")"

../request.sh POST tokens $*
