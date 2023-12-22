import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scipro_application/controller/invoice_controller/invoice_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../constant/constant.validate.dart';

//Local imports

Future<void> generateInvoice(context) async {
  //Create a PDF document.
  final PdfDocument document = PdfDocument();
  //Add page to the PDF
  final PdfPage page = document.pages.add();
  //Get page client size
  final Size pageSize = page.getClientSize();
  //Draw rectangle
  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      pen: PdfPen(PdfColor(142, 170, 219)));
  //Generate PDF grid.
  final PdfGrid grid = getGrid();
  //Draw the header section by creating text element
  final PdfLayoutResult result = drawHeader(page, pageSize, grid);
  //Draw grid
  drawGrid(page, grid, result);
  //Add invoice footer
  // drawFooter(page, pageSize);
  //Save the PDF document
  final List<int> bytes = document.saveSync();
  if (Theme.of(context).platform == TargetPlatform.android ||
      Theme.of(context).platform == TargetPlatform.iOS) {
    // For Android and iOS, you can use platform-specific plugins to save files
    // Example: using path_provider for file operations
    // Save PDF using path_provider or other suitable plugins
    // For example:
    //Get external storage directory
    final directory = await getApplicationSupportDirectory();

//Get directory path
    final path = directory.path;

//Create an empty file to write PDF data
    File file = File(
        '$path/Invoice_VSCI ${Get.find<GetInvoiceController>().invoiceNumber.value}.pdf');

//Write PDF data
    await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
    OpenFile.open(
        '$path/Invoice_VSCI ${Get.find<GetInvoiceController>().invoiceNumber.value}.pdf');
    //Show a success message or launch a file explorer
  } else {
    const Center(
      child: Text('data'),
    );
    // For web, use dart:html to handle file saving
    // Example: Save file using AnchorElement and Blob
    // Make sure to import 'dart:html' at the beginning of your file
    // final blob = Blob([Uint8List.fromList(bytes)]);
    // final url = Url.createObjectUrlFromBlob(blob);
    // AnchorElement(href: url)
    //   ..target = 'webbrowser'
    //   ..download = 'Invoice.pdf'
    //   ..click();
    // Url.revokeObjectUrl(url);
  }
  //Dispose the document.
  document.dispose();

  //Save and launch the file.
}

//Draws the invoice header
PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
  //Draw rectangle
  page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(91, 126, 215)),
      bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
  //Draw string
  page.graphics.drawString('VECTORWIND-TECH SYSTEMS PVT LTD',
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
      format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

  Future<Uint8List> getImageData() async {
    // Load the image from the assets
    final ByteData data = await rootBundle.load('images/vector.png');
    return data.buffer.asUint8List();
  }

  final GetInvoiceController getinvoiceController =
      Get.find<GetInvoiceController>();
  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
      brush: PdfSolidBrush(PdfColor(65, 104, 205)));

  page.graphics.drawString(
      getinvoiceController.totalPrice.value.toString(), ////////////Granttotal
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
      brush: PdfBrushes.white,
      format: PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle));

  final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
  //Draw string
  page.graphics.drawString('Amount', contentFont,
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
      format: PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.bottom));
  //Create data foramt and convert it to text.

  final String invoiceNumber =
      'Date: ${dateConveter(DateTime.parse(getinvoiceController.date.value))}\r\n \r\nInvoice Number: VSCI ${getinvoiceController.invoiceNumber.value} \r\n  \r\nGST number: 32AAFCV1427J1ZH\r\n  \r\nSAC Code: 9992';
  final Size contentSize = contentFont.measureString(invoiceNumber);
  // ignore: leading_newlines_in_multiline_strings
  // String address =
  //     ''' To \r\n\r\n${getinvoiceController.studentName.value}\r\n\r\n${getinvoiceController.studentEmail.value}\r\n\r\n\r\nVectorWind Tech System Pvt.Ltd \r\n\r\nDoor.No.4/461,2nd floor,suites#151,\r\n\r\nValamkottil towers,\r\n\r\n judgemukku,Thrikkakkara P.O,\r\n\r\nKochi-682021,Kerala,India

  //       ''';

  String address =
      '''VectorWind Tech System Pvt.Ltd \r\n\r\n Door.No.4/461,2nd floor,suites#151,\r\n\r\n Valamkottil towers,\r\n\r\n judgemukku,Thrikkakkara P.O,\r\n\r\n Kochi-682021,Kerala,India\r\n\r\n \r\n\r\nTo \r\n\r\n${getinvoiceController.studentName.value}\r\n\r\n${getinvoiceController.studentEmail.value}\r\n\r\n\r\n
         
        ''';

  PdfTextElement(text: invoiceNumber, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
          contentSize.width + 30, pageSize.height - 120));

  return PdfTextElement(text: address, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(30, 120, pageSize.width - (contentSize.width + 30),
          pageSize.height - 120))!;
}

