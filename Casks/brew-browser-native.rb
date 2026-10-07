cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.3,0.3.3"
  sha256 arm:   "01301c308b4e36aeb3f8ee6e805bf6306789881f7436d9aa6091ce4711e78292",
       intel: "d363b52f8d30985fe3a33a40059f5834458dac2c2bf9739dc9be94173a5e9b8f"

  url "https://github.com/msitarzewski/brew-browser/releases/download/v#{version.csv.first}/BrewBrowser-#{version.csv.second}-#{arch}.dmg"
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
