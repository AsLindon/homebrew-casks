cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "13.0.1"
  sha256 arm:   "461b31e568ff8e800b77ecaba68a7f89d6121eba802c971f234d6d11b5ac2387",
         intel: "a7025ead74c71c7f568b4634e3478467164e665dd2390b0788bb6d5ed126c7c3"

  url "https://github.com/ciromattia/kcc/releases/download/v#{version}/kcc_macos_#{arch}_#{version}.dmg"
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
