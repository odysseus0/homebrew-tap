class Sf < Formula
  desc "Index-powered file search for macOS (Spotlight-backed)"
  homepage "https://github.com/odysseus0/sf"
  url "https://github.com/odysseus0/sf/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "810ad411749d83d1cd091d4a5681f8a4c2a39c971944eeac26d56f8065cd4728"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "sf", shell_output("#{bin}/sf --help")
  end
end
