class FoonathanMemory < Formula
  desc "STL compatible C++ memory allocator library using a new RawAllocator concept that is similar to an Allocator but easier to use and write."
  homepage "https://memory.foonathan.net"
  url "https://github.com/foonathan/memory/archive/refs/tags/v0.7-3.tar.gz"
  sha256 "4203d15db22a94a3978eeb1afb59a37d35c57c0f148733f0f1a53a6281cb74dd"
  license "Zlib"

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
