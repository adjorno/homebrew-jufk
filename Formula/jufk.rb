# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version ".1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v.1.4.0/jufk-macos-arm64"
      sha256 "75bf01381e4c00a8246a19b46a1531d270bcabfbbd4d62887ebbbfe7285b87b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v.1.4.0/jufk-macos-x64"
      sha256 "c94564d247fef8445782ddbc30c70f08b7da97c3f20b3851c384bad8e9c1ea7f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v.1.4.0/jufk-linux-x64"
      sha256 "d475e426a2453f88747ed404565387d0f06c83c583ae7f1d9f5869087bf7d4bb"
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
