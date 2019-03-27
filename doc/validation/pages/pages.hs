#!/usr/bin/env runhaskell
-- Count pages in a PDF document with Haskell.

-- http://hackage.haskell.org/package/pdf-toolbox-document-0.0.7.1/docs/Pdf-Toolbox-Document.html

import System.IO
-- import Pdf.Document
import Text.PDF.Info
-- http://hackage.haskell.org/package/pdfinfo-1.5.4/docs/Text-PDF-Info.html

main =
  withBinaryFile "input.pdf" ReadMode $ \handle -> do
    pdf <- pdfWithHandle handle
    doc <- document pdf
    catalog <- documentCatalog doc
    rootNode <- catalogPageNode catalog
    count <- pageNodeNKids rootNode
    print count
    -- the first page of the document
    page <- pageNodePageByNum rootNode 0

