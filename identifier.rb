class Identifier < Formula

  version_number = "16.3"
  desc "Identifier for sorted data"
  homepage "https://git.kern.phys.au.dk/ausa/Identifier"
  url "https://git.kern.phys.au.dk/ausa/Identifier/repository/archive.tar.gz?ref=#{version_number}"
  version version_number
  sha256 "942c5b67409fc650dc099dae41c76633f3a5d11f6086b50aac486a3dba484309"
  head "https://git.kern.phys.au.dk/ausa/Identifier.git"

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
