import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewBook extends StatelessWidget {
  ViewBook({Key? key}) : super(key: key);
  String args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfPdfViewer.network(
          args.toString(),
          canShowScrollHead: true,
          canShowPaginationDialog: true,
          enableTextSelection: true,
          scrollDirection: PdfScrollDirection.horizontal,
          enableDoubleTapZooming: true,
          pageLayoutMode: PdfPageLayoutMode.continuous,
        ),
      ),
    );
  }
}
