class WebpConverter < Formula
  desc "Fast CLI tool to convert images to WebP — Rust rewrite"
  homepage "https://github.com/reneboygarcia/webp-converter"
  url "https://github.com/reneboygarcia/webp-converter/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "f3e4537c90e6a2866d8efa7b0f1c4139ae6b634b48d96d5b82f18c10ef835db7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Run the interactive CLI:
        webp-convert

      Or batch convert non-interactively:
        webp-convert --input /path/to/images --output ~/Downloads
    EOS
  end

  test do
    assert_match "Convert images to WebP format", shell_output("#{bin}/webp-convert --help")
  end
end
