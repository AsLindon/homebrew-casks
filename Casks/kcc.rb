cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.0.3"
  sha256 arm:   "30fefe8aa9632dd16113e34bb2006cd4e7cb34f2d37efe76bb3fde85e8e0059c",
         intel: "fb96ac65eded7237ad2a1d26be749ce7da10bd12e90909a0a67b8c9081633a42"

  url "https://github.com/ciromattia/kcc/releases/download/v#{version}/kcc_macos_#{arch}_#{version}.dmg",
      verified: "github.com/ciromattia/kcc/"
  name "Kindle Comic Converter"
  desc "Convert comics and manga for e-book readers"
  homepage "https://github.com/ciromattia/kcc"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Kindle Comic Converter.app"

  zap trash: [
    "~/Library/Application Support/Kindle Comic Converter",
    "~/Library/Caches/Kindle Comic Converter",
    "~/Library/Preferences/Kindle Comic Converter.plist",
    "~/Library/Saved Application State/Kindle Comic Converter.savedState",
  ]
end
