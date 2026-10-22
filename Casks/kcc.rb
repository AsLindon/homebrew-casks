cask "kcc" do
  arch arm: "arm", intel: "i386"

  version "12.1.1"
  sha256 arm:   "857e9db64662b88fea2ec9e392040e4ecb384a1da8dfbc8c006dea8b4cc233b4",
         intel: "288346fc2b583459eb76c171acfc244b397752724f336c51266e645ce62540ab"

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