//Draws the grid
void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
  final GetInvoiceController getinvoiceController =
      Get.find<GetInvoiceController>();
  Rect? totalPriceCellBounds;
  Rect? quantityCellBounds;
  //Invoke the beginCellLayout event.
  grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
    final PdfGrid grid = sender as PdfGrid;
    if (args.cellIndex == grid.columns.count - 1) {
      totalPriceCellBounds = args.bounds;
    } else if (args.cellIndex == grid.columns.count - 2) {
      quantityCellBounds = args.bounds;
    }
  };
  //Draw the PDF grid and get the result.
  result = grid.draw(
      page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;

  //Draw grand total.
  page.graphics.drawString('Actual Price\n',
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 10,
          quantityCellBounds!.width, quantityCellBounds!.height));
  page.graphics.drawString(
      '${getinvoiceController.actualPrice.value} /-', //
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(
          totalPriceCellBounds!.left,
          result.bounds.bottom + 10,
          totalPriceCellBounds!.width,
          totalPriceCellBounds!.height));

  // Draw SGST and CGST

  // Add SGST and CGST below Grand Total.

//  page.graphics.drawString('GST : ${getinvoiceController.rxgstPrice.value}',
//       PdfStandardFont(PdfFontFamily.helvetica, 9),
//       bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 30,
//           quantityCellBounds!.width, quantityCellBounds!.height));

  page.graphics.drawString('SGST : ${getinvoiceController.rxcgst.value}/-',
      PdfStandardFont(PdfFontFamily.helvetica, 9),
      bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 50,
          quantityCellBounds!.width, quantityCellBounds!.height));

  page.graphics.drawString('CGST : ${getinvoiceController.rxcgst.value}/-',
      PdfStandardFont(PdfFontFamily.helvetica, 9),
      bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 70,
          quantityCellBounds!.width, quantityCellBounds!.height));
  //     page.graphics.drawString('Total Amount: : ${getinvoiceController.totalPrice.value}',
  // PdfStandardFont(PdfFontFamily.helvetica, 9),
  // bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 90,
  //     quantityCellBounds!.width, quantityCellBounds!.height));
  // Draw total amount.String totalAmountText = 'Total Amount: ${getTotalAmount(grid)}'; // Modify this line

  // String totalAmountText =
  //     'Total Amount: 1000'; // Modify this line

  // page.graphics.drawString(totalAmountText,
  //     PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
  //     bounds: Rect.fromLTWH(
  //         totalPriceCellBounds!.left+20,
  //         result.bounds.bottom + 90,
  //         totalPriceCellBounds!.width,
  //         totalPriceCellBounds!.height));
  //Draw grand total.
  page.graphics.drawString('Total Price',
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(
          quantityCellBounds!.left,
          result.bounds.bottom + 100,
          quantityCellBounds!.width,
          quantityCellBounds!.height));
  page.graphics.drawString(
      "${getinvoiceController.totalPrice.value}/-", //
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(
          totalPriceCellBounds!.left,
          result.bounds.bottom + 100,
          totalPriceCellBounds!.width,
          totalPriceCellBounds!.height));
}
//Draw the invoice footer data.

//Create PDF grid and return
PdfGrid getGrid() {
  final GetInvoiceController getinvoiceController =
      Get.find<GetInvoiceController>();

  //Create a PDF grid
  final PdfGrid grid = PdfGrid();
  //Secify the columns count to the grid.
  grid.columns.add(count: 5);
  //Create the header row of the grid.
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  //Set style
  headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
  headerRow.style.textBrush = PdfBrushes.white;
  headerRow.cells[0].value = 'Course name';
  headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
  headerRow.cells[1].value = '     ';
  headerRow.cells[2].value = 'Quantity';
  headerRow.cells[3].value = 'Amount';
  //Add rows
  addProducts('${getinvoiceController.purchasedCourses}', '     ', 1,
      getinvoiceController.totalPrice.value, grid);

  //Apply the table built-in style
  grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
  //Set gird columns width
  grid.columns[1].width = 200;
  for (int i = 0; i < headerRow.cells.count; i++) {
    headerRow.cells[i].style.cellPadding =
        PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
  }
  for (int i = 0; i < grid.rows.count; i++) {
    final PdfGridRow row = grid.rows[i];
    for (int j = 0; j < row.cells.count; j++) {
      final PdfGridCell cell = row.cells[j];
      if (j == 0) {
        cell.stringFormat.alignment = PdfTextAlignment.center;
      }
      cell.style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
  }
  return grid;
}

//Create and row for the grid.
void addProducts(
    String item, String price, int quantity, String total, PdfGrid grid) {
  final PdfGridRow row = grid.rows.add();
  row.cells[0].value = item;

  row.cells[1].value = price;
  row.cells[2].value = quantity.toString();
  row.cells[3].value = total.toString();
}

//Get the total amount.

