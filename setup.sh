#!/usr/bin/env sh

set -e

## Config
#

SYSTEM_OS="Unknown"
SYSTEM_OS_VERSION="Unknown"
PACKAGE_MANAGER="Unknown"
ROOT_RUN=""

## Func
#

# Print error message
error_print() {
	echo ${RED}"Error: $@"${RESET} >&2
}

# Detects if script is run as root
function root_detect() {
  if ! [ $(id -u) -eq 0 ]; then
    ROOT_RUN="sudo "
  fi
}

# Install homebrew
function install_homebrew() {
    info "Installing Homebrew... If it's already installed, this will do nothing."

    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Hombrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Updating Homebrew"
        brew update
    fi

    PACKAGE_MANAGER=$(command -v brew)
}

## Main
#

printf "Start installing Ansible prerequisites (git, etc.).\n"
printf "After this is finished there is a prompt coming - be prepared!\n"
root_detect

unameOut="$(uname -s)"
case "${unameOut}" in
    Darwin*)
      SYSTEM_OS="OSX"
      SYSTEM_OS_VERSION=$(defaults read loginwindow SystemVersionStampAsString)

      install_homebrew

        printf "\n"
        printf "### INFORMATION\n"
        printf "SYSTEM_OS=$SYSTEM_OS\n"
        printf "SYSTEM_OS_VERSION=$SYSTEM_OS_VERSION\n"
        printf "PACKAGE_MANAGER=$PACKAGE_MANAGER\n"
        printf "ROOT_RUN=$ROOT_RUN\n"
        printf "\n"

      ;;
    *)
      error_print "UNKNOWN OS: ${unameOut}\nPlease add support in script!\n"
      ;;
esac
