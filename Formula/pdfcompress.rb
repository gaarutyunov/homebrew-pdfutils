class Pdfcompress < Formula
  desc "Useful PDF commands, such as compression, etc."
  homepage "https://github.com/gaarutyunov/homebrew-pdfutils"
  url "https://github.com/gaarutyunov/homebrew-pdfutils.git",
      tag: "1.0.0"
  head "https://github.com/gaarutyunov/homebrew-pdfutils.git",
       branch: "main"
  depends_on "ghostscript"
  def install
    bin.install "pdfcompress.sh"
  end
end
