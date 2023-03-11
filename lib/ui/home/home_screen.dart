//import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odas_trl_framework/constants/constants.dart';
import 'package:odas_trl_framework/models/widgets/gauges_elements.dart';
import 'package:odas_trl_framework/models/widgets/menus.dart';
import 'package:odas_trl_framework/providers/trl/trl_provider.dart';
import 'package:odas_trl_framework/routes.dart';
/*import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';*/
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
/*import 'dart:async';
import 'dart:convert';
import 'dart:js' as js;*/

import 'package:odas_trl_framework/helper/save_file_mobile.dart'
    if (dart.library.html) 'package:odas_trl_framework/helper/save_file_web.dart';

import '../../models/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Layouts.layout(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Widgets do layout coluna
            children: [
              Menus.menuTop(context),
              const SizedBox(
                height: 70,
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 360,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.blue,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.blue.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 20,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0.08),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 20,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.blue.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Hardware',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 270,
                          positionFactor: 0.3)
                    ],
                  ),

                  // S O F T W A R E

                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.5,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 20, 40, 60, 90],
                      Colors.brown,
                      [
                        'Escritório',
                        'Ambiente \nde Laboratório',
                        'Ambiente \nRelevante',
                        'Ambiente \nOperacional'
                      ],
                      0.12,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.31,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [10, 40, 70, 90],
                      Colors.amber,
                      [
                        'Pesquisa para \ncomprovar viabilidade',
                        'Demonstração \nde Tecnologia',
                        'Teste, inicialização e \noperações do sistema',
                      ],
                      0.18,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 1.065,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grs(
                      [0, 30, 60, 80],
                      Colors.purple,
                      [
                        'Pesquisa de \nTecnologia Básica',
                        'Desenvolvimento \nde Tecnologia',
                        'Desenvolvimento \nde sistema/\nsubsistemas',
                      ],
                      0.30,
                    ),
                  ),
                  RadialAxis(
                    isInversed: true,
                    startAngle: 0,
                    endAngle: 180,
                    maximum: 90,
                    radiusFactor: 0.74,
                    showTicks: false,
                    showAxisLine: false,
                    showLabels: false,
                    showFirstLabel: false,
                    showLastLabel: false,
                    ranges: GaugesElements.grsTRL(
                      Colors.green,
                      0.2,
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.green.shade900.withOpacity(0.5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        value: 26,
                        enableAnimation: true,
                        animationDuration: 2000,
                        animationType: AnimationType.elasticOut,
                        knobStyle: KnobStyle(knobRadius: 0),
                      ),
                      RangePointer(
                        sizeUnit: GaugeSizeUnit.factor,
                        width: 1,
                        //pointerOffset: 0,
                        value: 26,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        color: Colors.green.shade900.withOpacity(0.1),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text('Software',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          angle: 90,
                          positionFactor: 0.3)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Widgets do layout linha
                  children: [
                    InkWell(
                      child: Column(
                        children: <Widget>[
                          const Icon(
                            Icons.settings,
                            color: Colors.blue,
                            size: 80.0,
                          ),
                          Texts.txt1(Constants.buttonDesingParam),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Column(
                      children: <Widget>[
                        const Text(Constants.tipsTrlometro),
                        SzBx.gap30V(),
                        Buttons.bt1('Novo Projeto', Colors.black, () {}),
                        SzBx.gap30V(),
                        Buttons.bt1('Abrir Projeto', Colors.grey, () {}),
                      ],
                    ),
                    Column(children: <Widget>[
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.blue[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessHardware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setHardware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.assessment_outlined,
                              color: Colors.green[900],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonAssessSoftware),
                          ],
                        ),
                        onTap: () {
                          var trl = context.read<TrlProvider>();
                          trl.setSoftware();
                          Navigator.of(context).pushNamed(Routes.trl);
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.description,
                              color: Colors.red[700],
                              size: 60.0,
                            ),
                            Texts.txt1(Constants.buttonGenReport),
                          ],
                        ),
                        onTap: _generatePDF,
                      ),
                    ]),
                  ],
                ),
              ),
              SzBx.gap30V(),
              // Botão INTRO
              Buttons.bt1(
                Constants.buttonIntro,
                Colors.green,
                () {
                  Navigator.pushNamed(
                    context,
                    Routes.intro,
                  );
                },
              ),
            ],
          ));
    
  }
}

  Future<void> _generatePDF() async {
    //Create a new PDF document
    final PdfDocument document = PdfDocument();
    //Draw image
    document.pages.add().graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        const Rect.fromLTWH(50, 50, 425, 642));
    final PdfPage titlePage = document.pages.add();
    //Draw text
    titlePage.graphics.drawString(
        'PDF Succinctly', PdfStandardFont(PdfFontFamily.timesRoman, 30),
        bounds: Rect.fromLTWH(0, 60, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.center));
    titlePage.graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        const Rect.fromLTWH(40, 110, 435, 5));
    final PdfStringFormat format =
        PdfStringFormat(alignment: PdfTextAlignment.center);
    titlePage.graphics.drawString('By\nRyan Hodson',
        PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 130, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: format);
    titlePage.graphics.drawString('Foreword by Daniel Jebaraj',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 220, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: format);
    //Add new Section
    final PdfSection section = document.sections!.add();
    final PdfPage contentPage = section.pages.add();
    _addParagraph(contentPage, 'Table of Contents',
        Rect.fromLTWH(20, 60, 495, contentPage.getClientSize().height), true,
        mainTitle: true);
    //Create a header template and draw a text.
    final PdfPageTemplateElement headerElement =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50), contentPage);
    headerElement.graphics.setTransparency(0.6);
    headerElement.graphics.drawString(
        'PDF Succinctly', PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: const Rect.fromLTWH(0, 0, 515, 50),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.right,
            lineAlignment: PdfVerticalAlignment.middle));
    headerElement.graphics
        .drawLine(PdfPens.gray, const Offset(0, 49), const Offset(515, 49));
    section.template.top = headerElement;
    //Create a footer template and draw a text.
    final PdfPageTemplateElement footerElement =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50), contentPage);
    footerElement.graphics.setTransparency(0.6);
    PdfCompositeField(text: 'Page {0} of {1}', fields: <PdfAutomaticField>[
      PdfPageNumberField(brush: PdfBrushes.black),
      PdfPageCountField(brush: PdfBrushes.black)
    ]).draw(footerElement.graphics, const Offset(450, 35));
    section.template.bottom = footerElement;
    //Add a new PDF page
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();
    //Draw string.
    //Draw text
    PdfLayoutResult result = _addParagraph(
        page, 'Introduction', Rect.fromLTWH(20, 25, 495, pageSize.height), true,
        mainTitle: true);
    //Add to table of content
    PdfLayoutResult tableContent = _addTableOfContents(
        contentPage,
        'Introduction',
        Rect.fromLTWH(20, 110, 470, result.page.getClientSize().height),
        true,
        4,
        20,
        result.bounds.top,
        result.page);
    //Add bookmark
    _addBookmark(page, 'Introduction', result.bounds.topLeft, doc: document);
    result = _addParagraph(
        result.page,
        "Adobe Systems Incorporated's Portable Document Format (PDF) is the de facto standard for the accurate, reliable, and platform-independent representation of a paged document. It's the only universally accepted file format that allows pixel-perfect layouts. In addition, PDF supports user interaction and collaborative workflows that are not possible with printed documents.\n\nPDF documents have been in widespread use for years, and dozens of free and commercial PDF readers, editors, and libraries are readily available. However, despite this popularity, it's still difficult to find a succinct guide to the native PDF format. Understanding the internal workings of a PDF makes it possible to dynamically generate PDF documents. For example, a web server can extract information from a database, use it to customize an invoice, and serve it to the customer on the fly.",
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result = _addParagraph(
        result.page,
        'The PDF Standard',
        Rect.fromLTWH(20, result.bounds.bottom + 25, 495, pageSize.height),
        true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'The PDF Standard',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        4,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'The PDF Standard', result.bounds.topLeft,
        doc: document);
    result = _addParagraph(
        result.page,
        'The PDF format is an open standard maintained by the International Organization for Standardization. The official specification is defined in ISO 32000-1:2008, but Adobe also provides a free, comprehensive guide called PDF Reference, Sixth Edition, version 1.7.',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result = _addParagraph(
        result.page,
        'Chapter 1 Conceptual Overview',
        Rect.fromLTWH(20, result.bounds.bottom + 25, 495, pageSize.height),
        true,
        mainTitle: true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Chapter 1 Conceptual Overview',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        true,
        4,
        20,
        result.bounds.top,
        result.page);
    final PdfBookmark standardBookmark = _addBookmark(
        result.page, 'Chapter 1 Conceptual Overview', result.bounds.topLeft,
        doc: document);
    result = _addParagraph(
        result.page,
        "We'll begin with a conceptual overview of a simple PDF document. This chapter is designed to be a brief orientation before diving in and creating a real document from scratch.\nA PDF file can be divided into four parts: a header, body, cross-reference table, and trailer. The header marks the file as a PDF, the body defines the visible document, the cross-reference table lists the location of everything in the file, and the trailer provides instructions for how to start reading the file.",
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    final PdfPage page2 = document.pages.add();
    page2.graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        const Rect.fromLTWH(10, 0, 495, 600));
    result = _addParagraph(
        page2,
        'Every PDF file must have these four components.',
        Rect.fromLTWH(20, 620, 495, page2.getClientSize().height),
        false);
    result = _addParagraph(document.pages.add(), 'Header',
        Rect.fromLTWH(20, 15, 495, pageSize.height), true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Header',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        6,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'Header', result.bounds.topLeft,
        bookmark: standardBookmark);
    result = _addParagraph(
        result.page,
        'The header is simply a PDF version number and an arbitrary sequence of binary data. The binary data prevents naïve applications from processing the PDF as a text file. This would result in a corrupted file, since a PDF typically consists of both plain text and binary data (e.g., a binary font file can be directly embedded in a PDF).',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result = _addParagraph(
        result.page,
        'Body',
        Rect.fromLTWH(20, result.bounds.bottom + 25, 495, pageSize.height),
        true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Body',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        6,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'Body', result.bounds.topLeft,
        bookmark: standardBookmark);
    result = _addParagraph(
        result.page,
        'The body of a PDF contains the entire visible document. The minimum elements required in a valid PDF body are:\n\n1. A page tree \n2. Pages \n3. Resources \n4. Content \n5. The catalog \n\nThe page tree serves as the root of the document. In the simplest case, it is just a list of the pages in the document. Each page is defined as an independent entity with metadata (e.g., page dimensions) and a reference to its resources and content, which are defined separately. Together, the page tree and page objects create the "paper" that composes the document.\n\nResources are objects that are required to render a page. For example, a single font is typically used across several pages, so storing the font information in an external resource is much more efficient. A content object defines the text and graphics that actually show up on the page. Together, content objects and resources define the appearance of an individual page.\nFinally, the document\'s catalog tells applications where to start reading the document. Often, this is just a pointer to the root page tree.',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    final PdfPage page3 = document.pages.add();
    page3.graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        const Rect.fromLTWH(20, 0, 300, 400));
    result = _addParagraph(page3, 'Cross-Reference Table',
        Rect.fromLTWH(20, 425, 495, pageSize.height), true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Cross-Reference Table',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        7,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'Cross-Reference Table', result.bounds.topLeft,
        bookmark: standardBookmark);
    result = _addParagraph(
        result.page,
        'After the header and the body comes the cross-reference table. It records the byte location of each object in the body of the file. This enables random-access of the document, so when rendering a page, only the objects required for that page are read from the file. This makes PDFs much faster than their PostScript predecessors, which had to read in the entire file before processing it.',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result = _addParagraph(
        result.page,
        'Trailer',
        Rect.fromLTWH(20, result.bounds.bottom + 25, 495, pageSize.height),
        true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Trailer',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        7,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'Trailer', result.bounds.topLeft,
        bookmark: standardBookmark);
    result = _addParagraph(
        result.page,
        'Finally, we come to the last component of a PDF document. The trailer tells applications how to start reading the file. At minimum, it contains three things:\n\n\n1. A reference to the catalog which links to the root of the document.\n2. The location of the cross-reference table.\n3. The size of the cross-reference table.\n\nSince a trailer is all you need to begin processing a document, PDFs are typically read back-to-front: first, the end of the file is found, and then you read backwards until you arrive at the beginning of the trailer. After that, you should have all the information you need to load any page in the PDF.',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result = _addParagraph(
        result.page,
        'Summary',
        Rect.fromLTWH(20, result.bounds.bottom + 25, 495, pageSize.height),
        true);
    tableContent = _addTableOfContents(
        tableContent.page,
        'Summary',
        Rect.fromLTWH(20, tableContent.bounds.bottom, 470,
            result.page.getClientSize().height),
        false,
        8,
        20,
        result.bounds.top,
        result.page);
    _addBookmark(result.page, 'Summary', result.bounds.topLeft,
        bookmark: standardBookmark);
    result = _addParagraph(
        result.page,
        'To conclude our overview, a PDF document has a header, a body, a cross-reference table, and a trailer. The trailer serves as the entryway to the entire document, giving you access to any object via the cross-reference table, and pointing you toward the root of the document. The relationship between these elements is shown in the following figure.',
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, pageSize.height),
        false);
    result.page.graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        Rect.fromLTWH(20, result.bounds.bottom + 20, 495, 400));

    //Save and dispose the document.
    final List<int> bytes = await document.save();
    document.dispose();
    //Launch file.
    await FileSaveHelper.saveAndLaunchFile(bytes, 'Report.pdf');
  }

  PdfLayoutResult _addParagraph(
      PdfPage page, String text, Rect bounds, bool isTitle,
      {bool mainTitle = false}) {
    return PdfTextElement(
            text: text,
            font: PdfStandardFont(
                PdfFontFamily.helvetica,
                isTitle
                    ? mainTitle
                        ? 24
                        : 18
                    : 13,
                style: (isTitle && !mainTitle)
                    ? PdfFontStyle.bold
                    : PdfFontStyle.regular),
            format: mainTitle
                ? PdfStringFormat(alignment: PdfTextAlignment.center)
                : PdfStringFormat(alignment: PdfTextAlignment.justify))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                bounds.left, bounds.top, bounds.width, bounds.height))!;
  }

  PdfBookmark _addBookmark(PdfPage page, String text, Offset point,
      {PdfDocument? doc, PdfBookmark? bookmark, PdfColor? color}) {
    PdfBookmark book;
    if (doc != null) {
      book = doc.bookmarks.add(text);
      book.destination = PdfDestination(page, point);
    } else {
      book = bookmark!.add(text);
      book.destination = PdfDestination(page, point);
    }
    book.color = color ?? PdfColor(0, 0, 0);
    return book;
  }

  PdfLayoutResult _addTableOfContents(PdfPage page, String text, Rect bounds,
      bool isTitle, int pageNo, double x, double y, PdfPage destPage) {
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 13,
        style: isTitle ? PdfFontStyle.bold : PdfFontStyle.regular);
    page.graphics.drawString(pageNo.toString(), font,
        bounds:
            Rect.fromLTWH(480, bounds.top + 5, bounds.width, bounds.height));
    final PdfDocumentLinkAnnotation annotation = PdfDocumentLinkAnnotation(
        Rect.fromLTWH(isTitle ? bounds.left : bounds.left + 20, bounds.top - 45,
            isTitle ? bounds.width : bounds.width - 20, font.height),
        PdfDestination(destPage, Offset(x, y)));
    annotation.border.width = 0;
    page.annotations.add(annotation);
    String str = text + ' ';
    final num value = isTitle
        ? font.measureString(text).width.round() + 20
        : font.measureString(text).width.round() + 40;
    for (num i = value; i < 470;) {
      str = str + '.';
      i = i + 3.6140000000000003;
    }
    return PdfTextElement(text: str, font: font).draw(
        page: page,
        bounds: Rect.fromLTWH(isTitle ? bounds.left : bounds.left + 20,
            bounds.top + 5, bounds.width, bounds.height))!;
  }




Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

