# Compiler Flags
export LDFLAGS="-L/opt/homebrew/opt/node@14/lib -L/opt/homebrew/opt/libpq/lib -L/opt/homebrew/Cellar/openssl@1.1/1.1.1l/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@14/include -I/opt/homebrew/opt/libpq/include -I/opt/homebrew/Cellar/openssl@1.1/1.1.1/include $CPPFLAGS"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

# setup pyenv and pyenv-virtualenv'
eval "$(pyenv init --path)" # TODO: this should move to .zprofile and not .zshrc... but how?
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
