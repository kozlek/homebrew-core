class Lsd < Formula
  desc "Clone of ls with colorful output, file type icons, and more"
  homepage "https://github.com/Peltoche/lsd"
  url "https://github.com/Peltoche/lsd/archive/0.15.1.tar.gz"
  sha256 "849ad168171737ef1ca74b762b3d9fb885c936cb9a753eca07426886478ad2de"

  bottle do
    cellar :any_skip_relocation
    sha256 "7f408c1b76d7d93711d1db808045d0d4ed6b66060d282ffe2b852915869c8838" => :mojave
    sha256 "5293a84429d3ee507d5b871fdd313b0ebd0473d2fbb7a88ac18e639c5fc1d7e9" => :high_sierra
    sha256 "cb88c76b6424929985dd399ae50440afa0c4779c432e62b125ed1e44f02a1561" => :sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output("#{bin}/lsd -l #{prefix}")
    assert_match "README.md", output
  end
end
