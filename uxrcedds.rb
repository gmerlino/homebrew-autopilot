class Uxrcedds < Formula
  desc "MicroXRCE-DDS implementation"
  homepage "https://micro-xrce-dds.docs.eprosima.com"
  url "https://github.com/eProsima/Micro-XRCE-DDS.git", tag: "v3.0.0"
  sha256 "b0a064cad95566b5fe6ac0ed6d937ff8864941f2c6555096792155cb5781c9a4"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "gmerlino/autopilot/microcdr"

  depends_on :linux

  conflicts_with "gmerlino/autopilot/uxrcedds-client", because: "both install uXRCE-Client"
  conflicts_with "gmerlino/autopilot/uxrcedds-agent", because: "both install uXRCE-Agent"

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
