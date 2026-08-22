cask "x-minecraft-launcher" do
  arch arm: "arm64", intel: "x64"

  version "0.66.2"
  sha256 arm:   "1a28a5d1e314c9a23a38d157c3e3c30f4261e9b13deeab0652e1dd75d5ffc4c0",
         intel: "387cfb9f1ba4c9f2f1a73923f8b4264d75f044ce864e7c7bc54d768fa9bfc4b8"

  url "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v#{version}/xmcl-#{version}-#{arch}.dmg",
      verified: "github.com/Voxelum/x-minecraft-launcher/"
  name "XMCL"
  desc "Open-source Minecraft launcher with modern UX"
  homepage "https://github.com/Voxelum/x-minecraft-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "X Minecraft Launcher.app"
end
