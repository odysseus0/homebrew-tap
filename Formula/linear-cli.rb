class LinearCli < Formula
  desc "Agent-native Linear CLI — orchestrator-first defaults, token-efficient output"
  homepage "https://github.com/odysseus0/linear-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-darwin-arm64"
      sha256 "176b3049a08db37066a6822730e1f22ad1c543562e27f5bba01142136b1bbba2"
    else
      url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-darwin-x64"
      sha256 "7105d26a714105553eb22c9136ddfe3a7f7ab3ad17c38f854dd930b63f7cb947"
    end
  end

  on_linux do
    url "https://github.com/odysseus0/linear-cli/releases/download/v#{version}/linctl-linux-x64"
    sha256 "da6cea3c75ca8ba0afb5998c676f9697eaed8a7bb737884048d5c8e64809863f"
  end

  def install
    binary = Dir["linctl-*"].first
    bin.install binary => "linctl"
  end

  test do
    assert_match "linear-cli", shell_output("#{bin}/linctl --version")
  end
end
