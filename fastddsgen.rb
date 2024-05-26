class Fastddsgen < Formula
  desc "Fast-DDS IDL code generator tool "
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
#  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v2.0.2"
  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v2.5.1"
#  sha256 "a75399160aab20490a64a4e936230f446441a2717c756e478bbd83822fcb97a2"
  sha256 "8da8b679644068e7d8fa38e1ccf28b8ca59c920247ef3c9dfa8f2f9627d496c6"
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
