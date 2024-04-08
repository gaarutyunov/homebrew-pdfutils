class PdfCompressFormula < Formula
  depends_on "ghostscript"
  
  def install
    bin.install "pdfcompress.sh"
  end
end
