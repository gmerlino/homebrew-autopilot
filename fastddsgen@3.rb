class FastddsgenAT3 < Formula
  desc "Fast-DDS IDL code generator tool "
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v3.3.0"
  sha256 "823f8214e56c81f490569c91bf3f5742a74fc0af5605b54f32c4d7a220117d3f"
  license "Apache-2.0"

  depends_on "gradle@7" => :build
  depends_on "gmerlino/autopilot/fastdds"
  depends_on "openjdk@17"

  def install
    system "./gradlew", "assemble"
    system "./gradlew", "install", "--install_path=#{prefix}"
  end

end
