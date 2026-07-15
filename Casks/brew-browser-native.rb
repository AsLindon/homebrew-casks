cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.1,0.3.1"
  sha256 arm:   "1713acfda1f7d90a4da191060aeb6746244b512210730fc2c150ef87a9de450d",
       intel: "e6c3be1217455abd627aec0a034d600431f0271fcafbc5b3ed7c97fe2139748f"

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
