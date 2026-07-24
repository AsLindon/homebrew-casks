cask "clashx-pro" do
  version "1.140.0"
  sha256 "90c9ff959baf355cd3bca101db218028b095607cd2c797ae73d446d76eebab0a"

  url "https://github.com/ClashX-Pro/ClashX/releases/download/#{version}/ClashX.dmg"
  name "ClashX"
  desc "Rule-based proxy client for macOS"
  homepage "https://github.com/ClashX-Pro/ClashX"
  
  livecheck do
    skip "Handled by GitHub Actions"
  end
  
  app "ClashX.app"

  zap trash: [
    "~/.config/clash",
    "~/Library/Application Support/ClashX",
    "~/Library/Caches/com.west2online.ClashX",
    "~/Library/Preferences/com.west2online.ClashX.plist",
  ]
end
