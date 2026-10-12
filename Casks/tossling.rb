cask "tossling" do
  version "0.6.2"
  sha256 "cf5dd98600df9f866be854ed8dbc5d40014df0760deb9b79c641c9d96aa02860"

  url "https://github.com/tossling/tossling-desktop/releases/download/v#{version}/Tossling-#{version}.dmg"
  name "Tossling"
  desc "One end-to-end encrypted clipboard for your Macs and Android phone"
  homepage "https://github.com/tossling/tossling-desktop"

  auto_updates true
  depends_on macos: :ventura

  app "Tossling.app"
  binary "#{appdir}/Tossling.app/Contents/Resources/tossling/bin/tossling"
  binary "#{appdir}/Tossling.app/Contents/Resources/tossling/bin/tossling", target: "tossy"

  uninstall launchctl: "com.kopylovis.tossling.desktop.agent",
            quit:      "com.kopylovis.tossling.desktop"

  zap trash: [
    "~/.cache/tossling",
    "~/.config/tossling",
    "~/Library/Logs/Tossling.log",
  ]
end
