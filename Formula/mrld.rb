class Mrld < Formula
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.0/mrld-aarch64-apple-darwin.tar.xz"
      sha256 "7956e2651f74aca9087f0a52fcf7f99c78634c84d24939457d38cc937bfecd4e"
    end
    on_intel do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.0/mrld-x86_64-apple-darwin.tar.xz"
      sha256 "a1ec199025c35c03ec6b1389411619177d9e5dda87038a2430fbd8042df87e58"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.0/mrld-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d6083bc4633df5fc2cc7beef6977c012bfe1752cd9593a4fb9c2de15381b1cd2"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "mrld"
      end
    end
    on_macos do
      on_intel do
        bin.install "mrld"
      end
    end
    on_linux do
      on_intel do
        bin.install "mrld"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
