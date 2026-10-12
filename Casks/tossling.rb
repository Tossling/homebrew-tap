cask "tossling" do
  version "0.6.0"
  sha256 "7c5098622c0f3c61b97bf94e7d4485da8e5c06b2fff3328328963df2f3320ce3"

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
