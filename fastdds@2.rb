class FastddsAT2 < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.13.0.tar.gz"
  sha256 "071f6c4bb937e2fd01e23d2f5c005a8989b37eb333b23aa268be926814cd9292"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "gmerlino/autopilot/fastcdr"
  depends_on "gmerlino/autopilot/fastddsgen"
  depends_on "gmerlino/autopilot/foonathan-memory"


  def install
    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
      system "make"
      system "make", "install"
    end
  end
end
