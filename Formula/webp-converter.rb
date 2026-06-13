class WebpConverter < Formula
  desc "Fast CLI tool to convert images to WebP — Rust rewrite"
  homepage "https://github.com/reneboygarcia/webp-converter"
  url "https://github.com/reneboygarcia/webp-converter/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "a86220cbd799156b33c658349abda56421fe6dff2403d3d5913cd8bbc6f5ced1"
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
