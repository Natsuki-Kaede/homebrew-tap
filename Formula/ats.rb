# Homebrew formula for the tap. scripts/formula.sh fills in the version
# and the checksums of the release archives.
class Ats < Formula
  desc "Queues resource-heavy commands from AI agents and starts them by available memory"
  homepage "https://github.com/Natsuki-Kaede/agent-task-scheduler"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.1/ats-aarch64-apple-darwin.tar.gz"
      sha256 "4d1634748e72f973957d86f27670d6c5999e45b05c358c6efe90e14823ee828a"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.1/ats-x86_64-apple-darwin.tar.gz"
      sha256 "a3c3503236c2854b2093b1234f8346afcfbd41a96923aa92f4b770ec81d30399"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.1/ats-aarch64-unknown-linux-musl.tar.gz"
      sha256 "377951402b996d1290dddabd793bcb894d6aab82b6567a8aa4cd4dca06dcfb94"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.1/ats-x86_64-unknown-linux-musl.tar.gz"
      sha256 "492012a7804bab81b2810dd714ccc86cac61b55f6955e6a9db182345b791ef2a"
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
