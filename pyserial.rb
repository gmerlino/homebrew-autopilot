class Pyserial < Formula
  include Language::Python::Virtualenv

  desc "Python serial port access library"
  homepage "https://github.com/pyserial/pyserial"
  url "https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz"
  sha256 "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
  head "https://github.com/pyserial/pyserial.git"

  depends_on "python@3.12" => [:build, :test]

  def pythons
    deps.select { |dep| dep.name.start_with?("python") }
        .map(&:to_formula)
        .sort_by(&:version)
  end

  def install
    pythons.each do |python|
      python_exe = python.opt_libexec/"bin/python"
#      system python_exe, *Language::Python.setup_install_args(prefix, python_exe)
      system python_exe, "-m", "pip", "install", "--prefix=#{libexec}", "--no-deps", "."
      site_packages = Language::Python.site_packages(python_exe)
      pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
      (prefix/site_packages/"homebrew-#{name}.pth").write pth_contents
    end
  end

  test do
  end
end
