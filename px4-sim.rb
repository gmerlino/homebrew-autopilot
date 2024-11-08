# This formula is presented for compatibility with older instructions.
# Going forward Gazebo and/or jMAVSim can also be installed individually using
# px4-sim-gazebo and px4-sim-jmavsim.

class Px4Sim < Formula
  include Language::Python::Virtualenv

  desc "PX4 simulation toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.15"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "gmerlino/autopilot/px4-sim-gazebo"
#  depends_on "gmerlino/autopilot/px4-sim-jmavsim"
  depends_on "gmerlino/autopilot/pyserial"
  depends_on "python@3.13" => [:build, :test]

  def install
    venv = virtualenv_create(libexec, "python3.13")
    mkdir_p "#{bin}/"
    inreplace "px4.py", /\/usr\/bin\/env python/, "/opt/homebrew/Cellar/px4-sim/1.14.0/libexec/bin/python3.13"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 Simulation Installed"
  end
end
