cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "11.3.2"
  sha256 arm:   "949d2042357762d9a2db6ecd6677ea6cd638a801bfd0662230b47b45ec2ac51e",
         intel: "9029738010786c0928135ac9b3d52b6f12366fbc3a80798b1cdff47f9aaf5a45"

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
