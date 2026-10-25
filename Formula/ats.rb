# Homebrew formula for the tap. scripts/formula.sh fills in the version
# and the checksums of the release archives.
class Ats < Formula
  desc "Queues resource-heavy commands from AI agents and starts them by available memory"
  homepage "https://github.com/Natsuki-Kaede/agent-task-scheduler"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.0/ats-aarch64-apple-darwin.tar.gz"
      sha256 "840a9175f1ec24c3c95c41e131f537d5ce0ee5b829189493af6abc9502fad6c7"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.0/ats-x86_64-apple-darwin.tar.gz"
      sha256 "d03c48d709e116d6d6bd3a322e1c39dbbe988d89b576b1bb890df237e9ab96e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.0/ats-aarch64-unknown-linux-musl.tar.gz"
      sha256 "05cf63f01ef8da85cd62e3759c83216b108f6893cedce65ba35e5519dffbf1ee"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.0/ats-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47b62fab4a22d02c3dfa8efe55d9f36c8605c012ad6eb44bc1c7cf91994ee06a"
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
