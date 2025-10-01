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
    # Create virtualenv in libexec
    venv = virtualenv_create(libexec, "python3.11")

    # Install package with all dependencies from PyPI
    system libexec/"bin/pip", "install", "--upgrade", "pip", "wheel"
    system libexec/"bin/pip", "install", "mcli-framework==7.0.4"

    # Create wrapper scripts
    (bin/"mcli").write_env_script(libexec/"bin/mcli", PATH: "#{libexec}/bin:$PATH")
    (bin/"mcli-backtest").write_env_script(libexec/"bin/mcli-backtest", PATH: "#{libexec}/bin:$PATH")
    (bin/"mcli-dashboard").write_env_script(libexec/"bin/mcli-dashboard", PATH: "#{libexec}/bin:$PATH")
    (bin/"mcli-optimize").write_env_script(libexec/"bin/mcli-optimize", PATH: "#{libexec}/bin:$PATH")
    (bin/"mcli-serve").write_env_script(libexec/"bin/mcli-serve", PATH: "#{libexec}/bin:$PATH")
    (bin/"mcli-train").write_env_script(libexec/"bin/mcli-train", PATH: "#{libexec}/bin:$PATH")
  end

  test do
    system bin/"mcli", "model", "--help"
    assert_match "Model management commands", shell_output("#{bin}/mcli model --help")
  end
end
