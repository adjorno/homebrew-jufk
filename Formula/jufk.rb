# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.1/jufk-macos-arm64"
      sha256 "8e168479297d92e4bb7206bc567c7b9510b500387df0a42e9bb65a3a59847e9b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.1/jufk-macos-x64"
      sha256 "1ed3d465ac4d83b736bea11c2125765b940785613edb1bb6c674d413f1bcf4e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.4.1/jufk-linux-x64"
      sha256 "2003b188c414e70dac614fada0147cd1a35dc699e6d68d4d121ee8da85d76a92"
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
