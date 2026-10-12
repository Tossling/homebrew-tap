cask "tossling" do
  version "0.6.1"
  sha256 "9f216415ed67150ddfa4f986726b3f80b0fc5fa6208a5d29db1cdefc65d94044"

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
