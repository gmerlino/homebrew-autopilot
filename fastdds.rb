class Fastdds < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
#  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.4.0.tar.gz"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.11.2.tar.gz"
#  sha256 "77270b5ab8ccc3143acc88dccd3bf9c30f316a4712a420cdfad8ead18207caaf"
  sha256 "711f5d7afc6a31a908ab204f8b67045d5e7cab7b4052614b595b37c774f357fd"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "fastcdr"
  depends_on "fastddsgen"
  depends_on "foonathan-memory"


  def install
    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
      system "make"
      system "make", "install"
    end
  end
end
