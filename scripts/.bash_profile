if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  keychain ${HOME}/.ssh/id_rsa
fi
