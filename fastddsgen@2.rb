class FastddsgenAT2 < Formula
  desc "Fast-DDS IDL code generator tool "
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v3.2.0"
  sha256 "766590ff6468c41accdffb28ef6858b315376e7a795a6c6a791c9cb87bf6bfd7"
  license "Apache-2.0"

#  depends_on "gradle" => :build
  depends_on "gradle@7" => :build
  depends_on "fastdds"
#  depends_on "openjdk@11"
  depends_on "openjdk@17"

  def install
    system "./gradlew", "assemble"
    system "./gradlew", "install", "--install_path=#{prefix}"
  end

end
