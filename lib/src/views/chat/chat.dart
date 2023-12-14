import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
              leading: Row(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(''))),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: child,
          );
        });
  }
}
