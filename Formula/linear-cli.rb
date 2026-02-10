class LinearCli < Formula
  desc "Agent-native Linear CLI — orchestrator-first defaults, token-efficient output"
  homepage "https://github.com/odysseus0/linear-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-darwin-arm64"
      sha256 "680d83a06cd868cad3852eeff4aed842dbe0cee0dcb3fb031c64abf48917c722"
    else
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-darwin-x64"
      sha256 "a6603e3f94ee389d35033a2e6cee2dd5c6e26f5747a79b011c513b50703db648"
    end
  end

  on_linux do
    url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-linux-x64"
    sha256 "ac166f21baf67f6d3ef73844d5a8d3cbbe7100c684e77c16275db728ac706016"
  end

  def install
    binary = Dir["linear-*"].first
    bin.install binary => "linear"
  end

  test do
    assert_match "linear", shell_output("#{bin}/linear --version")
  end
end
