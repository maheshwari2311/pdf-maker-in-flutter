// ignore: file_names
import 'package:flutter/material.dart';

import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';

class ViewPDF extends StatelessWidget {
  final PDFDocument doc;
  const ViewPDF({
    super.key,
    required this.doc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EXAMPLE',
        ),
      ),
      body: Center(
        child: PDFViewer(document: doc),
      ),
    );
  }
}
