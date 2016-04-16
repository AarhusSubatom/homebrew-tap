class Ausalib < Formula

  version_number = "16.4.1"
  desc "AarhusSubatom analysis library"
  homepage "https://git.kern.phys.au.dk/ausa/ausalib"
  url "https://git.kern.phys.au.dk/ausa/ausalib/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "8ed8d40f1b06e0552f8459963199c3635566a0d89950945b0c0655fd72e197bb"
  head "https://git.kern.phys.au.dk/ausa/ausalib.git"

  option 'with-root-6', 'Install with ROOT 6'

  depends_on 'root'  if !build.with?('root-6')
  depends_on 'root6' if  build.with?('root-6')
  depends_on "gsl" => :recommended
  depends_on "cmake" => :build
  needs :cxx11 

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
