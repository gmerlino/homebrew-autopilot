class Fastddsgen < Formula
  desc "Fast-DDS IDL code generator tool "
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v2.5.2"
  sha256 "6069ce6b67fac81f36f7eea3a821abcf1915fce8fa7de50e220e617a93bf9ca0"
  license "Apache-2.0"

  depends_on "gradle@7" => :build
  depends_on "gmerlino/autopilot/fastdds"
  depends_on "openjdk@17"

  def install
    system "./gradlew", "assemble"
    system "./gradlew", "install", "--install_path=#{prefix}"
  end

end
