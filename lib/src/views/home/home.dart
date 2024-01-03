// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/views/home/home_viewmodel.dart';
import 'package:whatsapp/src/views/navigation/updates/update.dart';
import 'package:whatsapp/src/reuseable_widget/text/text.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';
import '../navigation/calls/calls.dart';
import '../navigation/chat_section/chats_section.dart';
import 'widget/widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.customSizedText(
                      text: 'WhatsApp', size: 24, fontWeight: FontWeight.w400),
                  SizedBox(
                    child: Row(children: [
                      homeTopIcon(Icons.camera_alt_outlined),
                      homeTopIcon(Icons.search),
                      GestureDetector(
                        onTap: () {
                          viewModel.logOut();
                        },
                        child: homeTopIcon(Icons.more_vert_outlined),
                      ),
                    ]),
                  )
                ],
              ),
              bottom: TabBar(
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Chats',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Updates',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Calls',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5)),
                  ),
                ],
                indicatorColor: AppColors.indicatorTextColor,
                labelColor: AppColors.indicatorTextColor,
                unselectedLabelColor: AppColors.textColor,
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
              ),
            ),
            body: const TabBarView(
              children: [ChatsSection(), Updates(), Calls()],
            ),
          );
        },
      ));
}