Future<void> _createPDF3() async {
  //Create a new PDF document
  final PdfDocument document = PdfDocument();

  // Add page to the PDF document
  final PdfPage page = document.pages.add();

  // Define font styles
  final PdfFont fontBold = PdfStandardFont(PdfFontFamily.helvetica, 16);
  final PdfFont fontNormal = PdfStandardFont(PdfFontFamily.helvetica, 12);

// Add header logo to the PDF document
  page.graphics.drawImage(PdfBitmap(await _readImageData('logo2.png')),
        const Rect.fromLTWH(0, 0, 100, 100));



  // Add project description to the PDF document
  final String projectDescription =
      "This report summarizes the TRL measurement of the Ocean Data Acquisition System for Hardware and Software components.";
  page.graphics.drawString(projectDescription, fontBold,
      bounds: Rect.fromLTWH(50, 60, 500, 50));

  // Add table to the PDF document
  final PdfGrid grid = PdfGrid();
  grid.columns.add(count: 3);
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  headerRow.cells[0].value = 'Measurement Date';
  headerRow.cells[1].value = 'Last Task Performed';
  headerRow.cells[2].value = 'TRL Level';
  // Add data to the table (last 3 measurements)
  final List<Map<String, dynamic>> measurements = [
    {
      'date': '01/01/2023',
      'task': 'Completed Task A',
      'trlLevel': 'TRL 6'
    },
    {
      'date': '02/01/2023',
      'task': 'Completed Task B',
      'trlLevel': 'TRL 5'
    },
    {
      'date': '03/01/2023',
      'task': 'Completed Task C',
      'trlLevel': 'TRL 4'
    },
  ];
  for (final measurement in measurements) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = measurement['date'];
    row.cells[1].value = measurement['task'];
    row.cells[2].value = measurement['trlLevel'];
    if (measurement == measurements[0]) {
      // Highlight the row of the latest measurement
      row.style.backgroundBrush =
          PdfSolidBrush(PdfColor.fromCMYK(0.49, 0.04, 0, 0.25));
    }
  }
  grid.draw(
      page: page,
      bounds: Rect.fromLTWH(50, 140, page.getClientSize().width - 100, 120));

  // Add TRL level objective to the PDF document
  final String trlObjective = 'TRL Level Objective: TRL 8';
  page.graphics.drawString(trlObjective, fontBold,
      bounds: Rect.fromLTWH(50, 290, 500, 50));

  //Save and dispose the document.
    final List<int> bytes = await document.save();
    document.dispose();
    //Launch file.
    await FileSaveHelper.saveAndLaunchFile(bytes, 'Report.pdf');
  
