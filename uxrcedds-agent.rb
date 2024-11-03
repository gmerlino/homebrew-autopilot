class UxrceddsAgent < Formula
  desc "MicroXRCE-DDS implementation"
  homepage "https://micro-xrce-dds.docs.eprosima.com"
  url "https://github.com/eProsima/Micro-XRCE-DDS-Agent.git", tag: "v3.0.0"
  sha256 "08a3f5a71563b72663a51d5bd502099f892a6d73de21631750e1d31922d7c729"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "spdlog"
  depends_on "tinyxml2"
  depends_on "gmerlino/autopilot/microcdr"

  conflicts_with "gmerlino/autopilot/uxrcedds", because: "both install uXRCE-Agent"

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"
    cmake_args << "-DUXRCE_BUILD_EXAMPLES=ON"
    cmake_args << "-DUAGENT_SOCKETCAN_PROFILE=OFF"
    cmake_args << "-DUAGENT_USE_SYSTEM_LOGGER=ON"
#    cmake_args << "-DUXRCE_ENABLE_GEN=ON"

    Dir.mkdir("./build")
    cd("./build") do
      system "cmake", "..", *cmake_args
      system "make"
      system "make", "install"
    end
  end
end
