#!/bin/zsh
set -eo pipefail

APP="/Applications/TextMate.app"
USER_APP="/Users/jonathan/Applications/TextMate.app"
LSREGISTER="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"

# Avoid duplicate bundle registrations. Codex/LaunchServices can pick the
# user-local copy instead of this freshly installed /Applications copy.
if [[ -e "$USER_APP" && "$USER_APP" != "$APP" ]]; then
  "$LSREGISTER" -u "$USER_APP" 2>/dev/null || true
  rm -rf "$USER_APP"
fi

# 1. Create the AppleScript
SCRIPT=$(mktemp /tmp/codex-open-in-tmux-nvim-XXXXX.applescript)
cat > "$SCRIPT" << 'AS'
on open theFiles
  repeat with aFile in theFiles
    do shell script "/Users/jonathan/.local/scripts/codex-open-in-tmux-nvim " & quoted form of POSIX path of aFile
  end repeat
end open
AS

# 2. Compile into an app bundle
osacompile -o "$APP" "$SCRIPT"
rm "$SCRIPT"

# 3. Write the Info.plist (must declare Editor role + droplet executable)
cat > "$APP/Contents/Info.plist" << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleName</key>
  <string>TextMate</string>
  <key>CFBundleIdentifier</key>
  <string>com.macromates.TextMate</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
  <key>CFBundleShortVersionString</key>
  <string>1.0</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
  <key>CFBundleSignature</key>
  <string>????</string>
  <key>CFBundleExecutable</key>
  <string>droplet</string>
  <key>CFBundleIconFile</key>
  <string>droplet</string>
  <key>CFBundleDocumentTypes</key>
  <array>
    <dict>
      <key>CFBundleTypeName</key>
      <string>Plain Text</string>
      <key>CFBundleTypeRole</key>
      <string>Editor</string>
      <key>LSItemContentTypes</key>
      <array>
        <string>public.plain-text</string>
        <string>public.utf8-plain-text</string>
        <string>public.source-code</string>
        <string>public.script</string>
        <string>public.shell-script</string>
        <string>public.python-script</string>
        <string>public.ruby-script</string>
        <string>public.perl-script</string>
        <string>public.c-source</string>
        <string>public.c-header</string>
        <string>public.c-plus-plus-source</string>
        <string>public.objective-c-source</string>
        <string>public.swift-source</string>
        <string>public.assembly-source</string>
        <string>public.json</string>
        <string>public.xml</string>
        <string>public.yaml</string>
        <string>com.apple.property-list</string>
        <string>com.netscape.javascript-source</string>
        <string>public.css</string>
        <string>public.html</string>
      </array>
    </dict>
  </array>
  <key>NSAppleEventsUsageDescription</key>
  <string>This app routes files to tmux and Neovim.</string>
  <key>LSUIElement</key>
  <true/>
</dict>
</plist>
PLIST

# 4. Register with Launch Services
"$LSREGISTER" -f "$APP"

echo "Installed: $APP"
echo "Now choose TextMate in Codex -> Settings -> General -> Default open destination."
