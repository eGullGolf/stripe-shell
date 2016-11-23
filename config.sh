# Default Parameters
# Actual values must be provided in custom configuration

# Secret API Key
stripeSecretKey='' # empty by default to raise an error if not configured

# Connect Client Id
stripeConnectClientId='' # empty by default to raise an error if not configured

# Custom Configuration
# Note: when sourcing this file, current directory must be set to the root
# folder of the project (parent of config.sh) for resolution of relative paths.
test -f /etc/stripe-shell/config.sh && . /etc/stripe-shell/config.sh
test -f ./config.my.sh && . ./config.my.sh
