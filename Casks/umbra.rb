cask "umbra" do
  version "1.0.4"
  sha256 "6c6c2ef9f23619f11e368dbe77fed28f3972c89d98b7582a41393c6130e7c274"

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
