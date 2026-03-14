# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version "1.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.3/jufk-macos-arm64"
      sha256 "eeaa94ded06c47b30d0a5bf522b59aa62bf69cc5f3ffaafd9407536225aa45dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.3/jufk-macos-x64"
      sha256 "2c6bc8517ceb8cd5149ca17bd38379eb4fa570220a9b9b07a35319e01e3ab9e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.3/jufk-linux-x64"
      sha256 "c4ec09b08bed5a5a23dea0052d91fcf72808f909ac6f01ce0243e96af88bbb64"
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
