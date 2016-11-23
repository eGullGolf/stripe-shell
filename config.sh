# Default Parameters

# Secret API Key
stripeSecretKey='' # actual key must be provided in custom configuration

# Custom Configuration
test -f /etc/stripe-shell/config.sh && . /etc/stripe-shell/config.sh
test -f ./config.my.sh && . ./config.my.sh
