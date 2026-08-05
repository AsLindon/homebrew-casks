cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.0.1"
  sha256 arm:   "507b250184d5bd5c889c52d1db7b7e24518e4d6debe452ee2844dfd284898ddf",
         intel: "727fbdd0a78105dc68b239bfeea2b0c996d277de5a80225cef98891dd2481749"

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
