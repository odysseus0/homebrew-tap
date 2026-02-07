class Sf < Formula
  desc "Index-powered file search for macOS (Spotlight-backed)"
  homepage "https://github.com/odysseus0/sf"
  url "https://github.com/odysseus0/sf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2491b061ff1a81c41bec780e736ecf296d52cbd725783378a5a0c3bd438a3679"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "sf", shell_output("#{bin}/sf --help")
  end
end
