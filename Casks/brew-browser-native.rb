cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0,0.2.0"
  sha256 arm:   "1de89e29b6b0746d3a93a9788e2f66be0197384bcd5e8ff6bf6795dd0c06b31a",
       intel: "da6eac3d4309e25e45c9959754ddfb43b0b43ac1e4aad59dcb32aaf149caf7ef"

  url "https://github.com/msitarzewski/brew-browser/releases/download/v#{version.csv.first}/BrewBrowser-#{version.csv.second}-#{arch}.dmg",
      verified: "github.com/msitarzewski/brew-browser/"
  name "Brew Browser"
  desc "Native SwiftUI GUI for Homebrew"
  homepage "https://github.com/msitarzewski/brew-browser"

  livecheck do
    url "https://api.github.com/repos/msitarzewski/brew-browser/releases/latest"
    regex(/BrewBrowser-(\d+(?:\.\d+)+)-arm64\.dmg/i)
    strategy :json do |json, regex|
      release_version = json["tag_name"]&.delete_prefix("v")
      native_version = json["assets"]&.map { |asset| asset["name"][regex, 1] }&.compact&.first
      next if release_version.blank? || native_version.blank?

      "#{release_version},#{native_version}"
    end
  end

  depends_on macos: :tahoe
  
  app "BrewBrowser.app"

  zap trash: [
    "~/Library/Application Support/Brew Browser",
    "~/Library/Caches/com.zerologic.brew-browser-native",
    "~/Library/HTTPStorages/com.zerologic.brew-browser-native",
    "~/Library/Preferences/com.zerologic.brew-browser-native.plist",
    "~/Library/Saved Application State/com.zerologic.brew-browser-native.savedState",
  ]
end
