class PdfCompressFormula < Formula
  def install
    bin.install "pdfcompress.sh"
  end
  
  depends_on "ghostscript"
end
