# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

echo '>> updating finder settings'

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# default: no default
defaults write com.apple.finder QuitMenuItem -bool true

## Finder: disable window animations and Get Info animations
# default: no default
defaults write com.apple.finder DisableAllAnimations -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# For desktop use PfDe
# default: -string "PfLo" 
defaults write com.apple.finder NewWindowTarget -string "PfLo"
# default: 
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"

### Show/Hide all icons on the desktop
# default: -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# default: -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# default: no default
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# default: -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# default: no default
defaults write com.apple.finder CreateDesktop -bool true

## Finder: show hidden files by default
# default: -bool false
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
# default: no default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
# default: -bool true (maybe)
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
# default: -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
# default: no default 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
# default: no default
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
# default: no default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
# default: no default
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
# default: -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
# default: -float 0.4
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
# default: no default
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# default: no default
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable disk image verification
# default: no default
defaults write com.apple.frameworks.diskimages skip-verify -bool true
# default: no default
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# default: no default
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
# default: no default
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# default: no default
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# default: no default
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
# default: ?
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
# default: none
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
# default: true
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

echo '>> updating dock settings'

# Enable highlight hover effect for the grid view of a stack (Dock)
# default: no default
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items in pixels
defaults write com.apple.dock tilesize -int 25

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
# default: -bool false
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool false

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# default: ()
defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock
# default: no default
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
# default: no default
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
# default: no default
defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard
# default: no default
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
# default: no default
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
# default: true
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
# default: no default
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# default: no default
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
# default: true
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
# default: no default
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
# default: no default
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
#defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Reset Launchpad, but keep the desktop wallpaper intact
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# # Hot corners
# # Possible values:
# #  0: Disabled
# #  1: Nothing
# #  2: Mission Control
# #  3: Show application windows
# #  4: Desktop
# #  5: Start screen saver
# #  6: Disable screen saver
# #  7: Dashboard
# # 10: Put display to sleep
# # 11: Launchpad
# # 12: Notification Center
# # 13: Lock Screen
# # 14: Quick Note
# # Top left screen corner → Nothing
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Nothing
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner → Nothing
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# # Bottom right screen corner → Nothing
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Put the Dock on the left of the screen
defaults write com.apple.dock "orientation" -string "left"

# disable drag and drop of text
defaults write -g NSDragAndDropTextDelay -int -1

# default to paste and match style. Sometimes when pasting images you need to do the normal paste
defaults write -g NSUserKeyEquivalents -dict-add 'Paste and Match Style' '@v';

# disable two finger back/forward navigation in chrome
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# enable mouse right click
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

killall Dock
killall Finder
killall SystemUIServer
killall NotificationCenter
killall cfprefsd
