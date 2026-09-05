cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.1.0"
  sha256 arm:   "c00586026f0d8d28c5e44569365917ba3ebfc85f7ce72d0d0902a1099fdadf17",
         intel: "3d7f40c73f851c5ecafcda00aeb6b895621f31c238002e8121bc040b69c79fc8"

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
