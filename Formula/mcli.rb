class Mcli < Formula
  include Language::Python::Virtualenv

  desc "High-performance CLI framework with Rust extensions, AI chat, and stunning visuals"
  homepage "https://github.com/gwicho38/mcli"
  url "https://files.pythonhosted.org/packages/52/e6/84beaadc26bd3995523edb0f4bf8da4393899ea1208b86a42d40c448a394/mcli_framework-7.0.4-py3-none-any.whl"
  sha256 "9cacea6f06506d91f7e8632e3746c1790f3d0c8e9e1e8c145c36b65669c491af"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/mcli", "--help"
  end
end
