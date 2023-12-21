import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import 'package:whatsapp/src/views/navigation/chat_section/chats_section_viewmodel.dart';
import '../../../utils/style/color/colors.dart';
import '../calls/widget/widget.dart';
import 'widget/widget.dart';

class ChatsSection extends StatelessWidget {
  const ChatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatsSectionViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            floatingActionButton: floatingButton(Icons.chat),
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                InkWell(
                  onTap: () {
                    viewModel.navigateToHomeView();
                  },
                  child: listTile(
                      title: 'Bilal',
                      subtitle: 'Kahan ho ajao aj class hai',
                      url: AppImages.bilal,
                      time: '7:00 PM'),
                ),
                listTile(
                    title: 'Anas',
                    subtitle: 'Han jani',
                    url: AppImages.anas,
                    time: '8:00 PM'),
                listTile(
                    title: 'Areeb',
                    subtitle: 'Or bhai kasay ho',
                    url: AppImages.areeb,
                    time: '9:20 PM'),
                listTile(
                    title: 'Humaiyon',
                    subtitle: 'Or kasi chal rahi hai Flutter',
                    url: AppImages.humaiyon,
                    time: '4:10 PM'),
              ],
            ),
          );
        });
  }
}
