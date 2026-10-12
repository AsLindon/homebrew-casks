cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.4,0.3.4"
  sha256 arm:   "ee35f07fd1537bb601a3d25394a9ac9fe572f892172c19786272f48839b7c0d6",
       intel: "a274c917657deef672fe5764bcef7a8589d062bd5c78b29f120238d971a79c89"

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
