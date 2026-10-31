cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "12.1.4"
  sha256 arm:   "14dca656d8e593caf6341a8dad53c77628e948adc89097984b43efbd13c0cb56",
         intel: "1d05654a12c13f82a0135896bf555237659416ec52341647e56af36357d00c8a"

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
