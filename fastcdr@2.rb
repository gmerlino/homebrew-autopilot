class FastcdrAT2 < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "9c19d60d00f7ec1a293c52dd387f8286a396aa89440238a4a3befce14fd1c529"

  depends_on "cmake" => :build

  def install
    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
      system "make"
      system "make", "install"
    end
  end
end
