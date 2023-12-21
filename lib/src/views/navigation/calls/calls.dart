import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import 'package:whatsapp/src/views/navigation/calls/calls_viewmodel.dart';
import 'package:whatsapp/src/reuseable_widget/text/text.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';
import 'widget/widget.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CallsViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            floatingActionButton: floatingButton(Icons.add_ic_call),
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.indicatorTextColor,
                      child: const Icon(
                        Icons.link_rounded,
                        color: Colors.black,
                      ),
                    ),
                    title: CustomText.customSizedText(text: 'Create call link'),
                    subtitle: Text(
                      'Share a link for your WhatsApp call',
                      style: TextStyle(color: AppColors.textColor),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                  ),
                  child: Text(
                    'Recent updates',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                callsTile(
                  title: 'Bilal',
                  subtitle: 'Today,4:30 PM',
                  url: AppImages.bilal,
                  icon: Icons.call,
                  icon2: Icons.south_west,
                ),
                callsTile(
                  title: 'Humaiyon',
                  subtitle: 'Today,4:35 PM',
                  url: AppImages.humaiyon,
                  icon: Icons.call,
                  icon2: Icons.south_west,
                ),
                callsTile(
                  title: 'Areeb',
                  subtitle: 'Today,4:40 PM',
                  url: AppImages.areeb,
                  icon: Icons.call,
                  icon2: Icons.south_west,
                ),
              ],
            ),
          );
        });
  }
}
