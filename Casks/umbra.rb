cask "umbra" do
  version "1.0.3"
  sha256 "54aa6ab246b04900d48cc94c84ae58d5a2f1dc78329ef75fd6f3af70066fc255"

  url "https://github.com/JordanCampbellDesign/Umbra/releases/download/v#{version}/Umbra-#{version}.dmg"
  name "Umbra"
  desc "Control brightness, contrast, volume, input, and power of every monitor"
  homepage "https://github.com/JordanCampbellDesign/Umbra"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Umbra.app"
  # The app binary doubles as the CLI when it gets arguments.
  binary "#{appdir}/Umbra.app/Contents/MacOS/Umbra", target: "umbra"

  zap trash: [
    "~/Library/Application Support/Umbra",
    "~/Library/Preferences/design.jordancampbell.umbra.plist",
  ]

  caveats <<~EOS
    Umbra isn't notarized by Apple. If macOS says it can't check Umbra for malware,
    right-click Umbra in Applications and choose Open, once.
  EOS
end
