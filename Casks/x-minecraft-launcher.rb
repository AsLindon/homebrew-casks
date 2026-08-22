cask "x-minecraft-launcher" do
  arch arm: "arm64", intel: "x64"

  version "0.66.2"
  sha256 :no_check

  url "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v#{version}/xmcl-#{version}-#{arch}.dmg",
      verified: "github.com/Voxelum/x-minecraft-launcher/"
  name "XMCL"
  desc "Open-source Minecraft launcher with modern UX"
  homepage "https://github.com/Voxelum/x-minecraft-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "XMCL.app"
end
