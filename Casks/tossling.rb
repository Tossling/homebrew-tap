cask "tossling" do
  version "0.2.1"
  sha256 "d44873e56e485e2fe496ca60ba206f5206976d3e02d03ae0654ff2d0ffdfbaed"

  url "https://github.com/tossling/tossling-desktop/releases/download/v#{version}/Tossling-#{version}.dmg"
  name "Tossling"
  desc "One end-to-end encrypted clipboard for your Macs and Android phone"
  homepage "https://github.com/tossling/tossling-desktop"

  depends_on macos: ">= :ventura"

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
