class UxrceddsClient < Formula
  desc "MicroXRCE-DDS implementation"
  homepage "https://micro-xrce-dds.docs.eprosima.com"
  url "https://github.com/eProsima/Micro-XRCE-DDS-Client.git", tag: "v3.0.0"
  sha256 "43d273ec17937b988fc28ad926909f100332fd2cf59d6048d7eed1d793944967"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "gmerlino/autopilot/microcdr"

  depends_on :linux

  conflicts_with "gmerlino/autopilot/uxrcedds", because: "both install uXRCE-Client"

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"
    cmake_args << "-DUXRCE_BUILD_EXAMPLES=ON"
#    cmake_args << "-DUXRCE_ENABLE_GEN=ON"

    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "..", *cmake_args
      system "make"
      system "make", "install"
    end
  end
end
