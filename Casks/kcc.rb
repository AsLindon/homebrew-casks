cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.3.1"
  sha256 arm:   "f8f8e3250c8f6e9aca1f73e2837faa8f576657d6a21ac7a80691d006554ea7ec",
         intel: "c78450dfcfede23d7677c2594fc10996d5b4fd3715f27a52079f9d2e926e0a1f"

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
