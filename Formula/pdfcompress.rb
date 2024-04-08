class Pdfcompress < Formula
  desc "Useful PDF commands, such as compression, etc."
  homepage "https://github.com/gaarutyunov/homebrew-pdfutils"
  depends_on "ghostscript"
  def install
    bin.install "pdfcompress.sh"
  end
end
