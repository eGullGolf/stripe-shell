# Default Parameters

# Secret API Key
stripeSecretKey='sk_test_BQokikJOvBiI2HlWgH4olfQ2' # Test Key from Stripe Docs

# Global Configuration
test -f /etc/stripe-shell/config.sh && . /etc/stripe-shell/config.sh

# Local Configuration
test -f ./config.my.sh && . ./config.my.sh
