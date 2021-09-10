#!/bin/sh
#
# homebrew caveats for nvm:
#
# Please note that upstream has asked us to make explicit managing
# nvm via Homebrew is unsupported by them and you should check any
# problems against the standard nvm install method prior to reporting.

# You should create NVM's working directory if it doesn't exist:

#   mkdir ~/.nvm

# Add the following to ~/.zshrc or your desired shell
# configuration file:

#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# You can set $NVM_DIR to any location, but leaving it unchanged from
# /opt/homebrew/opt/nvm will destroy any nvm-installed Node installations
# upon upgrade/reinstall.

# Type `nvm help` for further information.

if [[ ! -d ~/.nvm ]]; then
    mkdir ~/.nvm
fi
