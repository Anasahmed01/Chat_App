import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/reuseable_widget/text/text.dart';
import 'package:whatsapp/src/reuseable_widget/textfields/textfields.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import 'package:whatsapp/src/views/chat/chat_viewmodel.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              automaticallyImplyLeading: false,
              titleSpacing: 5,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_rounded,
                            color: AppColors.whiteColor,
                          ),
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.bilal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: CustomText.customSizedText(
                          text: 'Bilal', maxFontSize: 18, minFontSize: 18),
                      subtitle: CustomText.customSizedText(
                          text: '10:30 PM', maxFontSize: 12, minFontSize: 12),
                    ),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.videocam_rounded,
                          size: 25,
                        ),
                        Icon(Icons.call),
                        Icon(
                          Icons.more_vert_rounded,
                          size: 27,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.chatbackground,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFields.appTextField(
                    hintText: 'Message',
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 60,
                    suffixIcon: Icons.camera_alt_rounded,
                    prefixIcon: Icons.emoji_emotions_rounded,
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.indicatorTextColor),
                      child: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
