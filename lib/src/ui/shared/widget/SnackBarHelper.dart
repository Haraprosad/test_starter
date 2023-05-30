// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../ext/ext.dart';

// class SnackBarHelper {
//   static void showSuccess(messageText) {
//     if (Get.context == null) return;

//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
//         backgroundColor: Color(0xff464646),
//         content: Row(
//           children: [
//             Icon(
//               Icons.check,
//               color: Colors.white,
//               size: 28.0.w,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Flexible(
//               child: Text(
//                 messageText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.0.fontSize,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   static void showInfo(messageText) {
//     if (Get.context == null) return;

//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
//         backgroundColor: Color(0xff464646),
//         content: Row(
//           children: [
//             Icon(
//               Icons.check,
//               color: Colors.white,
//               size: 28.0.w,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Flexible(
//               child: Text(
//                 messageText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.0.fontSize,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   static void showError(messageText, {int time = 5}) {
//     if (Get.context == null) return;

//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
//         backgroundColor: Color(0xff464646),
//         content: Row(
//           children: [
//             Icon(
//               Icons.check,
//               color: Colors.white,
//               size: 28.0.w,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Flexible(
//               child: Text(
//                 messageText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.0.fontSize,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   static void showLoading(messageText) {
//     if (Get.context == null) return;

//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
//         backgroundColor: Color(0xff464646),
//         content: Column(
//           children: [
//             Flexible(
//               child: Text(
//                 messageText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.0.fontSize,
//                 ),
//               ),
//             ),
//             LinearProgressIndicator()
//           ],
//         ),
//       ),
//     );
//   }
// }
