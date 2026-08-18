cask "airstats" do
  version "1.2.1"
  sha256 "4c991d5aa5bdc3f2ccb7136f548d1f1a6003b296c817e80ffe31f1e4ac83ce8a"

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
