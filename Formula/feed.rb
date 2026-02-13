class Feed < Formula
  desc "RSS CLI for AI agents. Bring your own algorithm."
  homepage "https://github.com/odysseus0/feed"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/odysseus0/feed/releases/download/v0.1.0/feed_0.1.0_darwin_arm64.tar.gz"
      sha256 "ac1ea77c2e9261c780019dd574a437b30b6c7fe9c5e521706692cf87b2c2dc27"
    end
    on_intel do
      url "https://github.com/odysseus0/feed/releases/download/v0.1.0/feed_0.1.0_darwin_amd64.tar.gz"
      sha256 "247513917d05ea7d87f4cf376b6b646f6f3504e801264848679595f7c404cf29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/odysseus0/feed/releases/download/v0.1.0/feed_0.1.0_linux_arm64.tar.gz"
      sha256 "4d1648407f5481aa43fd04e1f70ad100b504c9e0d41ef8b678843994f129dc3f"
    end
    on_intel do
      url "https://github.com/odysseus0/feed/releases/download/v0.1.0/feed_0.1.0_linux_amd64.tar.gz"
      sha256 "f4e3379e4009a9be09ef8c4af43172a933b5e5c32ab749b2b78133c678ea2d3b"
    end
  end

  def install
    bin.install "feed"
  end

  test do
    assert_match "feed", shell_output("#{bin}/feed --version")
  end
end
