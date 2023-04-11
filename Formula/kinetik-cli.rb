class KinetikCli < Formula
  desc "Brew Formula for Kinetik Command-line Interface (CLI)"
  homepage "https://github.com/aredgwell/homebrew-kinetik-cli"
  version "0.13.3"
  license "Apache-2.0"
  head "https://github.com/aredgwell/homebrew-kinetik-cli", branch: "main"
  if Hardware::CPU.arm?
    url "https://github.com/aredgwell/kinetik-base/releases/download/v#{version}/kinetik-main-aarch64-apple-darwin"
    sha256 "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
  else
    url "https://github.com/aredgwell/kinetik-base/releases/download/v#{version}/kinetik-main-x86_64-apple-darwin"
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
  end
  bottle do
    root_url "https://ghcr.io/v2/aredgwell/kinetik-cli"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "#{version}/bin/kinetik-main-aarch64-apple-darwin" => "kinetik"
    else
      bin.install "#{version}/bin/kinetik-main-x86_64-apple-darwin" => "kinetik"
    end
    chmod 0755, "#{bin}/kinetik"
    system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end
