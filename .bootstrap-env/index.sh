#!/bin/bash

# The purpose of this file is to run one time setup that does not
# belong in .ford_of_bruinen itself. Vim setup, directory setup, language run time setup,
# that sort of thing.

# The goal is that everything in here should only need to be run once, not on every
# shell session. The goal is also that everything in here can be run an arbitrary
# amount of times without clobbering or breaking anything.
# It is preferred that this be the top level, "import" file

logStep() {
  echo
  echo $@
  echo $@ | tr [:print:] =
  echo
}


logStep "Setting up vim"

. $HOME/.bootstrap-env/vim.sh

logStep "Setting up nvm/node"

. $HOME/.bootstrap-env/node.sh

logStep "Setting up haskell"

. $HOME/.bootstrap-env/haskell.sh

logStep "Creating common directories"

. $HOME/.bootstrap-env/directories.sh

logStep "Installing default packages"

. $HOME/.bootstrap-env/packages.sh
