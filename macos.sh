#!/usr/bin/env bash

# macOS System Preferences
# Captured from Joel's Mac - January 2026
#
# Run: ./macos.sh
# Note: Some settings require logout/restart to take effect

set -e

echo "Configuring macOS settings..."

# Close System Preferences to prevent overriding changes
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo "Configuring General UI/UX..."

# Dark mode with auto-switch
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Scrollbars: Automatic
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable sound feedback when adjusting volume
defaults write NSGlobalDomain "com.apple.sound.beep.feedback" -bool false

# Reduce beep volume
defaults write NSGlobalDomain "com.apple.sound.beep.volume" -float 0.433161

###############################################################################
# Keyboard                                                                    #
###############################################################################

echo "Configuring Keyboard..."

# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Short delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Enable full keyboard access for all controls (Tab in dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 1

# Use function keys as standard function keys
defaults write NSGlobalDomain "com.apple.keyboard.fnState" -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool true

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Enable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool true

# Disable web auto-correct
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Trackpad                                                                    #
###############################################################################

echo "Configuring Trackpad..."

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Disable three-finger horizontal swipe (conflicts with three-finger drag)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0

# Disable three-finger vertical swipe
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# Enable three-finger tap for lookup
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Enable right-click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Enable pinch to zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# Enable rotate
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

# Enable four-finger swipe gestures
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2

# Enable notification center gesture (two-finger from right edge)
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Natural scrolling
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool true

# Disable force click
defaults write NSGlobalDomain "com.apple.trackpad.forceClick" -bool false

# Trackpad speed
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -float 1

###############################################################################
# Mouse                                                                       #
###############################################################################

echo "Configuring Mouse..."

# Mouse speed
defaults write NSGlobalDomain "com.apple.mouse.scaling" -float 0.6875

# Disable scroll wheel acceleration
defaults write NSGlobalDomain "com.apple.scrollwheel.scaling" -int 0

###############################################################################
# Dock                                                                        #
###############################################################################

echo "Configuring Dock..."

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 46

# Magnification
defaults write com.apple.dock largesize -int 77

# Position on screen: bottom
defaults write com.apple.dock orientation -string "bottom"

# Minimize windows using Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Don't minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool false

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# 14: Quick Note

# Top left screen corner: Start screen saver
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

# Bottom right screen corner: disabled (modifier key required)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 1048576

###############################################################################
# Finder                                                                      #
###############################################################################

echo "Configuring Finder..."

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Default view: List view
# Options: icnv (icons), clmv (columns), Flwv (cover flow), Nlsv (list)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# New Finder windows open to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons on desktop for external drives, servers, and removable media
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Automatically remove items from Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Show the sidebar
defaults write com.apple.finder ShowSidebar -bool true

# Hide recent tags in sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Reduce spring loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

# Enable window dragging from anywhere (with Ctrl+Cmd)
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

###############################################################################
# Screenshots                                                                 #
###############################################################################

echo "Configuring Screenshots..."

# Create Screenshots folder if it doesn't exist
mkdir -p "${HOME}/Pictures/Screenshots"

# Save screenshots to ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Save screenshots in JPG format (smaller files)
# Other options: BMP, GIF, JPG, PDF, TIFF, PNG
defaults write com.apple.screencapture type -string "jpg"

# Save to file (not clipboard)
defaults write com.apple.screencapture target -string "file"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Menu Bar Clock                                                              #
###############################################################################

echo "Configuring Menu Bar Clock..."

# Show day of week
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

# Use 24-hour clock
defaults write com.apple.menuextra.clock Show24Hour -bool true

# Don't show date
defaults write com.apple.menuextra.clock ShowDate -bool false

# Don't show seconds
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# Digital clock (not analog)
defaults write com.apple.menuextra.clock IsAnalog -bool false

###############################################################################
# Activity Monitor                                                            #
###############################################################################

echo "Configuring Activity Monitor..."

# Open Activity Monitor main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Show the CPU tab by default
defaults write com.apple.ActivityMonitor SelectedTab -int 0

###############################################################################
# TextEdit                                                                    #
###############################################################################

echo "Configuring TextEdit..."

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Mac App Store                                                               #
###############################################################################

echo "Configuring Mac App Store..."

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install system data files and security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

###############################################################################
# Apply Changes                                                               #
###############################################################################

echo ""
echo "Applying changes..."

# Kill affected applications
for app in "Activity Monitor" \
    "Dock" \
    "Finder" \
    "SystemUIServer"; do
    killall "${app}" &>/dev/null || true
done

echo ""
echo "Done! Some changes may require a logout/restart to take effect."
echo ""
echo "Settings that require logout:"
echo "  - Trackpad settings"
echo "  - Keyboard settings"
echo ""
echo "Settings that require restart:"
echo "  - Some Finder settings"
