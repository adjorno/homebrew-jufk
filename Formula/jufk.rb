# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version "1.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.2.4/jufk-macos-arm64"
      sha256 "14cc56128ceeeacd22fda8facd60bae5cd145e0377a2246924fc8692b7311fcc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.2.4/jufk-macos-x64"
      sha256 "5d795244bb2b1fb813dfe940cc73e8791b75ddc73d63f9d936d26bfd61dc9834"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.2.4/jufk-linux-x64"
      sha256 "d2e997c8edd53834776c8db17de806dfde1b4b5ca94a8c5c60a2395a4da469e6"
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
