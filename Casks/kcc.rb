cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "12.0.0"
  sha256 arm:   "bbfd451af6c215949b5b6e040152e577da2023b3684ace726c6b9e777ad7540b",
         intel: "1b047592ea5bfdb8b86ad30bea236933906674059a243b715d51ccdfd51a6abd"

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
