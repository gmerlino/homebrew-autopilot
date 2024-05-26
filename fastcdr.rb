class Fastcdr < Formula
  desc "CDR serialization implementation for DDS"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "5b5c1fc138a0d3092010158be0306c587da56bf406b0bfd45c20835e53839caf"

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
