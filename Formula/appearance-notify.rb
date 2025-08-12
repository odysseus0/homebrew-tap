class AppearanceNotify < Formula
  desc "macOS daemon that executes hooks on system appearance changes"
  homepage "https://github.com/odysseus0/appearance-notify"
  version "0.2.1"
  license "MIT"

  url "https://github.com/odysseus0/appearance-notify/releases/download/v0.2.1/appearance-notify-apple-darwin.tar.gz"
  sha256 "07bd507c669db2e3eb3772d15a4ca7fc0f979c0de7dbc59a6c829e65964cd1c4" # universal

  depends_on macos: :sonoma

  def install
    bin.install "appearance-notify"

    (prefix/"io.github.odysseus0.appearance-notify.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>io.github.odysseus0.appearance-notify</string>
          <key>ProgramArguments</key>
          <array>
              <string>#{opt_bin}/appearance-notify</string>
              <string>daemon</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
      </dict>
      </plist>
    EOS
  end

  service do
    run [opt_bin/"appearance-notify", "daemon"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appearance-notify --version")
  end
end
