class SshImportId < Formula
  include Language::Python::Virtualenv

  desc "Authorize SSH public keys from trusted online identities"
  homepage "https://github.com/dustinkirkland/ssh-import-id"
  url "https://files.pythonhosted.org/packages/21/dc/9b279d9b8e8afaa8978aa92cec923a09a59eab4417ac721a6295ae4e9a72/ssh_import_id-5.13.tar.gz"
  sha256 "d44bfb6d313abc865643d8b3aa9e6999c1a430a93eebe97f30a41773af15d2d1"
  license "GPL-3.0-or-later"

  depends_on "python@3.11"

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  def install
    virtualenv_create(libexec, "python3.11")
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/ssh-import-id --help 2>&1")
  end
end
