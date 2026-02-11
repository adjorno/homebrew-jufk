# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GitHub Actions on each release
class Jufk < Formula
  desc "Just Use Fucking Kotlin - One language. One codebase. Every platform."
  homepage "https://justusefuckingkotlin.com"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.3.0/jufk-macos-arm64"
      sha256 "67c4949979c90ccfd9dd12704c00e0cca5a1a0951cea08b8ffdc5b2c556a3bb4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.3.0/jufk-macos-x64"
      sha256 "7fca5cdb6a1a4ef22868ea957becceb53c760d47131ba20cab639c509ee63947"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjorno/just-use-fucking-kotlin/releases/download/v1.3.0/jufk-linux-x64"
      sha256 "e73dec187e88c1dd8121a78d134d8ec6c7fd2544ebdb695fbe88ff6a9a0c526d"
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
