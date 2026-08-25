cask "airstats" do
  version "1.3.2"
  sha256 "896710892e11639003807167b1b5296cf4d8f47a132aa44f94a47cdec4543455"

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
