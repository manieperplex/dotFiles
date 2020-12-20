#!/usr/bin/env sh

#set -e

## Config
#

SYSTEM_OS="Unknown"
SYSTEM_OS_VERSION="Unknown"
PACKAGE_MANAGER="Unknown"
GIT_VERSION="Unknown"
ANSIBLE_VERSION="Unknown"
ROOT_RUN=""

GIT_REPO_URL="https://github.com/manieperplex/dotFiles.git"
GIT_CLONE_FOLDER="$HOME/dotFiles"

ANSIBLE_PLAYBOOK_PATH="ansible/site.yml"
ANSIBLE_PLAYBOOK_CMD="ansible-playbook --inventory localhost, ${ANSIBLE_PLAYBOOK_PATH}"

## Func
#

# Print error message
error_print() {
	echo ${RED}"Error: $@"${RESET} >&2
}

# Detects if script is run as root
root_detect() {
  if ! [ $(id -u) -eq 0 ]; then
    ROOT_RUN="sudo "
  fi
}

# Install homebrew
install_homebrew() {
    printf "Installing Homebrew... If it's already installed, update.\n"

    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Hombrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        echo "Updating Homebrew..."
        brew update
    fi

    PACKAGE_MANAGER=$(brew -v)
}

# Clone git repository if not existing
clone_git_repo() {
    if [ ! -d "$GIT_CLONE_FOLDER" ] ; then
        printf "Cloning git repository $GIT_REPO_URL in folder: $GIT_CLONE_FOLDER \n"
        git clone --depth=1 --branch master "$GIT_REPO_URL" "$GIT_CLONE_FOLDER"
    fi
}

# Install ansible if not existing
install_ansible() {
    printf "Installing Ansible... If it's already installed, update.\n"
    if [[ $(command -v ansible) == "" ]]; then
        echo "Installing Ansible..."
        brew install ansible
    else
        echo "Updating Ansible..."
        brew upgrade ansible
    fi

    ANSIBLE_VERSION=$(ansible --version)
}

# Run ansible playbook installation
run_ansible() {

    printf "\n"
    printf "### INFORMATION\n"
    printf "SYSTEM_OS=$SYSTEM_OS\n"
    printf "SYSTEM_OS_VERSION=$SYSTEM_OS_VERSION\n"
    printf "PACKAGE_MANAGER=$PACKAGE_MANAGER\n"
    printf "GIT_VERSION=$GIT_VERSION\n"
    printf "ANSIBLE_VERSION=$ANSIBLE_VERSION\n"
    printf "ROOT_RUN=$ROOT_RUN\n"
    printf "\n"

    printf "Run ansible-playbook syntax check...\n"
    ${ANSIBLE_PLAYBOOK_CMD} --syntax-check

    printf "Run ansible-playbook install...\n"
    ${ANSIBLE_PLAYBOOK_CMD}
}

## Main
#

printf "Start installing Ansible prerequisites (git, etc.)...\n"
root_detect

unameOut="$(uname -s)"
case "${unameOut}" in
    Darwin*)
        SYSTEM_OS="OSX"
        SYSTEM_OS_VERSION=$(defaults read loginwindow SystemVersionStampAsString)

        install_homebrew
        clone_git_repo
        install_ansible
        cd "$GIT_CLONE_FOLDER"
        run_ansible
        ;;
    *)
        error_print "UNKNOWN OS: ${unameOut}\nPlease add support in script!\n"
        ;;
esac
