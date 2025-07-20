// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Map<String, String>> meals = [
//     {
//       'day': 'M',
//       'image': Assets.icons.proteinIconTemp.path,
//       'meal': 'Cheese Burger',
//       'icon': Assets.icons.browerIcon.path,
//     },
//     {
//       'day': 'T',
//       'image': Assets.icons.proteinIconTemp01.path,
//       'meal': 'Pasta Primavera',
//       'icon': Assets.icons.browerIcon.path,
//     },
//     {
//       'day': 'W',
//       'image': Assets.icons.proteinIconTemp02.path,
//       'meal': 'Sushi Rolls',
//       'icon': Assets.icons.doucementIcn.path,
//     },
//     {
//       'day': 'T',
//       'image': Assets.icons.proteinIconTemp03.path,
//       'meal': 'Vegetable Pizza',
//       'icon': Assets.icons.browerIcon.path,
//     },
//     {
//       'day': 'F',
//       'image': Assets.icons.proteinIconTemp04.path,
//       'meal': 'Paella',
//       'icon': Assets.icons.browerIcon.path,
//     },
//     {
//       'day': 'S',
//       'image': Assets.icons.proteinIconTemp05.path,
//       'meal': 'Boiled Eggs',
//       'icon': Assets.icons.doucementIcn.path,
//     },
//     {
//       'day': 'S',
//       'image': Assets.icons.proteinIconTemp06.path,
//       'meal': 'Chocolate Cake',
//       'icon': Assets.icons.browerIcon.path,
//     },
//   ];
//   Future<pw.ImageProvider> loadPdfImage(String assetPath) async {
//     final bytes = await rootBundle.load(assetPath);
//     return pw.MemoryImage(bytes.buffer.asUint8List());
//   }

//   Future<void> generatePDF() async {
//     final pdf = pw.Document();

//     final tableRows = <pw.TableRow>[];

//     // Header row

//     for (final meal in meals) {
//       final iconImage = await loadPdfImage(meal['icon']!);
//       final mealImage = await loadPdfImage(meal['image']!);

//       tableRows.add(
//         pw.TableRow(
//           decoration: pw.BoxDecoration(
//             border: pw.Border.symmetric(
//               horizontal: pw.BorderSide(color: PdfColors.grey400, width: 0.5),
//             ),
//           ),
//           children: [
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(8),
//               child: pw.Center(child: pw.Text(meal['day'] ?? '')),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(8),
//               child: pw.Center(
//                 child: pw.Image(mealImage, height: 25, width: 25),
//               ),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(8),
//               child: pw.Text(meal['meal'] ?? ''),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(8),
//               child: pw.Center(
//                 child: pw.Image(iconImage, height: 20, width: 20),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               "My Meal Mix",
//               style: pw.TextStyle(
//                 fontSize: 24,
//                 color: PdfColors.deepOrange,
//                 fontWeight: pw.FontWeight.bold,
//               ),
//             ),
//             pw.SizedBox(height: 16),
//             pw.Table(
//               columnWidths: {
//                 0: const pw.FixedColumnWidth(30),
//                 1: const pw.FixedColumnWidth(50),
//                 2: const pw.FlexColumnWidth(2),
//                 3: const pw.FixedColumnWidth(30),
//               },
//               border: pw.TableBorder.all(color: PdfColors.grey400),
//               children: tableRows,
//             ),
//           ],
//         ),
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         showBackArrow: false,
//         title: 'My Meal Mix',
//         titleStyle: TextFontStyle.textStylec24cFF4A26PlusJakartaSans600
//             .copyWith(fontSize: 20.sp),
//         actions: [
//           InkWell(
//             onTap: () {
//               showMealInfoDialog(
//                 context: context,
//                 imagePath: Assets.icons.logoutIcon.path,
//                 title: "Log Out",
//                 showCloseButton: false,
//                 bottom: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 120.w,
//                       child: CustomButton(
//                         fillColor: AppColors.cFFFFFF,
//                         border: Border.all(color: AppColors.allPrimaryColor),
//                         buttonType: ButtonType.secondary,
//                         text: 'Cancel',
//                         textStyle: TextFontStyle
//                             .textStylec24cFF4A26PlusJakartaSans600
//                             .copyWith(fontSize: 16.sp),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: 120.w,
//                       child: CustomButton(
//                         text: 'Log Out',
//                         onPressed: () {
//                           NavigationService.navigateToUntilReplacement(
//                             Routes.logInScreen,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 description: 'Are you sure you want to logout this account',
//               );
//             },
//             child: Padding(
//               padding: EdgeInsets.only(right: 16.w),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(100.r),
//                 child: Image.asset(
//                   Assets.images.errorImage.path,
//                   height: 40.h,
//                   width: 40.w,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//         ],
//         isSuffix: true,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
//             child: Column(
//               children: [
//                 ListView.builder(
//                   itemCount: meals.length,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     final item = meals[index];
//                     return Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft:
//                               index == 0 ? Radius.circular(16.r) : Radius.zero,
//                           topRight:
//                               index == 0 ? Radius.circular(16.r) : Radius.zero,
//                           bottomLeft: index == meals.length - 1
//                               ? Radius.circular(16.r)
//                               : Radius.zero,
//                           bottomRight: index == meals.length - 1
//                               ? Radius.circular(16.r)
//                               : Radius.zero,
//                         ),
//                         border: Border(
//                           top: index == 0
//                               ? BorderSide(color: AppColors.c8F8F8F, width: 1.w)
//                               : BorderSide.none,
//                           left: BorderSide(
//                             color: AppColors.c8F8F8F,
//                             width: 1.w,
//                           ),
//                           right: BorderSide(
//                             color: AppColors.c8F8F8F,
//                             width: 1.w,
//                           ),
//                           bottom: BorderSide(
//                             color: AppColors.c8F8F8F,
//                             width: 1.w,
//                           ),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             width: 45.w,
//                             height: 70.h,
//                             child: Center(
//                               child: Text(
//                                 item['day']!,
//                                 style: TextFontStyle
//                                     .textStylec24c000000PlusJakartaSans600
//                                     .copyWith(fontSize: 16.sp),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 82.h,
//                             width: 1.w,
//                             color: AppColors.c8F8F8F,
//                           ),
//                           SizedBox(
//                             width: 55.w,
//                             height: 70.h,
//                             child: Center(
//                               child: Image.asset(
//                                 item['image']!,
//                                 height: 30.h,
//                                 width: 30.w,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 82.h,
//                             width: 1.w,
//                             color: AppColors.c8F8F8F,
//                           ),
//                           SizedBox(
//                             width: 185.w,
//                             height: 70.h,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.all(8.sp),
//                                 child: Text(
//                                   item['meal']!,
//                                   textAlign: TextAlign.start,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 82.h,
//                             width: 1.w,
//                             color: AppColors.c8F8F8F,
//                           ),
//                           SizedBox(
//                             width: 35.w,
//                             height: 70.h,
//                             child: InkWell(
//                               onTap: () {
//                                 log('message');