/*
  //Add a new page and draw text
  document.pages.add().graphics.drawString(
      'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(0, 0, 500, 50));
*/
/*
  //Save the document
  List<int> bytes = await document.save();

  //Saves the document
  //File('Output.pdf').writeAsBytes(bytes);

  //Dispose the document
  document.dispose();

  js.context['pdfData'] = base64.encode(bytes);
  js.context['filename'] = 'Output.pdf';
  Timer.run(() {
    js.context.callMethod('download');
  });*/
}

Future<void> _createPDF2() async {
  // Initialize the PDF document
  PdfDocument document = PdfDocument();

  // Add page to the PDF document
  PdfPage page = document.pages.add();

  // Define font styles
  final PdfFont fontBold = PdfStandardFont(PdfFontFamily.helvetica, 16);
  final PdfFont fontNormal = PdfStandardFont(PdfFontFamily.helvetica, 12);

  // Add header logo to the PDF document
  final PdfImage logoImage = PdfBitmap(await File('assets/images/logo.png').readAsBytes());
  page.graphics.drawImage(
      logoImage, Rect.fromLTWH(0, 0, page.getClientSize().width, 50));

  // Add project description to the PDF document
  final String projectDescription =
      "This report summarizes the TRL measurement of the Ocean Data Acquisition System for Hardware and Software components.";
  page.graphics.drawString(projectDescription, fontBold,
      bounds: Rect.fromLTWH(50, 60, 500, 50));

  // Add table to the PDF document
  final PdfGrid grid = PdfGrid();
  grid.columns.add(count: 3);
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  headerRow.cells[0].value = 'Measurement Date';
  headerRow.cells[1].value = 'Last Task Performed';
  headerRow.cells[2].value = 'TRL Level';
  // Add data to the table (last 3 measurements)
  final List<Map<String, dynamic>> measurements = [
    {
      'date': '01/01/2023',
      'task': 'Completed Task A',
      'trlLevel': 'TRL 6'
    },
    {
      'date': '02/01/2023',
      'task': 'Completed Task B',
      'trlLevel': 'TRL 5'
    },
    {
      'date': '03/01/2023',
      'task': 'Completed Task C',
      'trlLevel': 'TRL 4'
    },
  ];
  for (final measurement in measurements) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = measurement['date'];
    row.cells[1].value = measurement['task'];
    row.cells[2].value = measurement['trlLevel'];
    if (measurement == measurements[0]) {
      // Highlight the row of the latest measurement
      row.style.backgroundBrush =
          PdfSolidBrush(PdfColor.fromCMYK(0.49, 0.04, 0, 0.25));
    }
  }
  grid.draw(
      page: page,
      bounds: Rect.fromLTWH(50, 140, page.getClientSize().width - 100, 120));

  // Add TRL level objective to the PDF document
  final String trlObjective = 'TRL Level Objective: TRL 8';
  page.graphics.drawString(trlObjective, fontBold,
      bounds: Rect.fromLTWH(50, 290, 500, 50));

  // Add TRL level sections to the PDF document
  final List<String> trlLevelTitles = [
    '1. Basic principles observed and reported',
    '2. Technology concept and/or application formulated',
    '3. Analytical and experimental critical function and/or characteristic'];

    //Save the document
  List<int> bytes = await document.save();

  //Dispose the document
  document.dispose();
/*
  js.context['pdfData'] = base64.encode(bytes);
  js.context['filename'] = 'Output.pdf';
  Timer.run(() {
    js.context.callMethod('download');
  });*/
}
