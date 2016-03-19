class GeometryFitter < Formula

  version_number = "16.3"
  desc "Calibration routines for silicon detectors"
  homepage "https://git.kern.phys.au.dk/ausa/GeometryFitter"
  url "https://git.kern.phys.au.dk/ausa/GeometryFitter/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "1daefcd2ba44727be7180118e4b49b675d5788305891caa8536d5aaca85eaa91"
  head "https://git.kern.phys.au.dk/ausa/GeometryFitter.git"

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