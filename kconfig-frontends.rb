class KconfigFrontends < Formula
  desc "Kernel configuration frontends and parser"
  homepage "https://github.com/movidius/kconfig-frontends"
  url "https://github.com/movidius/kconfig-frontends/archive/refs/tags/kconfig-frontends-3.12.0.0.tar.gz"
  sha256 "8f9213520301a70400ae1aac6e3b469f20b5076652faf05ff249167d56840ad6"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "xz" => :build

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--disable-nconf",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/kconfig-conf"
  end
end
