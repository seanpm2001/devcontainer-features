#!/bin/bash
set -x

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes no options.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test \ 
#                   --features fuelup   \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

ls $HOME/.fuelup/bin

echo $PATH

fuelup --version
forc --version

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" fuelup --version | grep 'fuelup'
check "execute command" forc --version | grep 'forc'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
