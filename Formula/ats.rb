# Homebrew formula for the tap. scripts/formula.sh fills in the version
# and the checksums of the release archives.
class Ats < Formula
  desc "Queues resource-heavy commands from AI agents and starts them by available memory"
  homepage "https://github.com/Natsuki-Kaede/AgentTaskScheduler"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.3/ats-aarch64-apple-darwin.tar.gz"
      sha256 "4e22e156d682be719a4c32f785103b386db4ed974012940312749f9c1c2b46e0"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.3/ats-x86_64-apple-darwin.tar.gz"
      sha256 "422ed58f2553bdc97cca409a7f660630b5050ca4f3b9edebce4fd49d792d56fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.3/ats-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7214f2f6fc9e8ec9a05cea0f1b4477cf8940464c253a7fc61c9ec1d51a17d136"
    end
    on_intel do
      url "https://github.com/Natsuki-Kaede/AgentTaskScheduler/releases/download/v0.1.3/ats-x86_64-unknown-linux-musl.tar.gz"
      sha256 "25e399518c58c72363c6a65fdcd6b8550e4cbf14816c6f0d2b506ea4c9732356"
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
