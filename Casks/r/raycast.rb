cask "raycast" do
  arch arm: "arm", intel: "x86_64"

  on_big_sur :or_older do
    version "1.50.0"
    sha256 arm:   "a6fb8f2e097768b74b5ddf9e9f9c127b1fdfa980993a20c0d3b593a2e3fa0534",
           intel: "b46f66225fdaed22b59d8c8d319a63961374c7fd47b7b8a40ef5573e6f36e888"

    livecheck do
      skip "Legacy version"
    end
  end
  on_monterey do
    version "1.94.4"
    sha256 arm:   "235082e306ed250026f8afb5f9240dfa3ebf2238cac33d15b18bf673c0a9e896",
           intel: "cad71d7846c313b9b71ee3d33c547b3931fa0657109441c0c76e6a725c2bd270"

    livecheck do
      skip "Legacy version"
    end
  end
  on_ventura :or_newer do
    version "1.96.0"
    sha256 arm:   "18df65b98bd6cd4b0ba7a2b3295f88c1cdac87144790e2d20eae9925a299eef5",
           intel: "1c63ba999be7064f51d484bc74d0c68f7770812349f973e3006e3e809d0abd8e"

    livecheck do
      url "https://releases.raycast.com/releases/latest?build=#{arch}"
      strategy :json do |json|
        json["version"]
      end
    end
  end

  url "https://releases.raycast.com/releases/#{version}/download?build=#{arch}"
  name "Raycast"
  desc "Control your tools with a few keystrokes"
  homepage "https://raycast.com/"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Raycast.app"

  uninstall quit:       "com.raycast.macos",
            login_item: "Raycast"

  zap trash: [
    "~/.config/raycast",
    "~/Library/Application Scripts/com.raycast.macos.BrowserExtension",
    "~/Library/Application Support/com.raycast.macos",
    "~/Library/Caches/com.raycast.macos",
    "~/Library/Caches/SentryCrash/Raycast",
    "~/Library/Containers/com.raycast.macos.BrowserExtension",
    "~/Library/Cookies/com.raycast.macos.binarycookies",
    "~/Library/HTTPStorages/com.raycast.macos",
    "~/Library/Preferences/com.raycast.macos.plist",
    "~/Library/WebKit/com.raycast.macos",
  ]
end
