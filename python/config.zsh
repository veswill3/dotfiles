# setup pyenv and pyenv-virtualenv'

eval "$(pyenv init --path)" # TODO: this should move to .zprofile and not .zshrc... but how?
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
