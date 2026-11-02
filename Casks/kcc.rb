cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "12.1.5"
  sha256 arm:   "8ea23d5b118606725135611a38f89205c6fe29a17c0f0b03677f92acfc2ef1dc",
         intel: "7de67d0b11e8c74230d93a4aeb2ade595e5de7be9badbb8aee474b6a2a4603a6"

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
