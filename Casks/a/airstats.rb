cask "airstats" do
  version "1.0"
  sha256 "cb09c57c7625e344f2050175bb0c0cc52ccb691531ee874631d536ddd485e46f"

  url "https://github.com/byrencheema/airstat/releases/download/v#{version}/AirStats.dmg",
      verified: "github.com/byrencheema/airstat/"
  name "AirStats"
  desc "Menu bar system monitor"
  homepage "https://airstat-site.vercel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "AirStats.app"

  zap trash: [
    "~/Library/Application Support/AirStats",
    "~/Library/Preferences/com.airstat.AirStats.plist",
    "~/Library/Saved Application State/com.airstat.AirStats.savedState",
  ]
end
