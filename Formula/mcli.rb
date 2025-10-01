class Mcli < Formula
  include Language::Python::Virtualenv

  desc "High-performance CLI framework with Rust extensions, AI chat, and stunning visuals"
  homepage "https://github.com/gwicho38/mcli"
  url "https://files.pythonhosted.org/packages/b0/66/75c66919b1808e16f61639b1acff11d0ecf357c15a4528426fb80f30ac92/mcli_framework-7.0.4.tar.gz"
  sha256 "d9b64c0375398236ba45cf4f5c4ed2cf66d47791004bcd98dbfa3d9154bdb417"
  license "MIT"
  version "7.0.4"

  depends_on "python@3.11"

  # Core dependencies
  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/01/c954e134dc440ab5f96952fe52b4fdc64225530320a910473c1fe270d9aa/rich-14.0.0.tar.gz"
    sha256 "fc8d31e26f11f6ce9c0451653c5427097d2c9fd9f5a5dc3e1b4ae6ec9c7b1bb3"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/18/c7/8c6872f7372eb6a6b2e4708b88419fb46b857f7a2e1892966b851cc79fc9/psutil-6.1.0.tar.gz"
    sha256 "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/mcli", "model", "--help"
    system "#{bin}/mcli", "model", "list"
  end
end
