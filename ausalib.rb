class Ausalib < Formula

  version_number = "16.3"
  desc "AarhusSubatom analysis library"
  homepage "https://git.kern.phys.au.dk/ausa/ausalib"
  url "https://git.kern.phys.au.dk/ausa/ausalib/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "eb0238d1c4ce3e76a3cd032d80520a08b33af85eb50c5cd25d3679a886167325"
  head "https://git.kern.phys.au.dk/ausa/ausalib.git"

  option 'with-root-6', 'Install with ROOT 6'

  depends_on 'root'  if !build.with?('root-6')
  depends_on 'root6' if  build.with?('root-6')

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
