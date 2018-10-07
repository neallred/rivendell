# OS Package manager packages to install



INSTALL_LIST_ALL=" \
  feh \
  lsof \
  nmap \
  ranger \
  wget
  "

# These tend to be X based programs
# vlc has a different install source on Mac, so include it in the Mac list as well
INSTALL_LIST_LINUX=" \
  i3 \
  vlc \
  xbindkeys \
  xclip \
  zathura
  "

INSTALL_LIST_MAC_CLI=" \
  "
# No Mac only CLI programs here yet

INSTALL_LIST_MAC_GUI=" \
  vlc
  "

# TODO: Think of a sensible way to avoid duplicating PACKAGE_INSTALL .bashrc and here
OS=`uname -s`
PACKAGE_MANAGER=""
PACKAGE_INSTALL=""
PACKAGE_MANAGER_UPDATE=""

set_package_manager() {
  if command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt-get"
    PACKAGE_INSTALL="sudo apt-get install"
    PACKAGE_MANAGER_UPDATE="sudo apt-get update"

  elif command -v pacman >/dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"
    PACKAGE_INSTALL="sudo pacman -S"
    PACKAGE_MANAGER_UPDATE="sudo pacman -Syu"

  elif command -v brew >/dev/null 2>&1; then
    PACKAGE_MANAGER="brew"
    PACKAGE_INSTALL="brew install"
    PACKAGE_MANAGER_UPDATE="brew update"

  elif command -v yum >/dev/null 2>&1; then
    PACKAGE_MANAGER="yum"
    PACKAGE_INSTALL="sudo yum install"
    PACKAGE_MANAGER_UPDATE="sudo yum update"

  elif command -v nix-env >/dev/null 2>&1; then
    PACKAGE_MANAGER="nix-env"
    PACKAGE_INSTALL="nix-env install"
    PACKAGE_MANAGER_UPDATE="nix-channel --update nixpkgs"

  else
    PACKAGE_MANAGER="unknown"

  fi
}

set_package_manager

$PACKAGE_MANAGER_UPDATE

$PACKAGE_INSTALL $INSTALL_LIST_ALL

if [ $OS = Linux ]; then
  $PACKAGE_INSTALL $INSTALL_LIST_LINUX

elif [ $OS = Darwin ]; then
  brew cask install $INSTALL_LIST_MAC_GUI

else
  echo "Package bootstrapping currently only supported on Linux and Mac"

fi

