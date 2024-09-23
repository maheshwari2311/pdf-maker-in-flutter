// ignore_for_file: use_build_context_synchronously

import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ViewPDF.dart';
import 'package:flutter_application_1/constrants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  late PDFDocument doc;

  loadFromAsset() async {
    setState(() {
      isLoading = true;
    });

    doc = await PDFDocument.fromAsset('assets/hello1.pdf');
    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewPDF(doc: doc),
      ),
    );
  }

  loadFromUrl() async {
    setState(() {
      isLoading = true;
    });
    doc = await PDFDocument.fromURL(Constrants.pdfURL);
    setState(() {
      isLoading = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ViewPDF(doc: doc),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View pdf file",
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      loadFromAsset();
                    },
                    child: const Text(
                      "Load local PDF",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loadFromUrl();
                    },
                    child: const Text(
                      "Load pdf via URl",
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
