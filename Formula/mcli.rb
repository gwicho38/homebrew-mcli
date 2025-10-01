class Mcli < Formula
  include Language::Python::Virtualenv

  desc "High-performance CLI framework with Rust extensions, AI chat, and stunning visuals"
  homepage "https://github.com/gwicho38/mcli"
  url "https://files.pythonhosted.org/packages/b0/66/75c66919b1808e16f61639b1acff11d0ecf357c15a4528426fb80f30ac92/mcli_framework-7.0.4.tar.gz"
  sha256 "d9b64c0375398236ba45cf4f5c4ed2cf66d47791004bcd98dbfa3d9154bdb417"
  license "MIT"
  version "7.0.4"

  depends_on "python@3.11"

  def install
    # Create virtualenv
    venv = virtualenv_create(libexec, "python3.11")

    # Install mcli-framework and all dependencies from PyPI
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath

    # Link executables
    bin.install_symlink Dir["#{libexec}/bin/mcli*"]
  end

  test do
    system "#{bin}/mcli", "model", "--help"
    assert_match "Model management commands", shell_output("#{bin}/mcli model --help")
  end
end
