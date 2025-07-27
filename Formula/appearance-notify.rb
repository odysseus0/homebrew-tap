class AppearanceNotify < Formula
  desc "macOS daemon that executes hooks on system appearance changes"
  homepage "https://github.com/odysseus0/appearance-notify"
  version "0.1.0"
  license "MIT"
  
  depends_on macos: :sonoma
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/odysseus0/appearance-notify/releases/download/v0.1.0/appearance-notify-aarch64-apple-darwin.tar.gz"
      sha256 "333903fe13acf41e277867b7830ee6091d4cda31a9fb0055d42aa051d6d32118"
    else
      url "https://github.com/odysseus0/appearance-notify/releases/download/v0.1.0/appearance-notify-x86_64-apple-darwin.tar.gz"
      sha256 "63d35f21f5327e06c4e8ac423437913f1fc883dcabbcc6e01d7827f7923f07fd"
    end
  end
  
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
    run opt_bin/"appearance-notify"
    keep_alive true
  end
  
  test do
    assert_match "appearance-notify", shell_output("#{bin}/appearance-notify --version 2>&1", 1)
  end
end