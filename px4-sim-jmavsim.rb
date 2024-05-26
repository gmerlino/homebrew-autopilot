# This depends on Java 11 or 14 installed using e.g. AdoptOpenJDK
# brew tap adoptopenjdk/openjdk
# brew cask install adoptopenjdk14
# Alternatively, Java can be installed from Oracle.

class Px4SimJmavsim < Formula
  include Language::Python::Virtualenv

  desc "PX4 jMAVSim simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.14.3"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "ant"
  depends_on "gmerlino/autopilot/px4-dev"
  depends_on "gmerlino/autopilot/pyserial"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    mkdir_p "#{bin}/"
    inreplace "px4.py", /\/usr\/bin\/env python/, "/opt/homebrew/Cellar/px4-sim-jmavsim/1.14.0/libexec/bin/python3.12"
    cp "px4.py", "#{bin}/px4-sim-jmavsim.py"
    ohai "PX4 jMAVSim simulation installed"
  end
end
