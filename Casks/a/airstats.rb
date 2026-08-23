cask "airstats" do
  version "1.3"
  sha256 "2f34110e65b6787eff164c6d37608428857e7bdb419e4a7d4cf6cd6423cd2382"

  url "https://github.com/byrencheema/airstats/releases/download/v#{version}/AirStats.dmg"
  name "AirStats"
  desc "Menu bar system monitor"
  homepage "https://airstats.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AirStats.app"

  zap trash: [
    "~/Library/Application Support/AirStats",
    "~/Library/Preferences/com.airstat.AirStats.plist",
    "~/Library/Saved Application State/com.airstat.AirStats.savedState",
  ]
end
