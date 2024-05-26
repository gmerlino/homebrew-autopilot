class FastcdrAT2 < Formula
  desc "(X)CDR serialization implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR.git", tag: "v2.2.1"
  sha256 "11079a534cda791a8fc28d93ecb518bbd3804c0d4e9ca340ab24dcc21ad69a04"

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
