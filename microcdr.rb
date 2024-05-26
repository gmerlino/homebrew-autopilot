class Microcdr < Formula
  desc "CDR serialization implementation for embedded systems"
  homepage "https://github.com/eProsima/Micro-CDR"
  url "https://github.com/eProsima/Micro-CDR.git", tag: "v2.0.1"
  sha256 "bcc16517acc55a58fad6d39cfa42ba3658e2c7d0f408af5b1a27b634072d64b6"

  depends_on "cmake" => :build

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"
    cmake_args << "-DUCDR_ISOLATED_INSTALL=ON"

    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "..", *cmake_args
      system "make"
      system "make", "install"
    end
  end
end
