cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "10.4.0"
  sha256 arm:   "b5699a35486973caf5b6ec1ae4955677ad592c27d33372c3a49f152150e149c3",
         intel: "287d037f94fa6859ea5080f74d7b7ad81e35ac22fa69abfdf5c6bda935eb0f45"

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
