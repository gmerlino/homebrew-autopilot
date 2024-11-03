class XRequirement < Requirement
  fatal true

  satisfy(build_env: false) { which("xquartz") }

  def message
    <<~EOS
      XQuartz is required; install it via:
        brew install --cask xquartz
    EOS
  end
end

class Px4SimGazebo < Formula
  include Language::Python::Virtualenv

  desc "PX4 Gazebo simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.15"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "exiftool"
  depends_on "glog"
  depends_on "graphviz"
  depends_on "gstreamer"
  depends_on "opencv"
  depends_on "osrf/simulation/gazebo11"
  depends_on "protobuf"
  depends_on "gmerlino/autopilot/px4-dev"
  depends_on "gmerlino/autopilot/pyserial"
  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3")
    mkdir_p "#{bin}/"
#    inreplace "px4.py", /\/usr\/bin\/env python/, "/opt/homebrew/Cellar/px4-sim-gazebo/1.14.0/libexec/bin/python3.13"
    inreplace "px4.py", /python/, "python3.13"
    cp "px4.py", "#{bin}/px4-sim-gazebo.py"
    ohai "PX4 Gazebo simulation installed"
  end
end
