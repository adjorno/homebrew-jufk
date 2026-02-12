# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.0/jufk-macos-arm64"
      sha256 "4cdee42f97c8b088e4a564b991d08651ad7e4fd26cdf694da5863214cafdfff7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.0/jufk-macos-x64"
      sha256 "08f054ea0e85bd6804093941249c1e06d8d1909a4c8ede12c6b35d07fde58a3f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.0/jufk-linux-x64"
      sha256 "71693e977444d8c0e8045d001fe02ec259ea1879cdf4ec94a50ca415de679d68"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "jufk-macos-arm64" => "jufk"
      else
        bin.install "jufk-macos-x64" => "jufk"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "jufk-linux-x64" => "jufk"
      end
    end
  end

  test do
    system "#{bin}/jufk"
  end
end
