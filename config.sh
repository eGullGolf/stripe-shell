# Default Parameters

# Secret API Key
stripeSecretKey='sk_test_kInGXJ4LFZjhbe74zoGSdoJb:' # Test Key from Stripe Docs

# Global Configuration
test -f /etc/stripe-shell/config.sh && . /etc/stripe-shell/config.sh

# Local Configuration
test -f ./config.my.sh && . ./config.my.sh
