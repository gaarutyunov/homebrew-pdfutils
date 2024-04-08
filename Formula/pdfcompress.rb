class Pdfcompress < Formula
  desc "Useful PDF commands, such as compression, etc."
  homepage "https://github.com/gaarutyunov/homebrew-pdfutils"
  url "https://github.com/gaarutyunov/homebrew-pdfutils.git",
      tag: "1.0.0"
  head "https://github.com/gaarutyunov/homebrew-pdfutils.git",
       branch: "main"

  bottle do
    root_url "https://github.com/gaarutyunov/homebrew-pdfutils/releases/download/pdfcompress-1.0.0"
    sha256 cellar: :any_skip_relocation, ventura:      "05637485cebf1f444bde855ac97747100c8e8ce50405f29a588b0894b800404d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7cdc8dbad2794df9bbf74f095b1d2de9fec9974ad6153c77d1acb7452207c64b"
  end
  depends_on "ghostscript"
  def install
    bin.install "pdfcompress.sh"
  end
end
