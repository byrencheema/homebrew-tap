cask "airstats" do
  version "1.1"
  sha256 "7a552b45ad57022865864fec7bd49216e387b9a21471db97d33191ef260f2777"

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
