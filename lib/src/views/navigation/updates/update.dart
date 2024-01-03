import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/views/navigation/calls/calls_viewmodel.dart';
import 'package:whatsapp/src/reuseable_widget/text/text.dart';
import '../../../utils/style/color/colors.dart';
import '../../../utils/style/images/images.dart';
import '../calls/widget/widget.dart';
import 'widget/widget.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CallsViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                floatingButtonEdit(Icons.edit),
                floatingButton(Icons.camera_alt_rounded)
              ],
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.customSizedText(
                          text: 'Status',
                          size: 20,
                          fontWeight: FontWeight.w600),
                      Icon(
                        Icons.more_vert_outlined,
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  textColor: AppColors.white,
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(AppImages.anas),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30,
                          top: 30,
                          child: CircleAvatar(
                            backgroundColor: AppColors.indicatorTextColor,
                            radius: 10,
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: CustomText.customSizedText(
                      text: 'My status', size: 18, fontWeight: FontWeight.w600),
                  subtitle: CustomText.customSizedText(
                      text: 'Tap to add status update',
                      color: AppColors.textColor),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 15,
                  ),
                  child: Text(
                    'Recent updates',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                )
              ],
            ),
          );
        });
  }
}
