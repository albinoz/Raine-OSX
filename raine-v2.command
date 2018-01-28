## adam | 2018
## Build Last Raine

clear
tput bold ; echo "adam | 2018" ; tput sgr0
tput bold ; echo "Build Last Raine" ; tput sgr0

# Check Xcode CLI Install
tput bold ; echo "" ; echo "=-> Check Xcode CLI Install" ; tput sgr0
if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep version  ; then tput bold ; echo "Xcode CLI AllReady Installed" ; else tput bold ; echo "Installing Xcode CLI" ; tput sgr0 ; xcode-select --install
sleep 1
while ps -ax | grep -v grep | grep 'Install Command Line Developer Tools' >/dev/null ; do sleep 5 ; done
if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep version  ; then tput bold ; echo "Xcode CLI Was SucessFully Installed" ; else tput bold ; echo "Xcode CLI Was NOT Installed" ; tput sgr0 ; exit ; fi ; fi

# Homebrew Check
tput bold ; echo "" ; echo "=-> Homebrew Check" ; tput sgr0
if ls /usr/local/bin/brew ; then echo "HomeBrew is Installed" ; else echo "Installing HomeBrew" ; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ; fi

# Homebrew Update
tput bold ; echo "" ; echo "=-> Homebrew Update" ; tput sgr0
brew update
brew tap homebrew/games
brew cleanup --force -s raine

# Build Raine
tput bold ; echo "" ; echo "=-> Build Raine" ; tput sgr0
brew install raine
brew linkapps raine

# Open Raine
tput bold ; echo "" ; echo "=-> Build Raine" ; tput sgr0
open /Applications/Raine.app

# End Time
Time="$(echo 'obase=60;'$SECONDS | bc | sed 's/ /:/g' | cut -c 2-)"
tput bold ; echo "" ; echo "=-> End in $Time" ; tput sgr0