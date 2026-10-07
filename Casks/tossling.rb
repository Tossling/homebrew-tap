cask "tossling" do
  version "0.4.1"
  sha256 "bdd030d1cb548f7293bcb0953f9f26727482c09de3ca5376a02a9b663b188efa"

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
