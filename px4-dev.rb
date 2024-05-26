class Px4Dev < Formula
  include Language::Python::Virtualenv

  desc "PX4 development toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.14.3"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "ant"
  depends_on "astyle"
  depends_on "bash-completion"
  depends_on "ccache"
  depends_on "cmake"
  depends_on "flock"
  depends_on "gmerlino/autopilot/uxrcedds"
  depends_on "gcc-arm-none-eabi"
  depends_on "genromfs"
  depends_on "gmerlino/autopilot/kconfig-frontends"
  depends_on "ninja"
  depends_on "gmerlino/autopilot/pyserial"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    mkdir_p "#{bin}/"
    inreplace "px4.py", /\/usr\/bin\/env python/, "/opt/homebrew/Cellar/px4-dev/1.14.0/libexec/bin/python3.12"
    cp "px4.py", "#{bin}/"
    ohai "PX4 Toolchain Installed"
  end
end
