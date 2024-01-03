// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'package:whatsapp/src/reuseable_widget/text/text.dart';
// import 'package:whatsapp/src/views/navigation/updates/store/privacy_policy_viewmodel.dart';

// class PrivacyPolicyView extends StatelessWidget {
//   const PrivacyPolicyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => PrivacyPolicyViewModel(),
//       builder: (context, viewModel, child) {
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Column(
//                 children: [
//                   CustomText.customSizedText(
//                       text: 'Privacy policy',
//                       maxFontSize: 36,
//                       minFontSize: 36,
//                       fontWeight: FontWeight.w600),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Color(0xffB1B1B1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: CustomText.customSizedText(
//                       text:
//                           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
//             Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur''',
//                       maxLine: 100,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   CustomText.customSizedText(
//                       text: 'Privacy policy',
//                       maxFontSize: 36,
//                       minFontSize: 36,
//                       fontWeight: FontWeight.w600),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Color(0xffB1B1B1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: CustomText.customSizedText(
//                       text:
//                           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
//             Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur''',
//                       maxLine: 100,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   CustomText.customSizedText(
//                       text: 'Privacy policy',
//                       maxFontSize: 36,
//                       minFontSize: 36,
//                       fontWeight: FontWeight.w600),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Color(0xffB1B1B1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: CustomText.customSizedText(
//                       text:
//                           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
//             Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur''',
//                       maxLine: 100,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
