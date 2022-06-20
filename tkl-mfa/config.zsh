export AWS_MFA_1PASSWORD_ITEM=Amazon
source "$HOME/.opsignin"
opsignin() {
  op signin -f >! "$HOME/.opsignin"
  source "$HOME/.opsignin"
  tkl-mfa
}