import 'package:cloud_firestore/cloud_firestore.dart';
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
                            color: AppColors.white,
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
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: viewmodel.firestore
                          .collection('messages')
                          .orderBy('timestamp')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<DocumentSnapshot> docs = snapshot.data!.docs;
                        List<Widget> messages = [];

                        for (var doc in docs) {
                          Map<String, dynamic> data =
                              doc.data() as Map<String, dynamic>;
                          String messageText = data['text'];
                          String messageSender = data['sender'];

                          final messageWidget = MessageWidget(
                            text: messageText,
                            isMe: messageSender == viewmodel.user!.uid,
                          );
                          messages.add(messageWidget);
                        }

                        return ListView(
                          children: messages,
                        );
                      },
                    ),
                  ),
                ],
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
                    controller: viewmodel.messageController,
                    hintText: 'Message',
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 60,
                    suffixIcon: Icons.camera_alt_rounded,
                    prefixIcon: Icons.emoji_emotions_rounded,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        if (viewmodel.messageController.text.isNotEmpty) {
                          await viewmodel
                              .sendMessage(viewmodel.messageController.text);
                          viewmodel.messageController.clear();
                        }
                      },
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
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageWidget({
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
