class UxrceddsAgent < Formula
  desc "MicroXRCE-DDS implementation"
  homepage "https://micro-xrce-dds.docs.eprosima.com"
  url "https://github.com/eProsima/Micro-XRCE-DDS-Agent.git", tag: "v2.4.3"
  sha256 "8f4074641c45ae2642877c7f55260d00f390e5329b138e55fd45f4e3c988ff5d"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "gmerlino/autopilot/microcdr"

  conflicts_with "gmerlino/autopilot/uxrcedds", because: "both install uXRCE-Agent"

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
