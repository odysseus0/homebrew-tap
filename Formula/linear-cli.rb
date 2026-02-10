class LinearCli < Formula
  desc "Agent-native Linear CLI — orchestrator-first defaults, token-efficient output"
  homepage "https://github.com/odysseus0/linear-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-darwin-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linear-linux-x64"
    sha256 "PLACEHOLDER"
  end

  def install
    binary = Dir["linear-*"].first
    bin.install binary => "linear"
  end

  test do
    assert_match "linear", shell_output("#{bin}/linear --version")
  end
end
