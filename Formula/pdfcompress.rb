class Pdfcompress < Formula
  desc "Useful PDF commands, such as compression, etc."
  homepage "https://github.com/gaarutyunov/homebrew-pdfutils"
  depends_on "ghostscript"
  url "https://github.com/gaarutyunov/homebrew-pdfutils.git", 
      tag: "0.0.1"
  head "https://github.com/gaarutyunov/homebrew-pdfutils.git", 
       branch: "main"
  def install
    bin.install "pdfcompress.sh"
  end
end
