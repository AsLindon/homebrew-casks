cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.2,0.3.2"
  sha256 arm:   "58bb6acec9f0e07be959defddd75d1dadcdc50e99d4da5458f4b0f10e1268285",
       intel: "95177df725852276e1d12d417785ca7a9ae80784b232fb97ff25949e185a910e"

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
