cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "10.2.0"
  sha256 arm:   "3aa84049ed9b7d46b5bbb66042a96a384a22d1658c9a9336f4d0a90b2dde5075",
         intel: "05cf5b8ec3f9d319b27e05243e551092e3e5729b7c2c6226decdce9fa42f5c29"

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
