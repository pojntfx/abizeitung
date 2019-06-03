import scribus
import sys

pdf = scribus.PDFfile()
pdf.file = sys.argv[1] + ".pdf"

pdf.save()
