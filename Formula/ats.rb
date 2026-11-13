# Homebrew formula template for release archives.

class Ats < Formula
  desc "Queues resource-heavy commands from AI agents and starts them by available memory"
  homepage "https://github.com/Natsuki-Kaede/AgentTaskScheduler"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.5/ats-aarch64-apple-darwin.tar.gz"
      sha256 "766e822020d98a6907552fa5da747afd5c6ea144357e6035be478419018b1d9b"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.5/ats-x86_64-apple-darwin.tar.gz"
      sha256 "7e46dd55cef85b578114d139455c3b198789aec83b341b29a6c8df030282b146"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.5/ats-aarch64-unknown-linux-musl.tar.gz"
      sha256 "07c985326a140035e4f2056ac44fdb6de8e0850d499e816ea8b2446a7a8ef0fe"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.5/ats-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da5cdb55eef1df69699f8bfcf7d78b3bad424e70c611404114db2ac3383472b8"
    end
  end

  def install
    bin.install "ats"
  end

  def caveats
    <<~EOS
      Run `ats install` to add the agent hooks and start the daemon at login.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ats --version")
  end
end
