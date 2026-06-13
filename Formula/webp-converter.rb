class WebpConverter < Formula
  desc "A CLI tool to convert images to WebP format — fast Rust rewrite"
  homepage "https://github.com/reneboygarcia/webp-converter"
  url "https://github.com/reneboygarcia/webp-converter/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "11af58de3e24c7c1f0b76a61eea3d1be8911ec800de9c3b678bb05d1c2d72ddb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      To run the interactive CLI, execute:
        webp-convert

      To convert images in batch mode:
        webp-convert --input <path> --output <dir> --quality 80

      To view all options:
        webp-convert --help
    EOS
  end

  test do
    assert_match "Convert images to WebP format", shell_output("#{bin}/webp-convert --help")
  end
end
