`.` Files
========

This repository contains my `.` Files an [Ansible](https://en.wikipedia.org/w/index.php?oldid=803771758) playbook

# xcode-select (MacOsX)
`xcode-select --install`
# Usage
1. Run `sh -c "$(curl -sSL https://raw.githubusercontent.com/manieperplex/dotFiles/master/setup.sh)"`
  * Executes setup script
  * Download repository to home folder
  * Install ansible prerequisites
  * Run Ansible
2. Customize [ansible/roles/dotfiles/src/bash_zsh/all_secret.sh](ansible/roles/dotfiles/src/bash_zsh/all_secret.sh)
3. Run `ansible-playbook --inventory localhost, ansible/site.yml`

# Feature
* [x] Setup script to prepare Ansible
* [x] [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) setup
* [x] dotfiles setup, optimizations
* [x] .gitconfig
* [x] vim setup incl. [vim-plug](https://github.com/junegunn/vim-plug) + plugins
* [x] tmux setup incl. [tpm](https://github.com/tmux-plugins/tpm) + plugins
* [x] Sublime setup
* [x] Python simple setup
* [ ] Python setup with [pyenv](https://github.com/pyenv/pyenv)
  * when pyenv [issue](https://github.com/pyenv/pyenv/issues/1643) is solved or a workaround is available
  * install latest with [xxenv-latest](https://github.com/momo-lab/xxenv-latest)
* [x] OSX [Homebrew](https://brew.sh/) setup
* [x] OSX [Homebrew Cask](https://caskroom.github.io/) setup
* [x] OSX Homebrew cleanup
* [x] OSX cli configuration
* [ ] OSX system configuration scutil see [here](http://osxdaily.com/2012/10/24/set-the-hostname-computer-name-and-bonjour-name-separately-in-os-x/)
* [x] OSX Dock configuration using [dockutil](https://github.com/kcrawford/dockutil)
* [ ] OSX Apple store installation
* [x] OSX iTerm2 configuration see [here](http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/)
* [x] OSX file associations using [duti](https://github.com/moretension/duti)
* [ ] OSX configure [loginitems](https://github.com/OJFord/loginitems)
* [x] VSCode config setup
* [x] VSCode install extensions
* [ ] [Testing with Travis CI](https://github.com/geerlingguy/mac-dev-playbook/blob/master/.travis.yml) support
* [ ] Testing using Packer to build image see [this](https://nickcharlton.net/posts/automating-macos-using-ansible.html)
* [ ] Testing with local VirtualBox see [this](https://github.com/geerlingguy/macos-virtualbox-vm) and [this](http://tobiwashere.de/2017/10/virtualbox-how-to-create-a-macos-high-sierra-vm-to-run-on-a-mac-host-system/)
* [x] Ansible installation for OSX
* [ ] Ansible installation for Linux
* [ ] Hardening https://blog.bejarano.io/hardening-macos.html