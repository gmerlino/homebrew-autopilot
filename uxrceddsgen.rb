class Uxrceddsgen < Formula
  desc "MicroXRCE-DDS IDL code generator tool "
  homepage "https://micro-xrce-dds.docs.eprosima.com"
  url "https://github.com/eProsima/Micro-XRCE-DDS-Gen.git", tag: "v2.0.2"
  sha256 "e3546a3aed5473566c3f9d3bd77db13d5382bd9283b389c7620932ceaa184bb1"
  license "Apache-2.0"

  depends_on "gradle@7" => :build
  depends_on "gmerlino/autopilot/uxrcedds"
  depends_on "openjdk@17"

  def install
    system "./gradlew", "assemble"
    system "./gradlew", "install", "--install_path=#{prefix}"
  end

end
