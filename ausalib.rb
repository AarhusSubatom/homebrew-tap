class Ausalib < Formula

  version_number = "16.6"
  desc "AarhusSubatom analysis library"
  homepage "https://git.kern.phys.au.dk/ausa/ausalib"
  url "https://git.kern.phys.au.dk/ausa/ausalib/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "7e47b9fdfd377a587bfbc3aea36da5e431a59a76860935c6abf885a4bf38c0ea"
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
