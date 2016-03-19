class Calibrator < Formula

  version_number = "16.3"
  desc "Calibrating program for silicon detectors"
  homepage "https://git.kern.phys.au.dk/ausa/Calibrator"
  url "https://git.kern.phys.au.dk/ausa/Calibrator/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "fdbb250e26b8ff8f0c59915a2ce9fed1b18fdec11a489d807bbbf8b70a289338"
  head "https://git.kern.phys.au.dk/ausa/Calibrator.git"

  option 'with-root-6', 'Install with ROOT 6'

  depends_on 'root'  if !build.with?('root-6')
  depends_on 'root6' if  build.with?('root-6')
  depends_on "cmake" => :build
  depends_on "ausalib" => :build
  needs :cxx11 

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "true"
  end
end