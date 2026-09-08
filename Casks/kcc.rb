cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.2.0"
  sha256 arm:   "7c12f1336bd8fba4f0a3b8af277258fbae5f3519ef00426b823a66c73547e7e3",
         intel: "6fc285191fa24ee6ec7c787da5670ff4785c07da5483d49ea46eadc274928130"

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
