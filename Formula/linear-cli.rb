class LinearCli < Formula
  desc "Agent-native Linear CLI — orchestrator-first defaults, token-efficient output"
  homepage "https://github.com/odysseus0/linear-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-darwin-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-linux-x64"
    sha256 "PLACEHOLDER"
  end

  def install
    binary = Dir["linctl-*"].first
    bin.install binary => "linctl"
  end

  test do
    assert_match "linear-cli", shell_output("#{bin}/linctl --version")
  end
end
