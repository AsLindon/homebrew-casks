cask "x-minecraft-launcher" do
  arch arm: "arm64", intel: "x64"

  version "0.66.2"
  sha256 arm:   "f2e42bc25f2cc9729831e4d1d02d8210fa841de65251d7c2eedcaa5f66a78f92",
         intel: "4c5ee0d05a75f75fcd7959013c20d8e2fa11e3ff238c0804d82a0f02c66d9ffb"

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
