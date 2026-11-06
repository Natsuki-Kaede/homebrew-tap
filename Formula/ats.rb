# Homebrew formula for the tap. scripts/formula.sh fills in the version
# and the checksums of the release archives.
class Ats < Formula
  desc "Queues resource-heavy commands from AI agents and starts them by available memory"
  homepage "https://github.com/Natsuki-Kaede/agent-task-scheduler"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.2/ats-aarch64-apple-darwin.tar.gz"
      sha256 "62639c67308aef5d6dc61aad6ccc2207113d6740a04c81f9285eeb032805fe1c"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.2/ats-x86_64-apple-darwin.tar.gz"
      sha256 "423892fca4dec5fc3205572bec27a88c9642fc2adfa80caa610457cb10e8085f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.2/ats-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c936476db3163f801cff9e1df8d9af44ab764c70c824efdd9e2016ebadae589"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/agent-task-scheduler/releases/download/v0.1.2/ats-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9362ee798666775628b2c9882cc6a269c434b15ef2ee9f27829997c7a4abc77f"
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