//                                 showMealInfoDialog(
//                                   context: context,
//                                   imagePath: Assets.icons.fishIcon.path,
//                                   // Replace with your asset
//                                   title: 'Garlic Butter Shrimp.',
//                                   description:
//                                       'Just throw it in a pan with some fresh herbs and squeeze a lemon on top! Oh, and don’t forget to thaw the shrimp the night before!',
//                                 );
//                               },
//                               child: Center(
//                                 child: Image.asset(
//                                   item['icon']!,
//                                   height: 20.h,
//                                   width: 20.w,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//                 UIHelper.verticalSpace(10.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class UserPrintScreen extends StatefulWidget {
  const UserPrintScreen({super.key});

  @override
  State<UserPrintScreen> createState() => _UserPrintScreenState();
}

class _UserPrintScreenState extends State<UserPrintScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  // Function to generate the PDF
  Future<Uint8List> _generatePdf(String name, String age) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) => pw.Container(
          padding: const pw.EdgeInsets.all(32),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                "User Information",
                style: pw.TextStyle(
                  fontSize: 32,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.deepOrange,
                ),
              ),
              pw.SizedBox(height: 24),
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.orange50,
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.deepOrange, width: 1),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("👤 Name: $name",
                        style: const pw.TextStyle(fontSize: 20)),
                    pw.SizedBox(height: 12),
                    pw.Text("🎂 Age: $age",
                        style: const pw.TextStyle(fontSize: 20)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return pdf.save();
  }

  // Button press handler
  void _onPrintPressed() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();

    if (name.isEmpty || age.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    await Printing.layoutPdf(
      onLayout: (format) => _generatePdf(name, age),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Print User Info"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Enter your name"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Enter your age"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _onPrintPressed,
              icon: const Icon(Icons.print),
              label: const Text("Print"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfGeneratorScreen extends StatelessWidget {
  const PdfGeneratorScreen({super.key});

  Future<void> generateResumePdf(BuildContext context) async {
    final pdf = pw.Document();

    // Add a page with formatted text and layout
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Title Section
              pw.Text(
                'Narin Kongmajai',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                '1234 Phayathai Road, Pathumwan, Bangkok 10330 | (662) 218-1234 | narinkongmajai@gmail.com',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Divider(),

              // Summary Section
              pw.Text(
                'SUMMARY',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Self-motivated; able to learn on own initiative. Capable of working with anyone, funny, and outgoing. Eager to learn everything about the international business and marketing. Positive attitude, respectful, and courteous manner.',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Education Section
              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Chulalongkorn University – Chulalongkorn Business School',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Bachelor of Business Administration, Concentration in International Business',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Cumulative GPA: 3.73 / 4.00 - May 2015',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              pw.Text(
                'University of Southern California',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'USC Marshall International Exchange Program participant',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Spring 2014 - Los Angeles, CA',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Experience Section
              pw.Text(
                'EXPERIENCE',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                '1234 Company, Inc.',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Brokerage, E-Business and Research Intern - Summer 2014',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text: 'Shadows Brokers and E-Business employees',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text:
                    'Visited a company and wrote a recommendation paper for its IPO',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text: 'Wrote interview questions for a television program',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Skills Section
              pw.Text(
                'SKILLS & INTERESTS',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Languages: Fluent in Thai, English, and Chinese',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Computer Skills: Microsoft Office, Adobe Photoshop',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Interests: Baking, traveling, running, and reading',
                style: const pw.TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );

    // Save PDF to file
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/resume.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Open the PDF
      await OpenFile.open(filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF generated successfully!')),
      );
    } catch (e) {
      print('Error saving PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to generate PDF')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Generator')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => generateResumePdf(context),
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}
